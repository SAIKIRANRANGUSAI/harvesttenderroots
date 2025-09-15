const path = require("path");
const db = require('../config/db');
const jwt = require("jsonwebtoken");

const bcrypt = require("bcryptjs");


exports.postLogin = async (req, res) => {
  console.log("1");
  const { username, password } = req.body;

  try {
    const [rows] = await db.query("SELECT * FROM admins WHERE username = ?", [username]);

    if (rows.length === 0) {
      return res.render("admin/login", { error: "Invalid username or password" });
    }

    const user = rows[0];

    // ✅ define match AFTER fetching user
    const match = await bcrypt.compare(password, user.password);
    if (!match) {
      return res.render("admin/login", { error: "Invalid username or password" });
    }

    // Generate JWT
    const token = jwt.sign(
      { id: user.id, username: user.username },
      process.env.JWT_SECRET || "12345678",
      { expiresIn: "1h" }
    );

    // Send JWT as cookie
    res.cookie("token", token, { httpOnly: true, secure: false, sameSite: "strict" }); 
    // ⚠️ set secure:false while testing locally, else cookie won’t save in http

    res.redirect("/admin/dashboard");
  } catch (err) {
    console.error("❌ Login error:", err);
    res.status(500).send("Server error");
  }
};

exports.isAuthenticated = (req, res, next) => {
  // Public routes that should bypass auth
  if (
    req.path === "/login" ||
    req.path === "/logout" ||
    req.path.startsWith("/static")
  ) {
    return next();
  }

  const token = req.cookies.token;

  if (!token) {
    return res.redirect("/admin/login");
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET || "12345678");
    req.user = decoded;
    return next();
  } catch (err) {
    return res.redirect("/admin/login");
  }
};
