const paginator = function (
  baseUrl = "",
  perPage = 10,
  totalRows = 0,
  curPage = 1
) {
  end = Math.ceil(totalRows / perPage);
  start = 1;
  html = "<ul class='pagination'>";
  cssClass = curPage == 1 ? "disabled" : "";
  html +=
    "<li><a class='" +
    cssClass +
    "' href= '" +
    baseUrl +
    (curPage - 1) +
    "'>&laquo;</a></li>";

  for (i = start; i <= end; i++) {
    cssClass = curPage == i ? "active" : "";
    html +=
      "<li><a class='" +
      cssClass +
      "' href= '" +
      baseUrl +
      i +
      "'>" +
      i +
      "</a></li>";
  }

  cssClass = curPage == end ? "disable" : "";

  html +=
    "<li><a class='" +
    cssClass +
    "' href= '" +
    baseUrl +
    (curPage + 1) +
    "'>&raquo;</a></li>";
  html += "</ul>";
  return html;
};

module.exports = {
  paginator: paginator,
};
