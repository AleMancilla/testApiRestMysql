import { Router } from "express";
import {
  createProducto,
  deleteProducto,
  getProducto,
  getProductos,
  updateProducto,
} from "../controllers/producto.controller.js";

import {
  getUsuarios,
  getUsuario,
  deleteUsuario,
  createUsuario,
  updateUsuario,
} from "../controllers/usuario.controller.js";

// import {
//   getSucursales,
//   getSucursal,
// } from "../controllers/sucursal.controller.js";

import {
  getSucursales,
  getSucursal,
  deleteSucursal,
  createSucursal,
  updateSucursal,
} from "../controllers/sucursales.controller.js";

import {
  getCitas,
  getCita,
  deleteCita,
  createCita,
  updateCita,
} from "../controllers/cita.controller.js";

const router = Router();

router.get("/productos", getProductos);
router.get("/productos/:id", getProducto);
router.delete("/productos/:id", deleteProducto);
router.post("/productos", createProducto);
router.patch("/productos/:id", updateProducto);


router.get("/usuario", getUsuarios);
router.get("/usuario/:id", getUsuario);
router.delete("/usuario/:id", deleteUsuario);
router.post("/usuario", createUsuario);
router.patch("/usuario/:id", updateUsuario);

router.get("/sucursal", getSucursales);
router.get("/sucursal/:id", getSucursal);
router.delete("/deleteSucursal/:id", deleteSucursal);
router.post("/createSucursal", createSucursal);
router.patch("/updateSucursal/:id", updateSucursal);

router.get("/cita", getCitas);
router.get("/cita/:id", getCita);
router.delete("/cita/:id", deleteCita);
router.post("/cita", createCita);
router.patch("/cita/:id", updateCita);


export default router;
