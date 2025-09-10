 

const express = require("express");
const router = express.Router();
const admissionProcedureController = require("../controllers/admissionProcedureController");

router.get("/", admissionProcedureController.admissionProcedurePage);

module.exports = router;

