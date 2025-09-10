 

const express = require("express");
const router = express.Router();
const principalMessageController = require("../controllers/principalMessageController");

router.get("/", principalMessageController.principalMessagePage);

module.exports = router;

