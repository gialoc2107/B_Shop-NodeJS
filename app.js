var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");

var indexRouter = require("./routes/index");
var usersRouter = require("./routes/users");

var app = express();

//session
const session = require("express-session");

app.use(
  session({
    secret: "ssshhhhh",
    resave: true,
    saveUninitialized: true,
  })
);

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public"))); //map cac file trong public dc goi truc tiep tu web browser

//set local session variables
app.use(function (req, res, next) {
  res.locals.fakeid = req.session.fakeid;
  res.locals.name = req.session.name;
  res.locals.address = req.session.address;
  res.locals.email = req.session.email;
  res.locals.phone = req.session.phone;
  res.locals.cart = req.session.cart;
  res.locals.amount = req.session.amount;
  res.locals.numberOfItem = req.session.numberOfItem;
  next();
});

app.use("/", indexRouter);
app.use("/users", usersRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
