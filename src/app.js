import express from "express";
import morgan from "morgan";
import { exec } from "child_process";
import path from "path";
import cors from "cors";

import databaseRoutes from "./routes/database.routes.js";
import indexRoutes from "./routes/index.routes.js";

const app = express();
app.use(cors());


const APP_SECRET = "e8d727a96f00fb94d751e9433ca81ef1"; // Usa tu app secret real aquí


// Middlewares
app.use(morgan("dev"));
app.use(express.json());

// Routes
app.use("/", indexRoutes);
app.use("/api", databaseRoutes);



// 🔹 Ruta para recibir la solicitud de eliminación
app.post("/fbDelete", (req, res) => {
  const { signed_request } = req.body;
  if (!signed_request) {
      return res.status(400).json({ error: "Falta signed_request" });
  }

  const data = parseSignedRequest(signed_request, APP_SECRET);
  if (!data) {
      return res.status(400).json({ error: "Firma inválida" });
  }

  // ID del usuario que solicita la eliminación
  const user_id = data.user_id;

  // Respuesta con URL de seguimiento y código de confirmación
  const response = {
      url: `https://www.caferio.com/deletion?id=${user_id}`,
      confirmation_code: "abc123"
  };

  res.json(response);
});

// Middleware para manejar rutas no encontradas
app.use((req, res) => {
    res.status(404).json({ message: "Not found" });
});


// 🔹 Función para decodificar y verificar la firma de Facebook
function parseSignedRequest(signed_request, secret) {
  const [encoded_sig, payload] = signed_request.split(".");
  if (!encoded_sig || !payload) return null;

  const sig = base64UrlDecode(encoded_sig);
  const data = JSON.parse(base64UrlDecode(payload));

  // Validar la firma con HMAC-SHA256
  const expected_sig = crypto.createHmac("sha256", secret)
      .update(payload)
      .digest();

  if (!crypto.timingSafeEqual(Buffer.from(sig), expected_sig)) {
      console.error("Firma inválida");
      return null;
  }

  return data;
}

// 🔹 Función para decodificar Base64 URL
function base64UrlDecode(input) {
  input = input.replace(/-/g, "+").replace(/_/g, "/");
  return Buffer.from(input, "base64").toString("utf8");
}

export default app;
