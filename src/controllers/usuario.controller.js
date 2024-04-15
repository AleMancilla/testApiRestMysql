import { pool } from "../db.js";

export const getUsuarios = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM USUARIO");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: " + error });
  }
};

export const getUsuario = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("SELECT * FROM USUARIO WHERE uid = ?", [
      id,
    ]);

    if (rows.length <= 0) {
      return res.status(404).json({ message: "Usuario not found" });
    }

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong" });
  }
};

export const deleteUsuario = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("DELETE FROM USUARIO WHERE idUsuario = ?", [id]);

    if (rows.affectedRows <= 0) {
      return res.status(404).json({ message: "Product not found" });
    }

    res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
  }
};

// INSERT INTO `railway`.`USUARIO` (`foto`, `nombre`, `email`, `uid`, `phoneNumber`, `rol`) VALUES ('test.jpg', 'ale test', 'test@gmail.com', 'adsasfr2134s', '65537461', 'admin');

export const createUsuario = async (req, res) => {
  
  try {
    const {
      foto, 
      nombre, 
      email, 
      uid, 
      phoneNumber, 
      rol
    } = req.body;
    const [rows] = await pool.query(
      "INSERT INTO USUARIO (foto, nombre, email, uid, phoneNumber, rol) VALUES (?,?,?,?,?,?)",
      [foto, 
        nombre, 
        email, 
        uid, 
        phoneNumber, 
        rol]
    );
    res.status(201).json({ id: rows.insertId, foto, 
      nombre, 
      email, 
      uid, 
      phoneNumber, 
      rol});
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
  }
};

export const updateUsuario = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      
      foto, 
      nombre, 
      email, 
      uid, 
      phoneNumber, 
      rol
    } = req.body;
    const [result] = await pool.query(
      "UPDATE USUARIO SET  foto = IFNULL(?, foto), nombre = IFNULL(?, nombre), email = IFNULL(?, email), uid = IFNULL(?, uid), phoneNumber = IFNULL(?, phoneNumber), rol = IFNULL(?, rol) WHERE idUsuario = ?",
      [
      foto, 
      nombre, 
      email, 
      uid, 
      phoneNumber, 
      rol, id]
    );

    if (result.affectedRows === 0)
      return res.status(404).json({ message: "Product not found" });

    const [rows] = await pool.query("SELECT * FROM USUARIO WHERE idUsuario = ?", [
      id,
    ]);

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
  }
};
