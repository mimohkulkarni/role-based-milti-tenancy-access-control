const { Enforcer, newEnforcer } = require('casbin');
const path = require('path');
const { TEACHER_HEADER } = require('./constants');
const { Teacher, Role } = require('./models');

class BasicAuthorizer {
    constructor(req,enforcer){
        this.req = req;
        this.enforcer = enforcer;
    }

    async getUserRole(){
        const user = await Teacher.findByPk(this.req.header(TEACHER_HEADER),{include: Role});
        if(!user) return [];
        return user.roles;
    }

    async checkPermission(){
        const { req, enforcer } = this;
        const { originalUrl: path } = req;
        const userRoles = await this.getUserRole();
        const isAdmin = userRoles.map(r => r.name).includes("read") && userRoles.map(r => r.name).includes("write");
        if(isAdmin) return true;
        for (const role of userRoles) {
            const hasPermission = await enforcer.enforce("teacher",path,role.name);
            if(hasPermission) return true;
        }
        return false;
    }
}

module.exports = { 
    authz: async (req,res,next) => {        
        const enforcer = await newEnforcer(path.join(__dirname, 'config/model.conf'),path.join(__dirname, 'config/policy.csv'));;
        if(!(enforcer instanceof Enforcer))
            return res.status(500).json({ status: 500, message: "Invalid request" });
        
        const authorizer = new BasicAuthorizer(req,enforcer);
        const hasPermission = await authorizer.checkPermission();
        if(!hasPermission)
            return res.status(403).json({ status: 403, message: "Forbidden" });
        
        return next();
    }
}