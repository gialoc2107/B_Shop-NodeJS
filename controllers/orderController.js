const c = require("../helpers/common");
const paginator = require("../helpers/paginator");

module.exports.orderList = async function (req, res, next) {
  let curPage = req.params.page;
  let baseUrl = "/orderList/";
  let perPage = 10;
  let totalRows = await c.countRows("orders", 0);
  let allOrder = await c.getRecordByTrash("orders", 0);
  let orderTrash = await c.countRows("orders", 1);
  let oder = await c.getRecordByPage("orders", curPage, perPage);
  let pager = paginator.paginator(baseUrl, perPage, totalRows, curPage);

  let content = [];
  content.push({
    view: "order/orderList",
    data: {
      allOrder: allOrder,
      oder: oder,
      paginator: pager,
      orderTrash: orderTrash,
    },
  });
  res.render("backend/index", { content: content });
};

module.exports.orderEdit = async function (req, res, next) {
  let id = req.params.id;
  let ord = await c.getOne("orders", id);
  let oder = await c.getRecordByTrash("orders", 0);
  let content = [];
  content.push({ view: "order/orderEdit", data: { oder: oder, ord: ord } });
  res.render("backend/index", { content: content });
};

module.exports.doOrderEdit = async function (req, res, next) {
  let id = req.params.id;
  let params = [];
  let name = req.body.full_name;
  let a = req.body.address;
  let e = req.body.email;
  let p = req.body.phone;
  let s = req.body.status;

  params.push(
    { fullname: name },
    { address: a },
    { email: e },
    { phone: p },
    { status: s }
  );
  await c.editRecord("orders", params, id);
  res.redirect("/orderList/1");
};

module.exports.orderTempDel = async function (req, res, next) {
  let id = req.params.id;
  await c.delTempRestore("orders", id, 1);
  res.redirect("/orderList/1");
};

module.exports.orderListTrash = async function (req, res, next) {
  let oder = await c.getRecordByTrash("orders", 1);
  let allOrder = await c.getRecordByTrash("orders", 0);
  let content = [];
  content.push({
    view: "order/orderTrash",
    data: { oder: oder, allOrder: allOrder },
  });
  res.render("backend/index", { content: content });
};

module.exports.orderRestore = async function (req, res, next) {
  let id = req.params.id;
  await c.delTempRestore("orders", id, 0);
  res.redirect("/orderTrash");
};

module.exports.orderDel = async function (req, res, next) {
  let id = req.params.id;
  await c.delRecord("orders", id);
  res.redirect("/orderTrash");
};

module.exports.orderChangeStatus = async function (req, res, next) {
  let id = req.params.id;
  let status = req.params.status;
  await c.changeStatus("orders", id, status);
  res.redirect("/orderList/1");
};

module.exports.orderDetail = async function (req, res, next) {
  let id = req.params.id;
  let users = await c.getRecordByTrash("users", 0);
  let order = await c.getOne("orders", id);
  let orders = await c.getRecordByTrash("orders", 0);
  let orderDetail = await c.getRecordByTrash("order_details", 0);
  let products = await c.getRecordByTrash("products", 0);

  let content = [];
  content.push({
    view: "order/orderDetail",
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

module.exports.doOrderDetail = async function (req, res, next) {
  let id = req.params.id;
  let params = [];
  await c.editRecord("orders", params, id);
  res.redirect("/orderList/1");
};
