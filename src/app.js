import express from "express";
import morgan from "morgan";
import { exec } from "child_process";
import path from "path";
import cors from "cors";

import databaseRoutes from "./routes/database.routes.js";
import indexRoutes from "./routes/index.routes.js";

const app = express();
app.use(cors());

// Middlewares
app.use(morgan("dev"));
app.use(express.json());

// Routes
app.use("/", indexRoutes);
app.use("/api", databaseRoutes);


// ✅ Ruta para ejecutar `fbdelete.php`
app.get("/fbDelete", (req, res) => {
    const phpFilePath = path.join(process.cwd(), "fbdelete.php"); // Ruta absoluta

    exec(`php ${phpFilePath}`, (error, stdout, stderr) => {
        if (error) {
            console.error(`❌ Error ejecutando PHP: ${error.message}`);
            return res.status(500).json({ error: "Error ejecutando PHP", details: error.message });
        }
        if (stderr) {
            console.error(`⚠️ Error en PHP: ${stderr}`);
            return res.status(500).json({ error: "Error en PHP", details: stderr });
        }
        res.setHeader("Content-Type", "application/json");
        res.send(stdout);
    });
});

// Middleware para manejar rutas no encontradas
app.use((req, res) => {
    res.status(404).json({ message: "Not found" });
});

export default app;
