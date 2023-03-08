const e = require("express");
var mysql = require("mysql");

var pool = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  user: "root",
  password: "",
  database: "b_shop",
});

const select = function (query) {
  return new Promise((resolve, reject) => {
    pool.query(query, function (err, rows, fields) {
      if (err) {
        reject(err);
      }
      resolve(rows);
    });
  });
};

module.exports = {
  select: select,
};
