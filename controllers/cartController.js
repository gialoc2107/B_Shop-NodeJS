const frontendModel = require("../models/frontendModel");
const c = require("../helpers/common");
const cartModel = require("../models/cartModel");

module.exports.addToCart = async function (req, res, next) {
  if (req.session.cart == undefined) {
    req.session.cart = [];
    req.session.amount = [];
    req.session.numberOfItem = 0;
  }
  let id = req.params.id;
  k = req.session.cart.findIndex(function (v) {
    return id == v;
  });

  if (k == -1) {
    req.session.cart.push(id);
    req.session.amount.push(1);
    req.session.numberOfItem++;
  } else {
    req.session.amount[k]++;
  }
  res.redirect("/");
};

module.exports.showCart = async function (req, res, next) {
  let categories = await frontendModel.categories();
  if (req.session.cart == undefined) {
    cart = "Không có sản phẩm trong giỏ hàng";
  } else {
    cart = await cartModel.cart(req.session.cart);
  }
  let content = [];
  content.push({ view: "pages/cart/cart", data: { cart: cart } });
  res.render("index", { categories: categories, content: content });
};

module.exports.infoCart = async function (req, res, next) {
  let categories = await frontendModel.categories();
  cart = await cartModel.cart(req.session.cart);
  let content = [];
  content.push({ view: "pages/cart/infoCart", data: { cart: cart } });
  res.render("index", { categories: categories, content: content });
};

module.exports.saveCart = async function (req, res, next) {
  let categories = await frontendModel.categories();
  let order = [];
  let customerId = req.body.customerId;
  let fullname = req.body.fullname;
  let add = req.body.add;
  let email = req.body.email;
  let phone = req.body.phone;
  
  order.push(
    { customer_id: customerId},
    { fullname: fullname },
    { address: add },
    { email: email },
    { phone: phone }
  );
  await c.addRecord("orders", order);

  let lastId = await c.lastId("orders");
  let order_id = lastId[0].id;
  let shopCart = req.session.cart;
  let a = req.session.amount;
  let n = shopCart.length;

  let detail = [];
  for (i = 0; i < n; i++) {
    let productId = shopCart[i];
    let qty = a[i];

    detail.push(order_id, productId, qty);
  }
  await cartModel.addDetail(detail);
  req.session.destroy();
  res.redirect("/endCart");

  let content = [];
  content.push({ view: "pages/cart/saveCart", data: {} });
  res.render("index", { categories: categories, content: content });
};

module.exports.endCart = async function (req, res, next) {
  let categories = await frontendModel.categories();
  let content = [];
  content.push({ view: "pages/cart/endCart", data: {} });
  res.render("index", { categories: categories, content: content });
};
