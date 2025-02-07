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

// ✅ Ruta para ejecutar `fbdelete.php` vía GET
app.get("/fbDelete", (req, res) => {
    const phpFilePath = path.join(__dirname, "fbdelete.php");

    // Construimos la query string a partir de los parámetros GET
    const queryString = Object.entries(req.query)
        .map(([key, value]) => `${key}=${encodeURIComponent(value)}`)
        .join("&");

    // Ejecutamos PHP con la query string (si hay parámetros)
    const phpCommand = queryString ? `php ${phpFilePath} ${queryString}` : `php ${phpFilePath}`;

    exec(phpCommand, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error ejecutando PHP: ${error.message}`);
            res.status(500).json({ error: "Error ejecutando PHP", details: error.message });
            return;
        }
        if (stderr) {
            console.error(`Error en PHP: ${stderr}`);
            res.status(500).json({ error: "Error en PHP", details: stderr });
            return;
        }
        res.send(stdout); // Muestra la salida del script PHP
    });
});

// Middleware para manejar rutas no encontradas
app.use((req, res) => {
    res.status(404).json({ message: "Not found" });
});

export default app;
