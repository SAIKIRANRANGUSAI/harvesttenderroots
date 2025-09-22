const db = require('../config/db'); // your DB connection


async function fetchMenuFacilities(req, res, next) {
  try {
    const [menuFacilities] = await db.execute(
      "SELECT facility_name FROM facilities ORDER BY facility_name ASC"
    );
    res.locals.menuFacilities = menuFacilities; // available in all EJS templates
    next();
  } catch (err) {
    console.error("Error fetching facilities for menu:", err);
    res.locals.menuFacilities = [];
    next();
  }
}

module.exports = fetchMenuFacilities;

