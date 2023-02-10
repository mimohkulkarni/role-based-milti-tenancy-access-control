const { DataTypes } = require("sequelize");
const { sequelize } = require("../connection");

const Role = sequelize.define("roles",{
    name:{
        type: DataTypes.STRING,
    }
},{
    timestamps: false
});

module.exports = Role;