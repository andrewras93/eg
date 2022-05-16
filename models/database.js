const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'eg'
});

connection.connect((err) => {
    if (err) {
        console.log(err);
        return;
    } else {
        console.log(`Connection to database "${connection.config.database}" established.`);
    }
});

module.exports = connection;