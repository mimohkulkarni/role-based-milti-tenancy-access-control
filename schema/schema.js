const { sequelize } = require("../connection");
const Students = require("../models/students");

const createSchema = async (id, t) => {
    const res = await sequelize.query(`CREATE SCHEMA IF NOT EXISTS teacher_${id}`, { transaction: t });
    const res_schmema = await sequelize.query(`SET search_path TO teacher_${id}`, { transaction: t });
    const table_res = await createStudentsTable(t);
    return res && table_res && res_schmema;
}

const createStudentsTable = async (t) => {
    const res = await Students.sync({ transaction: t });
    return res;
}

const changeSchema = async (id, t) => {
    const res_schmema = await sequelize.query(`SET search_path TO teacher_${id}`);
    return res_schmema;
}

module.exports = { createSchema, changeSchema };