const Role = require("./roles");
const Teacher = require("./teachers");
const Teacher_Role = require("./teacher_roles");

Role.belongsToMany(Teacher, { through: Teacher_Role });
Teacher.belongsToMany(Role, { through: Teacher_Role });

module.exports = {
    Role: Role,
    Teacher: Teacher,
    Teacher_Role: Teacher_Role
}