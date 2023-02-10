const { Sequelize } = require("sequelize");

const sequelize = new Sequelize("multi_tenancy","postgres","root",{
    host:"localhost",
    port:5432,
    dialect:'postgres',
    logging: true
});

async function connectToDatabase(){
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
      } catch (error) {
        console.error('Unable to connect to the database:', error);
        throw new Error("Unable to connect to the database");
    }
    return sequelize;
}

module.exports = {
    sequelize,
    connectToDatabase
};