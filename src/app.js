import express from "express";
import morgan from "morgan";
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
app.get("/fbDelete", (req, res) => {
  const phpFilePath = path.join(__dirname, "fbdelete.php");

  exec(`php ${phpFilePath}`, (error, stdout, stderr) => {
      if (error) {
          console.error(`Error ejecutando PHP: ${error.message}`);
          res.status(500).send("Error ejecutando PHP");
          return;
      }
      if (stderr) {
          console.error(`Error en PHP: ${stderr}`);
          res.status(500).send(stderr);
          return;
      }
      res.send(stdout);
  });
});

app.use((req, res, next) => {
  res.status(404).json({ message: "Not found" });
});

export default app;
