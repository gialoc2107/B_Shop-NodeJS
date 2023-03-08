const c = require("../helpers/common");
const paginator = require("../helpers/paginator");

module.exports.userList = async function (req, res, next) {
  let curPage = req.params.page;
  let baseUrl = "/userList/";
  let perPage = 10;
  let totalRows = await c.countRows("users", 0);
  let allUser = await c.getRecordByTrash("users", 0);
  let userTrash = await c.countRows("users", 1);
  let use = await c.getRecordByPage("users", curPage, perPage);
  let pager = paginator.paginator(baseUrl, perPage, totalRows, curPage);

  let content = [];
  content.push({
    view: "user/userList",
    data: {
      allUser: allUser,
      use: use,
      paginator: pager,
      userTrash: userTrash,
    },
  });
  res.render("backend/index", { content: content });
};

module.exports.userEdit = async function (req, res, next) {
  let id = req.params.id;
  let us = await c.getOne("users", id);
  let use = await c.getRecordByTrash("users", 0);
  let content = [];
  content.push({ view: "user/userEdit", data: { use: use, us: us } });
  res.render("backend/index", { content: content });
};

module.exports.doUserEdit = async function (req, res, next) {
  let id = req.params.id;
  let params = [];
  let n = req.body.name;
  let e = req.body.email;
  let pass = req.body.password;
  let p = req.body.phone;
  let a = req.body.address;
  let s = req.body.status;

  params.push(
    { name: n },
    { email: e },
    { password: pass },
    { phone: p },
    { address: a },
    { status: s }
  );
  await c.editRecord("users", params, id);
  res.redirect("/userList/1");
};

module.exports.userTempDel = async function (req, res, next) {
  let id = req.params.id;
  await c.delTempRestore("users", id, 1);
  res.redirect("/userList/1");
};

module.exports.userListTrash = async function (req, res, next) {
  let use = await c.getRecordByTrash("users", 1);
  let allUser = await c.getRecordByTrash("users", 0);
  let content = [];
  content.push({
    view: "user/userTrash",
    data: { use: use, allUser: allUser },
  });
  res.render("backend/index", { content: content });
};

module.exports.userRestore = async function (req, res, next) {
  let id = req.params.id;
  await c.delTempRestore("users", id, 0);
  res.redirect("/userTrash");
};

module.exports.userDel = async function (req, res, next) {
  let id = req.params.id;
  await c.delRecord("users", id);
  res.redirect("/userTrash");
};

module.exports.userChangeStatus = async function (req, res, next) {
  let id = req.params.id;
  let status = req.params.status;
  await c.changeStatus("users", id, status);
  res.redirect("/userList/1");
};

module.exports.userDetail = async function (req, res, next) {
  let id = req.params.id;
  let users = await c.getRecordByTrash("users", 0);
  let order = await c.getOne("orders", id);
  let orders = await c.getRecordByTrash("orders", 0);
  let orderDetail = await c.getRecordByTrash("order_details", 0);
  let products = await c.getRecordByTrash("products", 0);

  let content = [];
  content.push({
    view: "user/userDetail",
    data: {
      users: users,
      order: order,
      orders: orders,
      orderDetail: orderDetail,
      products: products,
    },
  });
  res.render("backend/index", { content: content });
};

module.exports.doUserDetail = async function (req, res, next) {
  let id = req.params.id;
  let params = [];
  await c.editRecord("users", params, id);
  res.redirect("/userList/1");
};

module.exports.userHistory = async function (req, res, next) {
  let curPage = req.params.page;
  let baseUrl = "/userHistory/:id/";
  let perPage = 10;
  let totalRows = await c.countRows("orders", 0);
  let pager = paginator.paginator(baseUrl, perPage, totalRows, curPage);
  let id = req.params.id;
  let users = await c.getRecordByTrash("users", 0);
  let user = await c.getOne("users", id);
  let orders = await c.getRecordByTrash("orders", 0);

  let content = [];
  content.push({
    view: "user/userHistory",
    data: { users: users, user: user, paginator: pager, orders: orders },
  });
  res.render("backend/index", { content: content });
};
