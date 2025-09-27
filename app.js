require("dotenv").config();
const express = require("express");
const db = require('./config/db');
const path = require("path");
const session = require("express-session");
const mysql = require("mysql2/promise"); // Using mysql2 with async/await
const cookieParser = require("cookie-parser");
const fs = require('fs');
const mysqldump = require('mysqldump');


const app = express();
const fetchMenuFacilities = require('./middleware/fetchMenuFacilities'); // correct relative path
// const session = require('express-session');
const flash = require('connect-flash');

app.use(session({
  secret: 'yoursecretkey',
  resave: false,
  saveUninitialized: true
}));
app.use(flash());

// -------------------- MIDDLEWARE -------------------- //

// Parse form data & JSON
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Parse cookies
app.use(cookieParser());

// Static files
app.use(express.static(path.join(__dirname, "public")));

// -------------------- VIEW ENGINE -------------------- //
app.set("view engine", "ejs");
app.set("views", [
  path.join(__dirname, "views"),       // frontend views
  path.join(__dirname, "admin/views")  // admin views
]);
// 1️⃣ Load site settings
app.use(async (req, res, next) => {
  try {
    const [rows] = await db.execute('SELECT * FROM site_settings WHERE id = 1');
    res.locals.siteSettings = rows.length
      ? {
          site_logo: rows[0].site_logo,
          favicon: rows[0].favicon,
          site_title: rows[0].site_title,
          site_description: rows[0].site_description,
          facebook: rows[0].facebook,
          instagram: rows[0].instagram,
          pinterest: rows[0].pinterest,
          twitter: rows[0].twitter,
          address: rows[0].address,
          email: rows[0].email,
          phone: rows[0].phone,
        }
      : {};
    next();
  } catch (err) {
    console.error('Error loading site settings:', err);
    res.locals.siteSettings = {};
    next();
  }
});

// 2️⃣ Load SEO settings (can now safely use siteSettings)
app.use(async (req, res, next) => {
  try {
    let slug = req.path === "/" ? "home" : req.path.replace("/", "");
    const [seoRows] = await db.execute("SELECT * FROM seo_settings WHERE page_slug = ?", [slug]);

    res.locals.seo = seoRows.length
      ? seoRows[0]
      : {
          meta_title: res.locals.siteSettings.site_title || '',
          meta_description: res.locals.siteSettings.site_description || '',
          meta_keywords: res.locals.siteSettings.site_title || '',
          og_title: res.locals.siteSettings.site_title || '',
          og_description: res.locals.siteSettings.site_description || '',
          og_image: res.locals.siteSettings.site_logo || '',
          twitter_title: res.locals.siteSettings.site_title || '',
          twitter_description: res.locals.siteSettings.site_description || '',
          twitter_image: res.locals.siteSettings.site_logo || '',
          canonical_url: req.protocol + "://" + req.get("host") + req.originalUrl,
        };

    next();
  } catch (err) {
    console.error("Error loading SEO settings:", err);
    res.locals.seo = {};
    next();
  }
});

app.get('/admin/settings/download-db', async (req, res) => {
  try {
    const backupsDir = path.join(__dirname, 'backups');

    // Ensure the backups folder exists
    if (!fs.existsSync(backupsDir)) {
      fs.mkdirSync(backupsDir, { recursive: true });
    }

    const fileName = `backup_${Date.now()}.sql`;
    const filePath = path.join(backupsDir, fileName);

    // Dump database
    await mysqldump({
      connection: {
        host: process.env.DB_HOST || '46.250.225.169',
        user: process.env.DB_USER || 'demo_colormo_usr',
        password: process.env.DB_PASSWORD || 'QRdKdVpp3pnNhXBt',
        database: process.env.DB_NAME || 'harvesttenderroots_website',
      },
      dumpToFile: filePath,
    });

    // Ensure file exists before sending
    fs.access(filePath, fs.constants.F_OK, (err) => {
      if (err) {
        console.error('Backup file not found:', err);
        return res.status(500).send('Backup failed.');
      }
      res.download(filePath, fileName, (err) => {
        if (err) {
          console.error('Error sending file:', err);
          return res.status(500).send('Download failed.');
        }
      });
    });

  } catch (err) {
    console.error('Database export failed:', err);
    res.status(500).send('Database export failed.');
  }
});

// 3️⃣ Fetch menu/facilities after settings
app.use(fetchMenuFacilities);

// -------------------- ROUTES -------------------- //
const frontendRoutes = require("./routes/frontend");
const adminRoutes = require("./routes/admin");

app.use("/", frontendRoutes);       // all public pages
app.use("/admin", adminRoutes);     // all admin panel pages


// Apply middleware globally

// Universal route to fetch site settings
// Middleware to make site settings available globally in all EJS templates

// -------------------- START SERVER -------------------- //
if (require.main === module) {
  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () =>
    console.log(`🚀 Server running at http://localhost:${PORT}`)
  );
}



module.exports = app; // Export for serverless / testing
