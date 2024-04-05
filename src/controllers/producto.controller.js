import { pool } from "../db.js";

export const getProductos = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM PRODUCTO");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: " + error });
  }
};

export const getProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("SELECT * FROM PRODUCTO WHERE idProducto = ?", [
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

export const deleteProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("DELETE FROM PRODUCTO WHERE idProducto = ?", [id]);

    if (rows.affectedRows <= 0) {
      return res.status(404).json({ message: "Product not found" });
    }

    res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
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
      silueta,
      urlImages
    } = req.body;
    const [rows] = await pool.query(
      "INSERT INTO PRODUCTO (nombre, descripcion, costo, tipoVenta, tallas, opcionAmedida, colores, codigo, categoria1, categoria2, indicacion, material, dimensionYpeso, otros, precio, efectos, silueta, urlImages ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
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
        silueta,
        urlImages]
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
      silueta,
      urlImages });
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
  }
};

export const updateProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, salary } = req.body;

    const [result] = await pool.query(
      "UPDATE PRODUCTO SET name = IFNULL(?, name), salary = IFNULL(?, salary) WHERE id = ?",
      [name, salary, id]
    );

    if (result.affectedRows === 0)
      return res.status(404).json({ message: "Product not found" });

    const [rows] = await pool.query("SELECT * FROM PRODUCTO WHERE idProducto = ?", [
      id,
    ]);

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
  }
};
