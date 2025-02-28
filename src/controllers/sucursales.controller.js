import { pool } from "../db.js";

export const getSucursales = async (req, res) => {
  console.log(" ==== getSucursales == ");
  try {
    const [rows] = await pool.query("SELECT * FROM sucursales");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};

export const getSucursal = async (req, res) => {
  console.log(" ==== getSucursal == ");
  try {
    const { id } = req.params;
    const [rows] = await pool.query("SELECT * FROM sucursales WHERE id = ?", [id]);

    if (rows.length <= 0) {
      return res.status(404).json({ message: "Sucursal not found" });
    }

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong" });
  }
};

export const deleteSucursal = async (req, res) => {
  console.log(" ==== deleteSucursal == ");
  try {
    const { id } = req.params;
    const [rows] = await pool.query("DELETE FROM sucursales WHERE id = ?", [id]);

    if (rows.affectedRows <= 0) {
      return res.status(404).json({ message: "Sucursal not found" });
    }

    res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};

export const createSucursal = async (req, res) => {
  console.log(" ==== createSucursal == ");
  try {
    const { nombre, ciudad, direccion, contacto, foto, horario, gmaps_link, latitud, longitud } = req.body;
    
    const [rows] = await pool.query(
      "INSERT INTO sucursales (nombre, ciudad, direccion, contacto, foto, horario, gmaps_link, latitud, longitud) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [nombre, ciudad, direccion, contacto, foto, horario, gmaps_link, latitud, longitud]
    );

    res.status(201).json({ id: rows.insertId, nombre, ciudad, direccion, contacto, foto, horario, gmaps_link, latitud, longitud });
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};

export const updateSucursal = async (req, res) => {
  console.log(" ==== updateSucursal == ");
  try {
    const { id } = req.params;
    const { nombre, ciudad, direccion, contacto, foto, horario, gmaps_link, latitud, longitud } = req.body;
    
    const [result] = await pool.query(
      "UPDATE sucursales SET nombre = IFNULL(?, nombre), ciudad = IFNULL(?, ciudad), direccion = IFNULL(?, direccion), contacto = IFNULL(?, contacto), foto = IFNULL(?, foto), horario = IFNULL(?, horario), gmaps_link = IFNULL(?, gmaps_link), latitud = IFNULL(?, latitud), longitud = IFNULL(?, longitud) WHERE id = ?",
      [nombre, ciudad, direccion, contacto, foto, horario, gmaps_link, latitud, longitud, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Sucursal not found" });
    }

    const [rows] = await pool.query("SELECT * FROM sucursales WHERE id = ?", [id]);
    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};
