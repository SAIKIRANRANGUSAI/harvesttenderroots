require("dotenv").config();
const express = require("express");
const path = require("path");
const session = require("express-session");
const mysql = require("mysql2/promise"); // Using mysql2 with async/await
const app = express();
const frontendRoutes = require("./routes/frontend");
const adminRoutes = require("./routes/admin");

app.use(express.static(path.join(__dirname, 'public')));
// -------------------- VIEW ENGINE -------------------- //
app.set("view engine", "ejs");
app.set("views", [
  path.join(__dirname, "views"),
  path.join(__dirname, "admin/views")
]);


app.use("/", frontendRoutes);       // all public pages
//app.use("/admin", adminRoutes);     // all admin panel pages




// Only start server locally
if (require.main === module) {
  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () => console.log(`🚀 Server running at http://localhost:${PORT}`));
}

module.exports = app; // Export for serverless / testing
