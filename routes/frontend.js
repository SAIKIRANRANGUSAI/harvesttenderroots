const express = require("express");
const router = express.Router();
const db = require("../config/db");
const he = require("he");


// Example: get recent events excluding current
// const recentEvents = await db.Events.findAll({
//   where: {
//     id: { [Op.ne]: eventDetail.id } // exclude current event
//   },
//   limit: 5,
//   order: [['event_date', 'DESC']]
// });




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
    const [eventsList] = await db.query("SELECT * FROM events ORDER BY event_date ASC LIMIT 3");

    // Decode CKEditor content for home page events
    eventsList.forEach(event => {
      if(event.title) event.title = he.decode(event.title);
      if(event.description) event.description = he.decode(event.description);
      if(event.location) event.location = he.decode(event.location);
    });


    const [funFactsRows] = await db.query("SELECT * FROM fun_facts LIMIT 1");
    const funRow = funFactsRows[0] || {};
    const funFacts = [
      { heading: funRow.heading1, number: funRow.number1, image: funRow.image1 },
      { heading: funRow.heading2, number: funRow.number2, image: funRow.image2 },
      { heading: funRow.heading3, number: funRow.number3, image: funRow.image3 },
      { heading: funRow.heading4, number: funRow.number4, image: funRow.image4 },
    ];
    // ✅ Render frontend homepage with DB data
    res.render("frontend/index", { homeContent, values, content, why, fun, events, funFacts,eventsList });
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


router.get("/blog-view", (req, res) => {
  res.render("frontend/blog-view");
});

// Contact
router.get("/contact", (req, res) => {
  res.render("frontend/contact");
});

// Dance
// router.get("/dance", (req, res) => {
//   res.render("frontend/dance");
// });

// Fee Structure
router.get("/fee-structure", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM admissions ORDER BY id ASC");

    res.render("frontend/fee-structure", {
      admissions_fee: rows
    });
  } catch (error) {
    console.error("Error fetching admissions:", error);
    res.status(500).send("Error loading fee structure");
  }
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
router.get("/event-blog", async (req, res) => {
  try {
    const [eventsList] = await db.query("SELECT * FROM events ORDER BY event_date ASC");

    // Decode CKEditor content
    eventsList.forEach(event => {
      if(event.title) event.title = he.decode(event.title);
      if(event.description) event.description = he.decode(event.description);
      if(event.location) event.location = he.decode(event.location);
    });

    res.render("frontend/event-blog", { eventsList });
  } catch(err) {
    console.error("Event blog error:", err);
    res.status(500).send("Server error");
  }
});

// Event detail page
router.get("/blog-view/:eventSlug", async (req, res) => {
  try {
    const eventSlug = req.params.eventSlug; // e.g., "republic-day"

    // Fetch all events
    const [events] = await db.query("SELECT * FROM events ORDER BY event_date ASC");

    // Find the event matching the slug
    const eventDetail = events.find(ev => {
      const sanitizedName = ev.event_name.replace(/<[^>]*>/g, '').toLowerCase().replace(/ /g, '-');
      return sanitizedName === eventSlug;
    });

    if (!eventDetail) return res.status(404).send("Event not found");

    // Recent events excluding current
    const recentEvents = events
      .filter(ev => ev.id !== eventDetail.id)
      .sort((a,b) => new Date(b.event_date) - new Date(a.event_date))
      .slice(0,3);

    // Decode CKEditor content
    if(eventDetail.title) eventDetail.title = he.decode(eventDetail.title);
    if(eventDetail.description) eventDetail.description = he.decode(eventDetail.description);
    if(eventDetail.location) eventDetail.location = he.decode(eventDetail.location);

    recentEvents.forEach(ev => {
      if(ev.title) ev.title = he.decode(ev.title);
      if(ev.description) ev.description = he.decode(ev.description);
      if(ev.location) ev.location = he.decode(ev.location);
    });

    res.render("frontend/blog-view", { eventDetail, recentEvents });

  } catch(err) {
    console.error("Event view error:", err);
    res.status(500).send("Server error");
  }
});

router.get("/:facilitySlug", async (req, res, next) => {
  try {
    const facilitySlug = req.params.facilitySlug.toLowerCase();

    // Fetch all facilities
    const [facilityRows] = await db.execute("SELECT * FROM facilities");

    // Find the matching facility
    const facilityData = facilityRows.find(f => 
      f.facility_name.toLowerCase().replace(/ /g, '-') === facilitySlug
    );

    if (!facilityData) return next(); // go to next route if not found

    const sliderImages = [
      facilityData.image1,
      facilityData.image2,
      facilityData.image3,
      facilityData.image4,
      facilityData.image5
    ].filter(Boolean);

    res.render("frontend/facilities-view", {
      facilityData,
      sliderImages
    });

  } catch (err) {
    console.error(err);
    res.status(500).send("Error loading facility page");
  }
});

module.exports = router;
