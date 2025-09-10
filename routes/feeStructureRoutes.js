 

const express = require("express");
const router = express.Router();
const feeStructureController = require("../controllers/feeStructureController");

router.get("/", feeStructureController.feeStructurePage);

module.exports = router;

