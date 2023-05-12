const frontendModel = require("../models/frontendModel");
const paginator = require("../helpers/paginator");
const c = require("../helpers/common");
var crypto = require("crypto");

module.exports.home = async function (req, res, next) {
  let categories = await frontendModel.categories();
  let newProducts = await frontendModel.newProducts();
  let saleProducts = await frontendModel.saleProducts();
  let content = [];
  content.push({
    view: "partial/items",
    data: { products: saleProducts, title: "Sản phẩm khuyến mãi" },
  });
  content.push({
    view: "partial/newitems",
    data: { products: newProducts, title: "Sản phẩm mới" },
  });
  res.render("index", { categories: categories, content: content });
};

module.exports.category = async function (req, res, next) {
  let categoryId = req.params.id;
  let curPage = req.params.page;
  let perPage = 6;
  let baseUrl = "/category/" + categoryId + "/";
  let totalRows = await frontendModel.countProductsByCat(categoryId);
  let pager = paginator.paginator(baseUrl, perPage, totalRows, curPage);
  let products = await frontendModel.listProducts(categoryId, curPage, perPage);
  let categories = await frontendModel.categories();

  let content = [];
  content.push({
    view: "products/productList",
    data: { products: products, title: "Tất cả sản phẩm" },
  });
  res.render("index", {
    categories: categories,
    content: content,
    paginator: pager,
  });
};

module.exports.detail = async function (req, res, next) {
  let categories = await frontendModel.categories();
  let productId = req.params.id;
  let productDetail = await frontendModel.getDetail(productId);
  let content = [];
  content.push({
    view: "products/productDetail",
    data: { products: productDetail, title: "Chi tiết sản phẩm" },
  });
  res.render("index", { categories: categories, content: content });
};

module.exports.registration = async function (req, res, next) {
  let categories = await frontendModel.categories();
  let content = [];
  content.push({
    view: "pages/registration",
    data: { title: "Đăng ký thành viên" },
  });
  res.render("index", { categories: categories, content: content });
};

module.exports.doRegistration = async function (req, res, next) {
  let categories = await frontendModel.categories();
  let params = [];
  let name = req.body.name;
  let email = req.body.email;
  let phone = req.body.phone;
  let add = req.body.address;
  let pass = req.body.psw;

  var sha = crypto.createHash("sha1");
  sha.update(pass);
  let p = sha.digest("hex");
  params.push(
    { name: name },
    { password: p },
    { email: email },
    { address: add },
    { phone: phone }
  );
  await c.addRecord("users", params);

  let content = [];
  content.push({
    view: "pages/doRegistration",
    data: { title: "Đăng ký thành viên" },
  });
  res.render("index", { categories: categories, content: content });
};

module.exports.login = async function (req, res, next) {
  let categories = await frontendModel.categories();
  let content = [];
  content.push({ view: "pages/login", data: { title: "Đăng nhập" } });
  res.render("index", { categories: categories, content: content });
};

module.exports.doLogin = async function (req, res, next) {
  let email = req.body.email;
  let pass = req.body.pass;
  var sha = crypto.createHash("sha1");
  sha.update(pass);
  let p = sha.digest("hex");
  let result = await c.doLogin(email, p, "");
  if (result == 0) {
    res.redirect("/login");
  } else {
    req.session.fakeid = result[0].id;
    req.session.name = result[0].name;
    req.session.address = result[0].address;
    req.session.email = result[0].email;
    req.session.phone = result[0].phone;
    res.redirect("/");
  }
};

module.exports.logout = async function (req, res, next) {
  req.session.destroy();
  res.redirect("/");
};

module.exports.orderHistory = async function (req, res, next) {
  let customerId = req.params.id;
  let curPage = req.params.page;
  let perPage = 10;
  let baseUrl = "/orderHistory/" + customerId + "/";
  let totalRows = await frontendModel.countProductsByCat(customerId);
  let pager = paginator.paginator(baseUrl, perPage, totalRows, curPage);
  let orderDetail = await frontendModel.getOrdersDetail();
  let products = await frontendModel.getProducts();
  let orders = await frontendModel.listOrders(customerId, curPage, perPage);
  let categories = await frontendModel.categories();

  let content = [];
  content.push({
    view: "partial/orderHistory",
    data: {
      products: products,
      orderDetail: orderDetail,
      orders: orders,
      title: "Tất cả đơn hàng",
    },
  });
  res.render("index", {
    categories: categories,
    content: content,
    paginator: pager,
  });
};
