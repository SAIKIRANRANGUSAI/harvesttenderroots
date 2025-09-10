 

const express = require("express");
const router = express.Router();
const danceController = require("../controllers/danceController");

router.get("/", danceController.dancePage);

module.exports = router;

