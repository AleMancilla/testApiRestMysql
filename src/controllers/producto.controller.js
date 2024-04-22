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
      nombre, descripcion, tipoVenta, tallas, opcionAmedida, colores, codigo, categorias, indicacion, material, dimension, otros, precio, efectos, silueta, urlImages, activo, stock, peso
    } = req.body;
    const [rows] = await pool.query(
      "INSERT INTO PRODUCTO (nombre, descripcion, tipoVenta, tallas, opcionAmedida, colores, codigo, categorias, indicacion, material, dimension, otros, precio, efectos, silueta, urlImages, activo, stock, peso) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
      [nombre, descripcion, tipoVenta, tallas, opcionAmedida, colores, codigo, categorias, indicacion, material, dimension, otros, precio, efectos, silueta, urlImages, activo, stock, peso]
    );
    res.status(201).json({ id: rows.insertId, nombre, descripcion, tipoVenta, tallas, opcionAmedida, colores, codigo, categorias, indicacion, material, dimension, otros, precio, efectos, silueta, urlImages, activo, stock, peso});
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
  }
};

export const updateProducto = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      nombre, descripcion, tipoVenta, tallas, opcionAmedida, colores, codigo, categorias, indicacion, material, dimension, otros, precio, efectos, silueta, urlImages, activo, stock, peso
    } = req.body;
    const [result] = await pool.query(
      "UPDATE PRODUCTO SET  nombre = IFNULL(?,nombre), descripcion = IFNULL(?,descripcion), tipoVenta = IFNULL(?,tipoVenta), tallas = IFNULL(?,tallas), opcionAmedida = IFNULL(?,opcionAmedida), colores = IFNULL(?,colores), codigo = IFNULL(?,codigo), categorias = IFNULL(?,categorias), indicacion = IFNULL(?,indicacion), material = IFNULL(?,material), dimension = IFNULL(?,dimension), otros = IFNULL(?,otros), precio = IFNULL(?,precio), efectos = IFNULL(?,efectos), silueta = IFNULL(?,silueta), urlImages = IFNULL(?,urlImages), activo = IFNULL(?,activo), stock = IFNULL(?,stock), peso = IFNULL(?,peso) WHERE idProducto = ?",
      
      [
        nombre, descripcion, tipoVenta, tallas, opcionAmedida, colores, codigo, categorias, indicacion, material, dimension, otros, precio, efectos, silueta, urlImages, activo, stock, peso, id]
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
