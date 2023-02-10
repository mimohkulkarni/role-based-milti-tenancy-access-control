const { DataTypes } = require("sequelize");
const { sequelize } = require("../connection");
const Role = require("./roles");
const Teacher = require("./teachers");

const Teacher_Role = sequelize.define("teacher_roles",{
    teacherId:{
        type: DataTypes.INTEGER,
        references: {
            model: Teacher,
            key: 'id'
        }
    },
    roleId:{
        type: DataTypes.INTEGER,
        references: {
            model: Role,
            key: 'id'
        }
    }
},{
    timestamps: false
});

module.exports = Teacher_Role;