
const express = require('express');
const { authz } = require('./auth');
const { sequelize, connectToDatabase, schema_name, changeSchemaName, getSchemaName } = require('./connection');
const { TENANT_HEADER, SCHEMA_NAME } = require('./constants');
const { Teacher, Teacher_Role } = require('./models');
const Student = require('./models/students');
const { createSchema } = require('./schema/schema');
const app = express();

app.use(express.urlencoded({ extended: true }));

app.get("/", async (req,res) => {
    res.json({message: "Server started at port no 3000", dbmsg: "Connection has been established successfully."});
});

app.post("/addTeacherPermission", authz, async (req,res) => {
    const id = req.body.id;
    const permission = req.body.permission;
    if(id && (permission === "read" || permission === "write")){
        const teacher = await Teacher.findByPk(id);
        if(!teacher)
            return res.json({error: true});
        Teacher_Role.create({ teacherId: id, roleId: permission === "read" ? 1 : 2 })
            .catch(err => {
                console.log(err);
                return res.json({error: true})
            });
        return res.json({status: 200, message : "Permission added!"});
    }
    return res.json({error: true});
});

app.get("/getAllTeachers", authz, async (req,res) => {
    const teachers = await Teacher.findAll();
    res.json(teachers);
});

app.post("/createTeacher", authz, async (req,res) => {
    const name = req.body.name;
    const standard = req.body.standard;
    if(name && standard){
        const transaction = await sequelize.transaction();
        try {
            const teacher = await Teacher.create({ name: name, standard: standard }, { transaction: transaction });
            await createSchema(teacher.id,transaction);
            await transaction.commit();
            return res.json(teacher);
        } catch (error) {
            console.log(error);
            await transaction.rollback();
        }
        return res.json({error: true});
    }
    return res.json({error:true});
});

app.get("/add5Students", authz, async (req,res) => {
    let no = 1;
    const students = [];
    const chars = "ABC";
    const tenant_id = req.header(TENANT_HEADER);
    const transaction = await sequelize.transaction();
    try {
        while (no < 6) {
            const name = (Math.random() + 1).toString(36).substring(5);
            const student = await Student.schema(SCHEMA_NAME+tenant_id).create({
                name: name,
                standard: Math.floor(Math.random() * 10) + 1, 
                class: chars.charAt(Math.floor(Math.random() * 3))
            },{ transaction: transaction })
            students.push(student);
            no++;
        }
        await transaction.commit();
    } catch (error) {
        console.log(error);
        await transaction.rollback();
    }        
    return res.json(students);
});

app.get("/getAllStudents", authz, async (req,res) => {
    const tenant_id = req.header(TENANT_HEADER);
    const transaction = await sequelize.transaction();
    try {
        const students = await Student.schema(SCHEMA_NAME+tenant_id).findAll({transaction: transaction});
        await transaction.commit();
        return res.json(students);
    } catch (error) {
        console.log(error);
        await transaction.rollback();
        return res.json({error: true});
    }        
});

app.listen(3000,() => {
    console.log("Server started at port no 3000");
    connectToDatabase();
});