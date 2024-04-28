import { pool } from "../db.js";

export const getSucursales = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM SUCURSAL");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: " + error });
  }
};

export const getSucursal = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("SELECT * FROM SUCURSAL WHERE idSucursal = ?", [
      id,
    ]);

    if (rows.length <= 0) {
      return res.status(404).json({ message: "Product not found" });
    }

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong" });
  }
};
