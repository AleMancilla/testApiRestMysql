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
  const response = {
      url: "https://example.com",
      confirmation_code: "abc123"
  };
  res.json(response);
});

// Middleware para manejar rutas no encontradas
app.use((req, res) => {
    res.status(404).json({ message: "Not found" });
});

export default app;
