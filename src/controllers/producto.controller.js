import { pool } from "../db.js";

export const getProductos = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM producto");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong" });
  }
};

export const getProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("SELECT * FROM producto WHERE idProducto = ?", [
      id,
    ]);

    if (rows.length <= 0) {
      return res.status(404).json({ message: "Employee not found" });
    }

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong" });
  }
};

export const deleteProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("DELETE FROM producto WHERE idProducto = ?", [id]);

    if (rows.affectedRows <= 0) {
      return res.status(404).json({ message: "Employee not found" });
    }

    res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong" });
  }
};

export const createProducto = async (req, res) => {
  try {
    const {
      nombre,
      descripcion,
      costo,
      tipoVenta,
      tallas,
      opcionAmedida,
      colores,
      codigo,
      categoria1,
      categoria2,
      indicacion,
      material,
      dimensionYpeso,
      otros,
      precio,
      efectos,
      silueta
    } = req.body;
    const [rows] = await pool.query(
      "INSERT INTO producto (nombre, descripcion, costo, tipoVenta, tallas, opcionAmedida, colores, codigo, categoria1, categoria2, indicacion, material, dimensionYpeso, otros, precio, efectos, silueta ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
      [nombre,
        descripcion,
        costo,
        tipoVenta,
        tallas,
        opcionAmedida,
        colores,
        codigo,
        categoria1,
        categoria2,
        indicacion,
        material,
        dimensionYpeso,
        otros,
        precio,
        efectos,
        silueta]
    );
    res.status(201).json({ id: rows.insertId, nombre,
      descripcion,
      costo,
      tipoVenta,
      tallas,
      opcionAmedida,
      colores,
      codigo,
      categoria1,
      categoria2,
      indicacion,
      material,
      dimensionYpeso,
      otros,
      precio,
      efectos,
      silueta });
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong" });
  }
};

export const updateProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, salary } = req.body;

    const [result] = await pool.query(
      "UPDATE producto SET name = IFNULL(?, name), salary = IFNULL(?, salary) WHERE id = ?",
      [name, salary, id]
    );

    if (result.affectedRows === 0)
      return res.status(404).json({ message: "Employee not found" });

    const [rows] = await pool.query("SELECT * FROM producto WHERE idProducto = ?", [
      id,
    ]);

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong" });
  }
};
