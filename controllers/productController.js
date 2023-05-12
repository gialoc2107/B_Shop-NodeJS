const c = require("../helpers/common");
const paginator = require("../helpers/paginator");
const fs = require("fs");

module.exports.productList = async function (req, res, next) {
  let curPage = req.params.page;
  let baseUrl = "/productList/";
  let perPage = 10;
  let allPrd = await c.getRecordByTrash("products", 0);
  let totalRows = await c.countRows("products", 0);
  let products = await c.getRecordByPage("products", curPage, perPage);
  let categories = await c.getRecordByTrash("category", 0);
  let pager = paginator.paginator(baseUrl, perPage, totalRows, curPage);
  let prdTrash = await c.countRows("products", 1);

  let content = [];
  content.push({
    view: "product/prdList",
    data: {
      allPrd: allPrd,
      categories: categories,
      products: products,
      paginator: pager,
      prdTrash: prdTrash,
    },
  });
  res.render("backend/index", { content: content });
};

module.exports.productAdd = async function (req, res, next) {
  let categories = await c.getRecordByTrash("category", 0);
  let content = [];
  content.push({ view: "product/prdAdd", data: { categories: categories } });
  res.render("backend/index", { content: content });
};

module.exports.doProductAdd = async function (req, res, next) {
  let file = req.files[0];
  await fs.rename(
    file.path,
    `public/images/${file.originalname}`,
    function (err) {}
  );
  let params = [];
  let name = req.body.prd_name;
  let price = req.body.price;
  let detail = req.body.editor1;
  let cat = req.body.category;
  let status = req.body.status;

  params.push(
    { product_name: name },
    { price: price },
    { product_detail: detail },
    { product_category: cat },
    { image: file.originalname },
    { status: status }
  );
  await c.addRecord("products", params);
  res.redirect("/productList/1");
};

module.exports.prdEdit = async function (req, res, next) {
  let id = req.params.id;
  let prd = await c.getOne("products", id);
  let categories = await c.getRecordByTrash("category", 0);
  let content = [];
  content.push({
    view: "product/prdEdit",
    data: { categories: categories, prd: prd },
  });
  res.render("backend/index", { content: content });
};

module.exports.doPrdEdit = async function (req, res, next) {
  let id = req.params.id;
  let file = req.files[0];
  await fs.rename(
    file.path,
    `public/images/${file.originalname}`,
    function (err) {}
  );
  let params = [];
  let name = req.body.prd_name;
  let p = req.body.Price;
  let detail = req.body.editor1;
  let cat = req.body.category;
  let status = req.body.status;

  params.push(
    { product_name: name },
    { price: p },
    { product_detail: detail },
    { product_category: cat },
    { image: file.originalname },
    { status: status }
  );
  await c.editRecord("products", params, id);
  res.redirect("/productList/1");
};

module.exports.prdTempDel = async function (req, res, next) {
  let id = req.params.id;
  await c.delTempRestore("products", id, 1);
  res.redirect("/productList/1");
};

module.exports.prdListTrash = async function (req, res, next) {
  let products = await c.getRecordByTrash("products", 1);
  let categories = await c.getRecordByTrash("category", 0);
  let allPrd = await c.getRecordByTrash("products", 0);
  let content = [];
  content.push({
    view: "product/prdTrash",
    data: { products: products, categories: categories, allPrd: allPrd },
  });
  res.render("backend/index", { content: content });
};

module.exports.prdRestore = async function (req, res, next) {
  let id = req.params.id;
  await c.delTempRestore("products", id, 0);
  res.redirect("/prdTrash");
};

module.exports.prdDel = async function (req, res, next) {
  let id = req.params.id;
  await c.delRecord("products", id);
  res.redirect("/prdTrash");
};

module.exports.prdChangeStatus = async function (req, res, next) {
  let id = req.params.id;
  let status = req.params.status;
  await c.changeStatus("products", id, status);
  res.redirect("/productList/1");
};
