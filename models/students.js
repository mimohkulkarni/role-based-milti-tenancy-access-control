const { DataTypes, Model } = require("sequelize");
const { sequelize } = require("../connection");

class Student extends Model {}

Student.init({
    id:{
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true
    },
    name:{
        type: DataTypes.STRING,
    },
    class:{
        type: DataTypes.STRING,
    },
    standard:{
        type: DataTypes.INTEGER,
    }
},{
    sequelize: sequelize,
    modelName: 'students',
    timestamps: false
});

module.exports = Student;