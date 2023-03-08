module.exports.home = async function (req, res, next) {
  let content = [];
  content.push({ view: "home/home", data: {} });
  res.render("backend/index", { content: content });
};
