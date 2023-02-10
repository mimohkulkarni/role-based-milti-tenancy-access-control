const { DataTypes } = require("sequelize");
const { sequelize } = require("../connection");

const Teacher = sequelize.define("teachers",{
    name:{
        type: DataTypes.STRING,
    },
    standard:{
        type: DataTypes.INTEGER,
    }
},{
    timestamps: false
});

module.exports = Teacher;