require("dotenv").config();
const express = require("express");
const path = require("path");
const session = require("express-session");
const mysql = require("mysql2/promise"); // Using mysql2 with async/await
const cookieParser = require("cookie-parser");

const app = express();
const fetchMenuFacilities = require('./middleware/fetchMenuFacilities'); // correct relative path

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
app.use(fetchMenuFacilities);
// -------------------- ROUTES -------------------- //
const frontendRoutes = require("./routes/frontend");
const adminRoutes = require("./routes/admin");

app.use("/", frontendRoutes);       // all public pages
app.use("/admin", adminRoutes);     // all admin panel pages


// Apply middleware globally



// -------------------- START SERVER -------------------- //
if (require.main === module) {
  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () =>
    console.log(`🚀 Server running at http://localhost:${PORT}`)
  );
}


module.exports = app; // Export for serverless / testing
