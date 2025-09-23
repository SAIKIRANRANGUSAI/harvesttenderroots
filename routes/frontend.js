const express = require("express");
const router = express.Router();
const { body, validationResult } = require('express-validator');
const db = require("../config/db");
const he = require("he");

const xss = require('xss');
// const { body, validationResult } = require('express-validator');
const axios = require('axios');
// const he = require('he');

// helper: strict sanitizer that also removes javascript: URIs
function strictSanitize(input) {
  if (typeof input !== 'string') return '';
  // 1) remove javascript: pseudo-protocol attempts
  input = input.replace(/javascript:/gi, '');
  // 2) remove data:text/html and similar
  input = input.replace(/data:text\/html/gi, '');
  // 3) use xss to strip tags/attributes
  const cleaned = xss(input, {
    whiteList: {},        // remove all tags
    stripIgnoreTag: true, // strip all unknown tags
    stripIgnoreTagBody: ['script'] // also strip script bodies
  });
  // 4) final encode to entities to be safe when rendering
  return he.encode(cleaned);
}
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
      if (event.title) event.title = he.decode(event.title);
      if (event.description) event.description = he.decode(event.description);
      if (event.location) event.location = he.decode(event.location);
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
    res.render("frontend/index", { homeContent, values, content, why, fun, events, funFacts, eventsList });
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




router.get("/event-blog", async (req, res) => {
  try {
    const [eventsList] = await db.query("SELECT * FROM events ORDER BY event_date ASC");

    // Decode CKEditor content
    eventsList.forEach(event => {
      if (event.title) event.title = he.decode(event.title);
      if (event.description) event.description = he.decode(event.description);
      if (event.location) event.location = he.decode(event.location);
    });

    res.render("frontend/event-blog", { eventsList });
  } catch (err) {
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
      .sort((a, b) => new Date(b.event_date) - new Date(a.event_date))
      .slice(0, 3);

    // Decode CKEditor content
    if (eventDetail.title) eventDetail.title = he.decode(eventDetail.title);
    if (eventDetail.description) eventDetail.description = he.decode(eventDetail.description);
    if (eventDetail.location) eventDetail.location = he.decode(eventDetail.location);

    recentEvents.forEach(ev => {
      if (ev.title) ev.title = he.decode(ev.title);
      if (ev.description) ev.description = he.decode(ev.description);
      if (ev.location) ev.location = he.decode(ev.location);
    });

    res.render("frontend/blog-view", { eventDetail, recentEvents });

  } catch (err) {
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
router.get('/gallery', async (req, res) => {
  try {
    const [galleries] = await db.execute("SELECT * FROM gallery ORDER BY id DESC");
    res.render('frontend/gallery', { galleries });
  } catch (err) {
    console.error(err);
    res.render('frontend/gallery', { galleries: [] });
  }
});


// GET gallery view by category
router.get('/gallery-view/:category', async (req, res) => {
  try {
    const category = req.params.category;
    const [gallery] = await db.execute("SELECT * FROM gallery WHERE category = ?", [category]);

    if (gallery.length === 0) {
      return res.send('Gallery not found');
    }

    // parse images JSON
    gallery[0].images = JSON.parse(gallery[0].images);

    res.render('frontend/gallery-view', { gallery: gallery[0] });
  } catch (err) {
    console.error(err);
    res.send('Error fetching gallery');
  }
});

router.get("/staff", async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = 10; // items per page
    const offset = (page - 1) * limit;

    // Total number of staff
    const [totalRows] = await db.execute("SELECT COUNT(*) AS total FROM staff");
    const totalItems = totalRows[0].total;
    const totalPages = Math.ceil(totalItems / limit);

    // Fetch paginated staff data (numbers directly in query)
    const [staffRows] = await db.query(
      `SELECT * FROM staff ORDER BY id ASC LIMIT ${limit} OFFSET ${offset}`
    );

    res.render("frontend/staff", {
      staffList: staffRows,
      currentPage: page,
      totalPages
    });
  } catch (err) {
    console.error("Error fetching staff data:", err);
    res.status(500).send("Server error");
  }
});

router.get('/student-enrollment', async (req, res) => {
  try {
    // Fetch all enrollment data
    const [enrollmentList] = await db.execute('SELECT * FROM student_enrollment ORDER BY id ASC');

    // Fetch enrollment page image
    const [imageRows] = await db.execute('SELECT * FROM enrollment_images ORDER BY id DESC LIMIT 1');
    const enrollmentImage = imageRows[0] || null;

    res.render('frontend/student-enrollment', { enrollmentList, enrollmentImage });

  } catch (error) {
    console.error('Error fetching enrollment data:', error);
    res.render('frontend/student_enrollment', { enrollmentList: [], enrollmentImage: null });
  }
});

// router.get('/contact', (req, res) => {
//   res.render('frontend/contact'); // matches your EJS path
// });


router.get('/contact-us', (req, res) => {
  res.render('frontend/contact', {
    successMessage: req.flash('successMessage'),
    errors: req.flash('errors'),
    oldInput: req.flash('oldInput')[0] || {}
  });
});

// POST contact form
router.post(
  '/contact-us',

  // ✅ server-side validations
  body('name')
    .trim()
    .isLength({ min: 2, max: 100 })
    .matches(/^[A-Za-z\s]+$/)
    .withMessage('Name must be letters and spaces only'),

  body('email')
    .isEmail()
    .normalizeEmail()
    .withMessage('Invalid email'),

  body('phone')
    .trim()
    .matches(/^\+?\d{7,15}$/)
    .withMessage('Invalid phone number'),

  body('subject')
    .trim()
    .isLength({ min: 2, max: 150 })
    .withMessage('Subject required'),

  body('message')
    .trim()
    .isLength({ min: 2, max: 2000 })
    .withMessage('Message length invalid'),

  body('g-recaptcha-response')
    .notEmpty()
    .withMessage('reCAPTCHA required'),

  async (req, res) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ success: false, errors: errors.array() });
      }

      // ✅ verify reCAPTCHA
      const secret = '6LdN2NIrAAAAADUMPyhzTwqc1ApkVtkfbJD72a5F';
      const recaptchaRes = req.body['g-recaptcha-response'];
      const verify = await axios.post(
        `https://www.google.com/recaptcha/api/siteverify`,
        new URLSearchParams({ secret, response: recaptchaRes }).toString(),
        { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }
      );

      if (!verify.data || !verify.data.success) {
        return res.status(400).json({ success: false, message: 'reCAPTCHA verification failed' });
      }

      // ✅ strict sanitize ALL inputs
      const name = strictSanitize(req.body.name);
      const email = strictSanitize(req.body.email);
      const phone = strictSanitize(req.body.phone);
      const subject = strictSanitize(req.body.subject);
      const message = strictSanitize(req.body.message);

      // ✅ insert sanitized values into DB
      await db.execute(
        'INSERT INTO contact_messages (name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?)',
        [name, email, phone, subject, message]
      );

       req.flash('successMessage', 'Message sent successfully!');
      return res.redirect('/contact-us');

    } catch (err) {
      console.error('contact send error', err);
      // return res.status(500).json({ success: false, message: 'Server error' });
      // req.flash('successMessage', 'Message sent successfully!');
      return res.redirect('/contact-us');
    }
  }
);

// GET route
router.get('/alumini', (req, res) => {
    res.render('frontend/alumini', {
        title: 'Alumni Registration',
        formData: {},
        errors: [],
        successMessage: ''
    });
});

// POST route
router.post('/alumini', [
    // Validation & sanitization
    body('student_name').trim().escape().notEmpty().withMessage('Name is required'),
    body('date_of_birth').isDate().withMessage('Valid date required'),
    body('batch_from').isInt({ min: 1990 }).withMessage('Select valid start year'),
    body('batch_to').isInt({ max: new Date().getFullYear() }).withMessage('Select valid end year'),
    body('email').isEmail().normalizeEmail().withMessage('Valid email required'),
    body('mobile_no').trim().escape().optional({ checkFalsy: true }),
    body('current_status').trim().escape().isIn(['Study','Job','Other']).withMessage('Select valid status'),
    body('country').trim().escape().notEmpty().withMessage('Country is required'),
    body('state').trim().escape().optional({ checkFalsy: true }),
    body('city').trim().escape().optional({ checkFalsy: true }),
    body('address').trim().escape().optional({ checkFalsy: true }),
    body('feelings').trim().escape().optional({ checkFalsy: true }),
    body('suggestions').trim().escape().optional({ checkFalsy: true }),
    body('g-recaptcha-response').notEmpty().withMessage('Please verify that you are not a robot')
], async (req, res) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        return res.render('frontend/alumini', {
            title: 'Alumni Registration',
            errors: errors.array(),
            formData: req.body,
            successMessage: ''
        });
    }

    // Verify Google reCAPTCHA
    const secretKey = '6LdN2NIrAAAAADUMPyhzTwqc1ApkVtkfbJD72a5F'; // Replace with your secret
    const recaptchaResponse = req.body['g-recaptcha-response'];

    try {
        const captchaVerify = await fetch(`https://www.google.com/recaptcha/api/siteverify`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `secret=${secretKey}&response=${recaptchaResponse}`
        });
        const captchaData = await captchaVerify.json();

        if (!captchaData.success) {
            return res.render('frontend/alumini', {
                title: 'Alumni Registration',
                errors: [{ msg: 'Captcha verification failed, please try again.' }],
                formData: req.body,
                successMessage: ''
            });
        }

        // Insert sanitized data into DB
        const {
            student_name, date_of_birth, batch_from, batch_to, email, mobile_no,
            current_status, country, state, city, address, feelings, suggestions
        } = req.body;

        const sql = `INSERT INTO alumni
            (student_name, date_of_birth, batch_from, batch_to, email, mobile_no, current_status, country, state, city, address, feelings, suggestions)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

        await db.execute(sql, [
            student_name, date_of_birth, batch_from, batch_to, email, mobile_no || null,
            current_status, country, state || null, city || null, address || null,
            feelings || null, suggestions || null
        ]);

        res.render('frontend/alumini', {
            title: 'Alumni Registration',
            formData: {},
            errors: [],
            successMessage: 'Alumni registration submitted successfully!'
        });

    } catch (err) {
        console.error(err);
        res.status(500).render('frontend/alumini', {
            title: 'Alumni Registration',
            formData: req.body,
            errors: [{ msg: 'Server error. Please try again later.' }],
            successMessage: ''
        });
    }
});
module.exports = router;
