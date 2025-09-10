 

const express = require("express");
const router = express.Router();
const alumniController = require("../controllers/alumniController");

router.get("/", alumniController.alumniPage);

module.exports = router;

