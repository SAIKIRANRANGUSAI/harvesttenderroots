require("dotenv").config();
const express = require("express");
const path = require("path");
const session = require("express-session");
const mysql = require("mysql2/promise"); // Using mysql2 with async/await
const app = express();


// // -------------------- DATABASE CONFIG -------------------- //
// const db = require("./config/db"); // your db.js exports a pool or connection

// // Make db accessible in req for controllers
// app.use((req, res, next) => {
//   req.db = db;
//   next();
// });
app.use(express.static(path.join(__dirname, 'public')));
// -------------------- VIEW ENGINE -------------------- //
app.set("view engine", "ejs");
app.set("views", [
  path.join(__dirname, "views"),
  path.join(__dirname, "admin/views")
]);


// // -------------------- MIDDLEWARE -------------------- //
// app.use(express.urlencoded({ extended: true }));
// app.use(express.json());

// // Serve static files
// app.use(express.static(path.join(__dirname, "public")));
// app.use("/uploads", express.static(path.join(__dirname, "uploads")));
// app.use("/admin/static", express.static(path.join(__dirname, "admin/public")));

// // -------------------- SESSION -------------------- //
// app.use(
//   session({
//     secret: process.env.SESSION_SECRET || "your_secret_key",
//     resave: false,
//     saveUninitialized: false,
//     cookie: { secure: false }, // set true if using HTTPS
//   })
// );

// // -------------------- GLOBAL FOOTER / HEADER DATA -------------------- //
// app.use(async (req, res, next) => {
//   try {
//     const [contactRows] = await db.query("SELECT * FROM contact_details ORDER BY id DESC LIMIT 1");
//     const [socialRows] = await db.query("SELECT * FROM admin_social ORDER BY id DESC LIMIT 1");
//     const [logoRows] = await db.query("SELECT logo FROM settings ORDER BY id DESC LIMIT 1");

//     res.locals.footerData = {
//       contact: contactRows[0] || null,
//       social: socialRows[0] || null
//     };
//     res.locals.logo = logoRows.length ? logoRows[0].logo : "/admin/static/images/logo.png";
//     next();
//   } catch (err) {
//     console.error("Global middleware error:", err);
//     res.locals.footerData = { contact: null, social: null };
//     res.locals.logo = "/admin/static/images/logo.png";
//     next();
//   }
// });

// // -------------------- FRONTEND ROUTES -------------------- //
// const indexRoutes = require("./routes/indexRoutes");
// const aboutUsRoutes = require("./routes/aboutUsRoutes");
// // Add other route imports similarly
// // const contactRoutes = require("./routes/contactRoutes");
// // ...

// app.use("/", indexRoutes);
// app.use("/about-us", aboutUsRoutes);
// // Add other frontend routes
// // app.use("/contact", contactRoutes);

// // -------------------- ADMIN ROUTES -------------------- //
// const adminRoutes = require("./admin/routes/adminRoutes");
// const adminAboutRoutes = require("./admin/routes/adminAboutRoutes");
// app.use("/admin", adminRoutes);
// app.use("/admin/about-us", adminAboutRoutes);

// // -------------------- AUTH -------------------- //
// app.get("/admin/login", async (req, res) => {
//   res.render("login", { logo: res.locals.logo, error: null });
// });

// app.post("/admin/login", async (req, res) => {
//   const { username, password } = req.body;
//   try {
//     const [rows] = await db.query("SELECT * FROM admins WHERE username = ?", [username]);
//     if (rows.length === 0) return res.render("login", { logo: res.locals.logo, error: "Invalid credentials" });

//     const bcrypt = require("bcrypt");
//     const match = await bcrypt.compare(password, rows[0].password);
//     if (!match) return res.render("login", { logo: res.locals.logo, error: "Invalid credentials" });

//     req.session.admin = { id: rows[0].id, username: rows[0].username };
//     res.redirect("/admin/dashboard");
//   } catch (err) {
//     console.error(err);
//     res.render("login", { logo: res.locals.logo, error: "Something went wrong" });
//   }
// });

// app.get("/admin/logout", (req, res) => {
//   req.session.destroy();
//   res.redirect("/admin/login");
// });

// // -------------------- TEST ROUTES -------------------- //
// app.get("/test-db", async (req, res) => {
//   try {
//     const [results] = await db.query("SELECT 1 + 1 AS result");
//     res.send(`Database Connected! Result: ${results[0].result}`);
//   } catch (err) {
//     console.error(err);
//     res.status(500).send("Database connection failed");
//   }
// });


const indexRoutes = require("./routes/indexRoutes");
const aboutUsRoutes = require("./routes/aboutUsRoutes");
const admissionProcedureRoutes = require("./routes/admissionProcedureRoutes");
const alumniRoutes = require("./routes/alumniRoutes");
const contactRoutes = require("./routes/contactRoutes");
const danceRoutes = require("./routes/danceRoutes");
const feeStructureRoutes = require("./routes/feeStructureRoutes");
const galleryRoutes = require("./routes/galleryRoutes");
const principalMessageRoutes = require("./routes/principalMessageRoutes");
const schoolInfoRoutes = require("./routes/schoolInfoRoutes");
const staffRoutes = require("./routes/staffRoutes");
const studentEnrollmentRoutes = require("./routes/studentEnrollmentRoutes");
const yogaRoutes = require("./routes/yogaRoutes");

app.use("/", indexRoutes);
app.use("/about-us", aboutUsRoutes);
app.use("/admission-procedure", admissionProcedureRoutes);
app.use("/alumni", alumniRoutes);
app.use("/contact", contactRoutes);
app.use("/dance", danceRoutes);
app.use("/fee-structure", feeStructureRoutes);
app.use("/gallery", galleryRoutes);
app.use("/principal-message", principalMessageRoutes);
app.use("/school-info", schoolInfoRoutes);
app.use("/staff", staffRoutes);
app.use("/student-enrollment", studentEnrollmentRoutes);
app.use("/yoga", yogaRoutes);

// -------------------- SERVER -------------------- //
// Only start server locally
if (require.main === module) {
  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () => console.log(`🚀 Server running at http://localhost:${PORT}`));
}

module.exports = app; // Export for serverless / testing
