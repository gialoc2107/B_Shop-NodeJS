const mysql = require("../helpers/mysql");

async function cart(c) {
  cart = [];
  n = c.length;
  for (let i = 0; i < n; i++) {
    let query = `SELECT * FROM products WHERE id = ${c[i]}`;
    let item = await mysql.select(query);
    cart.push(item);
  }
  return cart;
}

async function addDetail(params = []) {
  let n = params.length;
  let r = n / 3;
  let query = "INSERT INTO order_details(order_id, product_id, qty) VALUES ";

  for (i = 0; i < n; i++) {
    if (i % 3 == 0) {
      query += "(";
    }
    if (i % 3 != 2) {
      query += params[i] + ",";
    } else {
      if (i == n - 1) {
        query += params[i] + ")";
      } else {
        query += params[i] + "),";
      }
    }
  }
  return await mysql.select(query);
}

module.exports = {
  cart: cart,
  addDetail: addDetail,
};
