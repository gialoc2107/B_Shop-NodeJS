const { query } = require("express");
const mysql = require("./mysql");

async function getOne(table, id) {
  let query = `SELECT * FROM ${table} WHERE id = ${id}`;
  return await mysql.select(query);
}

async function addRecord(table, params = []) {
  txtKey = "";
  txtValue = "";
  i = 0;
  n = params.length;

  params.forEach(function (item) {
    Object.keys(item).forEach(function (key) {
      if (i < n - 1) {
        txtKey += key + ", ";
        txtValue += "'" + item[key] + "', ";
      } else {
        txtKey += key;
        txtValue += "'" + item[key] + "'";
      }
    });
    i++;
  });
  let query =
    "INSERT INTO " + table + "(" + txtKey + ") VALUES (" + txtValue + ")";
  return await mysql.select(query);
}

async function editRecord(table, params = [], id) {
  txtSet = "";
  txtValue = "";
  i = 0;
  n = params.length;

  params.forEach(function (item) {
    Object.keys(item).forEach(function (key) {
      if (i < n - 1) {
        txtSet += key + " = '" + item[key] + "', ";
      } else {
        txtSet += key + " = '" + item[key] + "'";
      }
    });
    i++;
  });
  let query = "UPDATE " + table + " SET " + txtSet + " WHERE id = " + id;
  return await mysql.select(query);
}

async function countRows(table, trash = 0) {
  let query = `SELECT * FROM ${table} WHERE trash = ${trash}`;
  rows = await mysql.select(query);
  return rows.length;
}

async function getRecordByTrash(table, trash = 0) {
  let query = `SELECT * FROM ${table} WHERE trash = ${trash}`;
  return await mysql.select(query);
}

async function getRecordByPage(table, page = 1, perPage = 10) {
  let query = `SELECT * FROM ${table} WHERE trash = 0 LIMIT ${
    (page - 1) * perPage
  }, ${perPage}`;
  return await mysql.select(query);
}

async function delTempRestore(table, id, trash) {
  let query = `UPDATE ${table} SET trash = ${trash} WHERE id = ${id}`;
  return await mysql.select(query);
}

async function delRecord(table, id) {
  let query = `DELETE FROM ${table} WHERE id = ${id}`;
  return await mysql.select(query);
}

async function changeStatus(table, id, status) {
  let query = `UPDATE ${table} SET status = ${status} WHERE id = ${id}`;
  return await mysql.select(query);
}

async function doLogin(email, pass, role) {
  let query = `SELECT * FROM users WHERE trash = 0 AND email = '${email}' AND password = '${pass}' AND role = '${role}'`;
  rows = await mysql.select(query);
  if (rows.length != 0) {
    return rows;
  }
  return 0;
}

async function getLastId(table) {
  let query = `SELECT MAX(id) as id FROM ${table}`;
  return await mysql.select(query);
}

module.exports = {
  getOne: getOne,
  addRecord: addRecord,
  editRecord: editRecord,
  countRows: countRows,
  getRecordByPage: getRecordByPage,
  getRecordByTrash: getRecordByTrash,
  delTempRestore: delTempRestore,
  delRecord: delRecord,
  changeStatus: changeStatus,
  doLogin: doLogin,
  lastId: getLastId,
};
