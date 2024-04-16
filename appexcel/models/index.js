const mysql = require('mysql');

function connectDatabase() {
    const connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'excell'
    });

    connection.connect((err) => {
        if (err) {
            console.error('Error connecting to MySQL:', err);
            throw err;
        }
        console.log('Connected to MySQL database');
    });

    return connection;
}

module.exports = connectDatabase;
