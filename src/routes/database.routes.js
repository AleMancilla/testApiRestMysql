import { Router } from "express";
import {
  createProducto,
  deleteProducto,
  getProducto,
  getProductos,
  updateProducto,
} from "../controllers/producto.controller.js";

const router = Router();

// GET all productos
router.get("/productos", getProductos);

// GET An Employee
router.get("/productos/:id", getProducto);

// DELETE An Employee
router.delete("/productos/:id", deleteProducto);

// INSERT An Employee
router.post("/productos", createProducto);

router.patch("/productos/:id", updateProducto);

export default router;
