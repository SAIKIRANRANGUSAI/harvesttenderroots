 

const express = require("express");
const router = express.Router();
const studentEnrollmentController = require("../controllers/studentEnrollmentController");

router.get("/", studentEnrollmentController.studentEnrollmentPage);

module.exports = router;

