const c = require("../helpers/common");
const paginator = require("../helpers/paginator");
const { categories } = require("../models/frontendModel");

module.exports.catList = async function (req, res, next) {
  let curPage = req.params.page;
  let baseUrl = "/catList/";
  let perPage = 10;
  let totalRows = await c.countRows("category", 0);
  let allCat = await c.getRecordByTrash("category", 0);
  let catTrash = await c.countRows("category", 1);
  let categories = await c.getRecordByPage("category", curPage, perPage);
  let pager = paginator.paginator(baseUrl, perPage, totalRows, curPage);

  let content = [];
  content.push({
    view: "category/catList",
    data: {
      allCat: allCat,
      categories: categories,
      paginator: pager,
      catTrash: catTrash,
    },
  });
  res.render("backend/index", { content: content });
};

module.exports.catAdd = async function (req, res, next) {
  let categories = await c.getRecordByTrash("category", 0);
  let content = [];
  content.push({ view: "category/catAdd", data: { categories: categories } });
  res.render("backend/index", { content: content });
};

module.exports.doCatAdd = async function (req, res, next) {
  let params = [];
  let catName = req.body.cat_name;
  let p = req.body.parent;
  let s = req.body.status;

  params.push({ category_name: catName }, { parent: p }, { status: s });
  await c.addRecord("category", params);
  res.redirect("/catList/1");
};

module.exports.catEdit = async function (req, res, next) {
  let id = req.params.id;
  let cat = await c.getOne("category", id);
  let categories = await c.getRecordByTrash("category", 0);
  let content = [];
  content.push({
    view: "category/catEdit",
    data: { categories: categories, cat: cat },
  });
  res.render("backend/index", { content: content });
};

module.exports.doCatEdit = async function (req, res, next) {
  let id = req.params.id;
  let params = [];
  let catName = req.body.cat_name;
  let p = req.body.parent;
  let s = req.body.status;

  params.push({ category_name: catName }, { parent: p }, { status: s });
  await c.editRecord("category", params, id);
  res.redirect("/catList/1");
};

module.exports.catTempDel = async function (req, res, next) {
  let id = req.params.id;
  await c.delTempRestore("category", id, 1);
  res.redirect("/catList/1");
};

module.exports.catListTrash = async function (req, res, next) {
  let categories = await c.getRecordByTrash("category", 1);
  let allCat = await c.getRecordByTrash("category", 0);
  let content = [];
  content.push({
    view: "category/catTrash",
    data: { categories: categories, allCat: allCat },
  });
  res.render("backend/index", { content: content });
};

module.exports.catRestore = async function (req, res, next) {
  let id = req.params.id;
  await c.delTempRestore("category", id, 0);
  res.redirect("/catTrash");
};

module.exports.catDel = async function (req, res, next) {
  let id = req.params.id;
  await c.delRecord("category", id);
  res.redirect("/catTrash");
};

module.exports.catChangeStatus = async function (req, res, next) {
  let id = req.params.id;
  let status = req.params.status;
  await c.changeStatus("category", id, status);
  res.redirect("/catList/1");
};
