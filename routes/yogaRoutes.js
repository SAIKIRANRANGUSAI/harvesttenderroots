 

const express = require("express");
const router = express.Router();
const yogaController = require("../controllers/yogaController");

router.get("/", yogaController.yogaPage);

module.exports = router;

