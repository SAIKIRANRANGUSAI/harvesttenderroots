const express = require("express");
const router = express.Router();
const db = require("../config/db");

// Home page
router.get("/", async (req, res) => {
  try {
    // Hero Section
    const [rows] = await db.query("SELECT * FROM hero_section WHERE id = 1");
    const homeContent = rows[0] || {};

    // Core Values
    const [rowss] = await db.query("SELECT * FROM core_values ORDER BY id ASC");
    const values = rowss;

    // Site Content
    const [siteRows] = await db.query("SELECT * FROM site_content LIMIT 1");
    const content = siteRows[0] || {};

    // Why Choose Us
    const [whyRows] = await db.query("SELECT * FROM why_choose_us WHERE id = 1");
    const why = whyRows[0] || {};

    // Fun Classes
    const [rowsf] = await db.query("SELECT * FROM fun_classes WHERE id = 1");
    const fun = rowsf[0] || {};
    const [events] = await db.query("SELECT * FROM beyond_classrooms ORDER BY id ASC");
     const [funFactsRows] = await db.query("SELECT * FROM fun_facts LIMIT 1");
    const funRow = funFactsRows[0] || {};
    const funFacts = [
      { heading: funRow.heading1, number: funRow.number1, image: funRow.image1 },
      { heading: funRow.heading2, number: funRow.number2, image: funRow.image2 },
      { heading: funRow.heading3, number: funRow.number3, image: funRow.image3 },
      { heading: funRow.heading4, number: funRow.number4, image: funRow.image4 },
    ];
    // ✅ Render frontend homepage with DB data
    res.render("frontend/index", { homeContent, values, content, why, fun, events, funFacts });
  } catch (err) {
    console.error("Frontend home error:", err);
    res.status(500).send("Server error");
  }
});

// About Us
router.get("/about-us", async (req, res) => {
  try {
    const [siteRows] = await db.query("SELECT * FROM site_content LIMIT 1");
    const content = siteRows[0] || {};

    // ✅ Render correct EJS file
    res.render("frontend/about-us", { content });
  } catch (err) {
    console.error("Frontend about-us error:", err);
    res.status(500).send("Server error");
  }
});


// Admission Procedure
// GET admission procedure page (frontend)
router.get("/admission-procedure", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM admission_info LIMIT 1");
    const admission = rows[0] || null;

    res.render("frontend/admission-procedure", { admission });
  } catch (err) {
    console.error("Error fetching admission info:", err);
    res.status(500).send("Server error");
  }
});


// Alumni
router.get("/alumini", (req, res) => {
  res.render("frontend/alumini");
});

// Blog View
router.get("/blog-view", (req, res) => {
  res.render("frontend/blog-view");
});

// Contact
router.get("/contact", (req, res) => {
  res.render("frontend/contact");
});

// Dance
router.get("/dance", (req, res) => {
  res.render("frontend/dance");
});

// Fee Structure
router.get("/fee-structure", (req, res) => {
  res.render("frontend/fee-structure");
});

// Gallery
router.get("/gallery", (req, res) => {
  res.render("frontend/gallery");
});

// Gallery View
router.get("/gallery-view", (req, res) => {
  res.render("frontend/gallery-view");
});

// Principal Message
router.get("/principal-message", async (req, res) => {
  try {
    const [messages] = await db.query("SELECT * FROM principal_message ORDER BY id ASC");
    // console.log("Fetched messages from DB:", messages); // 🔍 check this
    res.render("frontend/principal-message", { messages });
  } catch (err) {
    // console.error("Error fetching principal messages:", err);
    res.status(500).send("Server error");
  }
});




// School Info
// School Info
router.get("/school-info", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM school_info ORDER BY id ASC");
    res.render("frontend/school-info", { info: rows });
  } catch (err) {
    console.error("School Info error:", err);
    res.status(500).send("Server error");
  }
});


// Staff
router.get("/staff", (req, res) => {
  res.render("frontend/staff");
});

// Student Enrollment
router.get("/student-enrollment", (req, res) => {
  res.render("frontend/student-enrollment");
});

// Yoga
router.get("/yoga", (req, res) => {
  res.render("frontend/yoga");
});

module.exports = router;
