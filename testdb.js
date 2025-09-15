const mysql = require("mysql2/promise");

(async () => {
    try {
        const conn = await mysql.createConnection({
            host: "46.250.225.169",
            user: "demo_colormo_usr",
            password: "QRdKdVpp3pnNhXBt",
            database: "harvesttenderroots_website",
            port: 3306            // default port

        });

        console.log("✅ Database connected!");
        const [rows] = await conn.query("SELECT NOW() AS now");
        console.log("⏰ MySQL Time:", rows[0].now);

        await conn.end();
    } catch (err) {
        console.error("❌ Database connection failed:", err.message);
    }
})();
