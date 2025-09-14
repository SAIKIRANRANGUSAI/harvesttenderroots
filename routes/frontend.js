const express = require("express");
const router = express.Router();

// Home page
router.get("/", (req, res) => {
	res.render("frontend/index");
});

// About Us
router.get("/about-us", (req, res) => {
	res.render("frontend/about-us");
});

// Admission Procedure
router.get("/admission-procedure", (req, res) => {
	res.render("frontend/admission-procedure");
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
router.get("/principal-message", (req, res) => {
	res.render("frontend/principal-message");
});

// School Info
router.get("/school-info", (req, res) => {
	res.render("frontend/school-info");
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
