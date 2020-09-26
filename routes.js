const express = require('express'); 

function eRoutes() {
    const router = express.Router();
    var employee = require('./repository/employee/employee.routes.js')(router);
    var department = require('./repository/department/department.routes.js')(router);
    return router;
}

module.exports = eRoutes;