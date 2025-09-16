const express = require("express");
const router = express.Router();
const db = require("../config/db");
const multer = require("multer");
const cloudinary = require("../config/cloudinary"); // your Cloudinary config
const fs = require("fs");

const Controller = require("../controllers/Controller");
const { isAuthenticated } = Controller;

// Multer setup
const storage = multer.diskStorage({});
const upload = multer({ storage });


// ✅ Login page (GET)
router.get("/login", (req, res) => {
  res.render("admin/login", { error: null });
});

// ✅ Login form submission (POST)
router.post("/login", Controller.postLogin);

// ✅ Logout route (clear cookie)
router.get("/logout", (req, res) => {
  res.clearCookie("token");
  res.redirect("/admin/login");
});

// ✅ Dashboard (protected)
router.get("/dashboard", isAuthenticated, (req, res) => {
  res.render("admin/admin_dashboard", {
    title: "Admin Dashboard | Harvest Tender Roots",
    currentPage: "dashboard",
    user: req.user // decoded JWT
  });
});


// ------------------- HERO SECTION ROUTES ------------------- //

// GET hero section (display current DB values in inputs)

// Home page admin: show all home sections (hero, etc.)
// GET hero/home section
// GET Home Page
router.get("/home", isAuthenticated, async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM hero_section WHERE id = 1");
    const homeContent = rows[0] || {};
    const [rowss] = await db.query("SELECT * FROM core_values ORDER BY id ASC");
    const values = rowss;
    const [siteRows] = await db.query("SELECT * FROM site_content LIMIT 1");
    const content = siteRows[0] || {};
    const [whyRows]  = await db.query("SELECT * FROM why_choose_us WHERE id = 1");
    const why     = whyRows[0] || {};
    const [rowsf] = await db.query("SELECT * FROM fun_classes WHERE id = 1");
    const fun = rowsf[0] || {};
    res.render("admin/admin_home", { homeContent, values, content, why, fun });
  } catch (err) {
    console.error(err);
    res.status(500).send("Server error");
  }
});

// POST Home Update
router.post(
  "/home/update",
  isAuthenticated,
  upload.fields([
    { name: "background_image", maxCount: 1 },
    { name: "hero_image", maxCount: 1 },
    { name: "funfact_image", maxCount: 1 },
  ]),
  async (req, res) => {
    try {
      const { main_heading, main_description, sub_heading, youtube_link, total_students } = req.body;

      const [rows] = await db.query("SELECT * FROM hero_section WHERE id = 1");
      const hero = rows[0] || {};

      let background_image = hero.background_image;
      let hero_image = hero.hero_image;
      let funfact_image = hero.funfact_image;

      if (req.files["background_image"]) {
        const bgResult = await cloudinary.uploader.upload(req.files["background_image"][0].path, {
          folder: "harvesttenderroots/hero",
        });
        background_image = bgResult.secure_url;
        fs.unlinkSync(req.files["background_image"][0].path);
      }

      if (req.files["hero_image"]) {
        const heroResult = await cloudinary.uploader.upload(req.files["hero_image"][0].path, {
          folder: "harvesttenderroots/hero",
        });
        hero_image = heroResult.secure_url;
        fs.unlinkSync(req.files["hero_image"][0].path);
      }

      if (req.files["funfact_image"]) {
        const funResult = await cloudinary.uploader.upload(req.files["funfact_image"][0].path, {
          folder: "harvesttenderroots/hero",
        });
        funfact_image = funResult.secure_url;
        fs.unlinkSync(req.files["funfact_image"][0].path);
      }

      if (!hero.id) {
        await db.query(
          `INSERT INTO hero_section 
            (main_heading, main_description, sub_heading, youtube_link, total_students, background_image, hero_image, funfact_image)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
          [main_heading, main_description, sub_heading, youtube_link, total_students, background_image, hero_image, funfact_image]
        );
      } else {
        await db.query(
          `UPDATE hero_section SET 
            main_heading=?, main_description=?, sub_heading=?, youtube_link=?, total_students=?,
            background_image=?, hero_image=?, funfact_image=? 
           WHERE id=1`,
          [main_heading, main_description, sub_heading, youtube_link, total_students, background_image, hero_image, funfact_image]
        );
      }

      res.redirect("/admin/home");
    } catch (err) {
      console.error(err);
      res.status(500).send("Server error");
    }
  }
);

// =======================
// CREATE Core Value
// =======================
router.post("/core-values/create", upload.single("image"), async (req, res) => {
  try {
    const { heading } = req.body;
    let image = null;

    if (req.file) {
      // Upload to Cloudinary
      const result = await cloudinary.uploader.upload(req.file.path, {
        folder: "harvesttenderroots/core-values"
      });
      image = result.secure_url;
      fs.unlinkSync(req.file.path);
    }

    await db.query("INSERT INTO core_values (heading, image) VALUES (?, ?)", [heading, image]);
    res.redirect("/admin/home");
  } catch (err) {
    console.error(err);
    res.status(500).send("Server Error");
  }
});

// =======================
// UPDATE Core Value
// =======================
router.post("/core-values/update/:id", upload.single("image"), async (req, res) => {
  try {
    const { id } = req.params;
    const { heading } = req.body;

    // Get old image
    const [rows] = await db.query("SELECT image FROM core_values WHERE id = ?", [id]);
    let image = rows.length ? rows[0].image : null;

    if (req.file) {
      const result = await cloudinary.uploader.upload(req.file.path, {
        folder: "harvesttenderroots/core-values"
      });
      image = result.secure_url;
      fs.unlinkSync(req.file.path);
    }

    await db.query("UPDATE core_values SET heading = ?, image = ? WHERE id = ?", [heading, image, id]);
    res.redirect("/admin/home");
  } catch (err) {
    console.error(err);
    res.status(500).send("Server Error");
  }
});

// =======================
// DELETE Core Value
// =======================
router.post("/core-values/delete/:id", async (req, res) => {
  try {
    const { id } = req.params;

    // Optional: delete from Cloudinary
    const [rows] = await db.query("SELECT image FROM core_values WHERE id = ?", [id]);
    if (rows.length && rows[0].image) {
      // Extract public_id from Cloudinary URL
      const publicId = rows[0].image.split("/").pop().split(".")[0];
      await cloudinary.uploader.destroy(`harvesttenderroots/core-values/${publicId}`);
    }

    await db.query("DELETE FROM core_values WHERE id = ?", [id]);
    res.redirect("/admin/home");
  } catch (err) {
    console.error(err);
    res.status(500).send("Server Error");
  }
});

// GET site content for admin
router.get("/site-content", isAuthenticated, async (req, res) => {
  const [rows] = await db.query("SELECT * FROM site_content WHERE id = 1");
  const content = rows[0] || {};
  res.render("admin/site_content", { content });
});

// POST update site content
router.post("/site-content/update", isAuthenticated, upload.fields([
  { name: "home1_image", maxCount: 1 },
  { name: "home2_image", maxCount: 1 },
  { name: "home3_image", maxCount: 1 },
  { name: "about1_image", maxCount: 1 },
  { name: "about2_image", maxCount: 1 },
  { name: "about3_image", maxCount: 1 },
  { name: "mission_image", maxCount: 1 },
  { name: "vision_image", maxCount: 1 },
]), async (req, res) => {
  try {
    const body = req.body;
    const [rows] = await db.query("SELECT * FROM site_content WHERE id = 1");
    const content = rows[0] || {};

    // Function to upload image to Cloudinary if provided
    const uploadImage = async (file, folder) => {
      if (!file) return null;
      const result = await cloudinary.uploader.upload(file.path, { folder });
      fs.unlinkSync(file.path);
      return result.secure_url;
    };

    // Home images
    const home1_image = req.files["home1_image"] ? await uploadImage(req.files["home1_image"][0], "home") : content.home1_image;
    const home2_image = req.files["home2_image"] ? await uploadImage(req.files["home2_image"][0], "home") : content.home2_image;
    const home3_image = req.files["home3_image"] ? await uploadImage(req.files["home3_image"][0], "home") : content.home3_image;

    // About images
    const about1_image = req.files["about1_image"] ? await uploadImage(req.files["about1_image"][0], "about") : content.about1_image;
    const about2_image = req.files["about2_image"] ? await uploadImage(req.files["about2_image"][0], "about") : content.about2_image;
    const about3_image = req.files["about3_image"] ? await uploadImage(req.files["about3_image"][0], "about") : content.about3_image;

    // Mission & Vision images
    const mission_image = req.files["mission_image"] ? await uploadImage(req.files["mission_image"][0], "mission_vision") : content.mission_image;
    const vision_image = req.files["vision_image"] ? await uploadImage(req.files["vision_image"][0], "mission_vision") : content.vision_image;

    if (!content.id) {
      await db.query(`INSERT INTO site_content 
                (main_heading, main_description, homeabout_heading, homeabout_description,
                 home1_image, home2_image, home3_image, 
                 about_home_heading, about_home_description, about1_image, about2_image, about3_image,
                 mission_heading, mission_description, mission_image,
                 vision_heading, vision_description, vision_image)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          body.main_heading, body.main_description, body.homeabout_heading, body.homeabout_description,
          home1_image, home2_image, home3_image,
          body.about_home_heading, body.about_home_description,
          about1_image, about2_image, about3_image,
          body.mission_heading, body.mission_description, mission_image,
          body.vision_heading, body.vision_description, vision_image
        ]
      );
    } else {
      await db.query(`
    UPDATE site_content SET
        main_heading = ?,
        main_description = ?,
        homeabout_heading = ?,
        homeabout_description = ?,
        home1_image = ?,
        home2_image = ?,
        home3_image = ?,
        about_home_heading = ?,
        about_home_description = ?,
        about1_image = ?,
        about2_image = ?,
        about3_image = ?,
        mission_heading = ?,
        mission_description = ?,
        mission_image = ?,
        vision_heading = ?,
        vision_description = ?,
        vision_image = ?
    WHERE id = 1
`, [
    body.main_heading || '',
    body.main_description || '',
    body.homeabout_heading || '',
    body.homeabout_description || '',
    home1_image,
    home2_image,
    home3_image,
    body.about_home_heading || '',
    body.about_home_description || '',
    about1_image,
    about2_image,
    about3_image,
    body.mission_heading || '',
    body.mission_description || '',
    mission_image,
    body.vision_heading || '',
    body.vision_description || '',
    vision_image
]);


    }

    res.redirect("/admin/home");
  } catch (err) {
    console.error(err);
    res.status(500).send("Server error");
  }
});

// =======================
// WHY CHOOSE US (with Cloudinary)
// =======================
router.post("/why-choose-us/update", upload.single("image"), isAuthenticated, async (req, res) => {
  try {
    const body = req.body;
    let image = null;

    // Upload new image if provided
    if (req.file) {
      const result = await cloudinary.uploader.upload(req.file.path, {
        folder: "harvesttenderroots/why-choose-us"
      });
      image = result.secure_url;
      fs.unlinkSync(req.file.path); // remove local temp file
    }

    const [rows] = await db.query("SELECT * FROM why_choose_us WHERE id = 1");
    const content = rows[0] || {};

    if (!content.id) {
      // Insert
      await db.query(
        `INSERT INTO why_choose_us 
        (main_heading, main_description, celebration_link,
         values_heading, values_description,
         mission_heading, mission_description,
         vision_heading, vision_description, image)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          body.main_heading,
          body.main_description,
          body.celebration_link,
          body.values_heading,
          body.values_description,
          body.mission_heading,
          body.mission_description,
          body.vision_heading,
          body.vision_description,
          image
        ]
      );
    } else {
      // Update
      await db.query(
        `UPDATE why_choose_us SET
          main_heading = ?, 
          main_description = ?, 
          celebration_link = ?,
          values_heading = ?, 
          values_description = ?,
          mission_heading = ?, 
          mission_description = ?,
          vision_heading = ?, 
          vision_description = ?,
          image = COALESCE(?, image)
         WHERE id = 1`,
        [
          body.main_heading,
          body.main_description,
          body.celebration_link,
          body.values_heading,
          body.values_description,
          body.mission_heading,
          body.mission_description,
          body.vision_heading,
          body.vision_description,
          image
        ]
      );
    }

    res.redirect("/admin/home");
  } catch (err) {
    console.error(err);
    res.status(500).send("Server error");
  }
});


// =======================
// FUN CLASSES (with Cloudinary)
// =======================
router.post("/fun-classes/update", upload.single("image"), isAuthenticated, async (req, res) => {
  try {
    const body = req.body;
    let image = null;

    // Upload new image if provided
    if (req.file) {
      const result = await cloudinary.uploader.upload(req.file.path, {
        folder: "harvesttenderroots/fun-classes"
      });
      image = result.secure_url;
      fs.unlinkSync(req.file.path); // remove local temp file
    }

    const [rows] = await db.query("SELECT * FROM fun_classes WHERE id = 1");
    const fun = rows[0] || {};

    if (!fun.id) {
      // Insert
      await db.query(
        `INSERT INTO fun_classes (heading, description, youtube_link, image)
         VALUES (?, ?, ?, ?)`,
        [body.heading, body.description, body.youtube_link, image]
      );
    } else {
      // Update
      await db.query(
        `UPDATE fun_classes SET 
           heading = ?, 
           description = ?, 
           youtube_link = ?, 
           image = COALESCE(?, image)
         WHERE id = 1`,
        [body.heading, body.description, body.youtube_link, image]
      );
    }

    res.redirect("/admin/home");
  } catch (err) {
    console.error(err);
    res.status(500).send("Server error");
  }
});

// Show all about us info
router.get("/about-us", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM school_info ORDER BY id ASC");
    res.render("admin/admin_about-us", {
      infoList: rows,
      formMode: false,
      info: null,
    });
  } catch (err) {
    console.error("Error fetching about us info:", err);
    res.status(500).send("Server error");
  }
});

// Show Add Form
router.get("/about-us/add", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM school_info ORDER BY id ASC");
    res.render("admin/admin_about-us", {
      infoList: rows,
      formMode: true,
      info: null,
    });
  } catch (err) {
    console.error("Error loading add form:", err);
    res.status(500).send("Server error");
  }
});

// Handle Add
router.post("/about-us/add", async (req, res) => {
  try {
    const { field_name, field_value } = req.body;
    await db.query(
      "INSERT INTO school_info (field_name, field_value) VALUES (?, ?)",
      [field_name, field_value]
    );
    res.redirect("/admin/about-us");
  } catch (err) {
    console.error("Error adding about us info:", err);
    res.status(500).send("Server error");
  }
});

// Show Edit Form
router.get("/about-us/edit/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const [rows] = await db.query("SELECT * FROM school_info ORDER BY id ASC");
    const [record] = await db.query("SELECT * FROM school_info WHERE id = ?", [
      id,
    ]);
    res.render("admin/admin_about-us", {
      infoList: rows,
      formMode: true,
      info: record[0] || null,
    });
  } catch (err) {
    console.error("Error loading edit form:", err);
    res.status(500).send("Server error");
  }
});

// Handle Edit
router.post("/about-us/edit/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const { field_name, field_value } = req.body;
    await db.query(
      "UPDATE school_info SET field_name = ?, field_value = ? WHERE id = ?",
      [field_name, field_value, id]
    );
    res.redirect("/admin/about-us");
  } catch (err) {
    console.error("Error updating about us info:", err);
    res.status(500).send("Server error");
  }
});

// Delete
router.get("/about-us/delete/:id", async (req, res) => {
  try {
    const id = req.params.id;
    await db.query("DELETE FROM school_info WHERE id = ?", [id]);
    res.redirect("/admin/about-us");
  } catch (err) {
    console.error("Error deleting about us info:", err);
    res.status(500).send("Server error");
  }
});


module.exports = router;
