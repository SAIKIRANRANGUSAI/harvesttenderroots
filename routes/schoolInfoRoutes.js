 

const express = require("express");
const router = express.Router();
const schoolInfoController = require("../controllers/schoolInfoController");

router.get("/", schoolInfoController.schoolInfoPage);

module.exports = router;

