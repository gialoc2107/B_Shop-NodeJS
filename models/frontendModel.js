const mysql = require("../helpers/mysql");

async function getCategories() {
  let query = "SELECT id, category_name, parent FROM category WHERE status = 1";
  return await mysql.select(query);
}

async function getNewProducts() {
  let query = "SELECT * FROM products ORDER BY created_at DESC LIMIT 0, 6";
  return await mysql.select(query);
}

async function getSaleProducts() {
  let query = "SELECT * FROM products WHERE sale = 1 AND status = 1";
  return await mysql.select(query);
}

async function getProductsByCat(categoryId = 0, page = 1, perpage = 10) {
  let query = `SELECT * FROM products WHERE product_category = ${categoryId} AND status = 1 LIMIT ${
    (page - 1) * perpage
  }, ${perpage}`;
  return await mysql.select(query);
}

async function countProductsByCat(categoryId = 0) {
  let query = `SELECT * FROM products WHERE product_category = ${categoryId} AND status = 1`;
  rows = await mysql.select(query);
  return rows.length;
}

async function getProductsDetail(id) {
  let query = `SELECT * FROM products WHERE id = ${id}`;
  return await mysql.select(query);
}

async function getOrdersByUser(customerId = 0, page = 1, perpage = 10) {
  let query = `SELECT * FROM orders WHERE customer_id = ${customerId} AND status = 1 LIMIT ${
    (page - 1) * perpage
  }, ${perpage}`;
  return await mysql.select(query);
}

async function countOrdersByUser(customerId = 0) {
  let query = `SELECT * FROM orders WHERE customer_id = ${customerId} AND status = 1`;
  rows = await mysql.select(query);
  return rows.length;
}

async function getOrdersDetail() {
  let query = `SELECT * FROM order_details WHERE status = 1`;
  return await mysql.select(query);
}

async function getProducts() {
  let query = "SELECT * FROM products WHERE status = 1";
  return await mysql.select(query);
}

module.exports = {
  categories: getCategories,
  newProducts: getNewProducts,
  saleProducts: getSaleProducts,
  listProducts: getProductsByCat,
  countProductsByCat: countProductsByCat,
  getDetail: getProductsDetail,
  listOrders: getOrdersByUser,
  countOrdersByUser: countOrdersByUser,
  getOrdersDetail: getOrdersDetail,
  getProducts: getProducts,
};
