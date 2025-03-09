import { pool } from "../db.js";

export const getCitas = async (req, res) => {
  console.log(" ==== getCitasMedicas == ");
  try {
    const [rows] = await pool.query(`SELECT 
CITA_MEDICA.id as id_cita,
CITA_MEDICA.id_sucursal,
CITA_MEDICA.id_persona,
CITA_MEDICA.motivo_consulta,
CITA_MEDICA.fecha,
CITA_MEDICA.hora,
CITA_MEDICA.nombre_paciente,
CITA_MEDICA.edad,
CITA_MEDICA.sexo,
CITA_MEDICA.celular,
CITA_MEDICA.estado_cita,
CITA_MEDICA.medico_asignado,
USUARIO.foto,
USUARIO.nombre as nombre_usuario,
USUARIO.email,
USUARIO.uid,
USUARIO.phoneNumber,
SUCURSALES.nombre as nombre_sucursal,
SUCURSALES.ciudad,
SUCURSALES.direccion,
SUCURSALES.contacto,
SUCURSALES.foto,
SUCURSALES.horario,
SUCURSALES.gmaps_link 
FROM CITA_MEDICA, SUCURSALES, USUARIO
WHERE CITA_MEDICA.id_sucursal = SUCURSALES.id
AND CITA_MEDICA.id_persona = USUARIO.idUsuario`);
    res.json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};

export const getCita = async (req, res) => {
  console.log(" ==== getCitaMedica == ");
  try {
    const { id } = req.params;
    const [rows] = await pool.query("SELECT * FROM CITA_MEDICA WHERE id = ?", [
      id,
    ]);

    if (rows.length <= 0) {
      return res.status(404).json({ message: "Cita médica not found" });
    }

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};

export const deleteCita = async (req, res) => {
  console.log(" ==== deleteCitaMedica == ");
  try {
    const { id } = req.params;
    const [rows] = await pool.query("DELETE FROM CITA_MEDICA WHERE id = ?", [
      id,
    ]);

    if (rows.affectedRows <= 0) {
      return res.status(404).json({ message: "Cita médica not found" });
    }

    res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};

// Crear una nueva cita médica
export const createCita = async (req, res) => {
  console.log(" ==== createCitaMedica == ");

  try {
    const {
      id_sucursal,
      id_persona,
      motivo_consulta,
      fecha,
      hora,
      nombre_paciente,
      edad,
      sexo,
      celular,
      estado_cita,
      medico_asignado,
    } = req.body;

    const [rows] = await pool.query(
      `INSERT INTO CITA_MEDICA 
      (id_sucursal, id_persona, motivo_consulta, fecha, hora, nombre_paciente, edad, sexo, celular, estado_cita, medico_asignado, fechaCreacion) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())`,
      [
        id_sucursal,
        id_persona,
        motivo_consulta,
        fecha,
        hora,
        nombre_paciente,
        edad,
        sexo,
        celular,
        estado_cita || "pendiente",
        medico_asignado,
      ]
    );

    res.status(201).json({
      id: rows.insertId,
      id_sucursal,
      id_persona,
      motivo_consulta,
      fecha,
      hora,
      nombre_paciente,
      edad,
      sexo,
      celular,
      estado_cita: estado_cita || "pendiente",
      medico_asignado,
      fechaCreacion: new Date(), // Enviamos la fecha de creación actual
    });
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};

// Actualizar una cita médica
export const updateCita = async (req, res) => {
  console.log(" ==== updateCitaMedica == ");
  try {
    const { id } = req.params;
    const {
      id_sucursal,
      id_persona,
      motivo_consulta,
      fecha,
      hora,
      nombre_paciente,
      edad,
      sexo,
      celular,
      estado_cita,
      medico_asignado,
    } = req.body;

    const [result] = await pool.query(
      `UPDATE CITA_MEDICA SET 
      id_sucursal = IFNULL(?, id_sucursal), 
      id_persona = IFNULL(?, id_persona), 
      motivo_consulta = IFNULL(?, motivo_consulta), 
      fecha = IFNULL(?, fecha), 
      hora = IFNULL(?, hora), 
      nombre_paciente = IFNULL(?, nombre_paciente), 
      edad = IFNULL(?, edad), 
      sexo = IFNULL(?, sexo), 
      celular = IFNULL(?, celular), 
      estado_cita = IFNULL(?, estado_cita), 
      medico_asignado = IFNULL(?, medico_asignado) 
      WHERE id = ?`,
      [
        id_sucursal,
        id_persona,
        motivo_consulta,
        fecha,
        hora,
        nombre_paciente,
        edad,
        sexo,
        celular,
        estado_cita,
        medico_asignado,
        id,
      ]
    );

    if (result.affectedRows === 0)
      return res.status(404).json({ message: "Cita médica not found" });

    const [rows] = await pool.query(
      "SELECT * FROM CITA_MEDICA WHERE id = ?",
      [id]
    );

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong: " + error });
  }
};

