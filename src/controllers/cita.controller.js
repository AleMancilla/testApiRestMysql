import { pool } from "../db.js";

export const getCitas = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM CITA");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: " + error });
  }
};

export const getCita = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("SELECT * FROM CITA WHERE idCita = ?", [
      id,
    ]);

    if (rows.length <= 0) {
      return res.status(404).json({ message: "CITA not found" });
    }

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong" });
  }
};

export const deleteCita = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("DELETE FROM CITA WHERE idCita = ?", [id]);

    if (rows.affectedRows <= 0) {
      return res.status(404).json({ message: "Cita not found" });
    }

    res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
  }
};

export const createCita = async (req, res) => {
  try {
    const {
      fechaCita, descripcion, idUsuario, numeroCelular, nombrePaciente, idSucursal
    } = req.body;

    // Formatear la consulta SQL con los valores
    const sqlQuery = `INSERT INTO CITA (fechaCita, descripcion, idUsuario, numeroCelular, nombrePaciente, idSucursal) VALUES ('${fechaCita}', '${descripcion}', '${idUsuario}', '${numeroCelular}', '${nombrePaciente}', '${idSucursal}')`;
    console.log('Consulta SQL:', sqlQuery);



    const [rows] = await pool.query(sqlQuery);
    res.status(201).json({ id: rows.insertId, fechaCita, descripcion, idUsuario, numeroCelular, nombrePaciente, idSucursal});
  } catch (error) {

  console.error('Error al ejecutar la consulta:', error);
    return res.status(500).json({ message: "Something goes wrong: "+ error +" ___ "});
  }
};

export const updateCita = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      fechaCita, descripcion, idUsuario, numeroCelular, nombrePaciente, idSucursal
    } = req.body;
    const [result] = await pool.query(
      
      "UPDATE CITA SET fechaCita = IFNULL(?,fechaCita), descripcion  = IFNULL(?,descripcion), idUsuario = IFNULL(?,idUsuario), numeroCelular = IFNULL(?,numeroCelular) , nombrePaciente = IFNULL(?,nombrePaciente), idSucursal = = IFNULL(?,idSucursal) WHERE idCita = ?",
      
      [
        fechaCita, descripcion, idUsuario, numeroCelular, nombrePaciente, idSucursal, id]
    );

    if (result.affectedRows === 0)
      return res.status(404).json({ message: "CITA not found" });

    const [rows] = await pool.query("SELECT * FROM CITA WHERE idProducto = ?", [
      id,
    ]);

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something goes wrong: "+ error });
  }
};
