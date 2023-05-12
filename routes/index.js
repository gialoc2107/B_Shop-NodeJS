var express = require("express");
var router = express.Router();
var frontendController = require("../controllers/frontendController");
var backendHomeController = require("../controllers/backendHomeController");

var catController = require("../controllers/catController");
var productController = require("../controllers/productController");
var orderController = require("../controllers/orderController");
var userController = require("../controllers/userController");
var cartController = require("../controllers/cartController");

const { Template } = require("ejs");
var multer = require("multer");
var upload = multer({ dest: "public/images/" });

/* GET home page. */
router.get("/", frontendController.home);
router.get("/category/:id/:page", frontendController.category);
router.get("/detail/:id", frontendController.detail);
router.get("/registration", frontendController.registration);
router.use("/doRegistration", frontendController.doRegistration);
router.get("/login", frontendController.login);
router.post("/doLogin", frontendController.doLogin);
router.get("/logout", frontendController.logout);
router.get("/orderHistory/:id/:page", frontendController.orderHistory);

//backend
router.get("/backend", backendHomeController.home);

//category
router.get("/catList/:page", catController.catList);
router.get("/catAdd", catController.catAdd);
router.use("/doCatAdd", catController.doCatAdd);
router.use("/catEdit/:id", catController.catEdit);
router.use("/doCatEdit/:id", catController.doCatEdit);
router.use("/catTempDel/:id", catController.catTempDel);
router.get("/catTrash", catController.catListTrash);
router.use("/catRestore/:id", catController.catRestore);
router.use("/catDel/:id", catController.catDel);
router.use("/catChangeStatus/:id/:status", catController.catChangeStatus);

//product
router.get("/productList/:page", productController.productList);
router.get("/productAdd", productController.productAdd);
router.post("/doProductAdd", upload.any(), productController.doProductAdd);
router.use("/prdEdit/:id", productController.prdEdit);
router.use("/doPrdEdit/:id", upload.any(), productController.doPrdEdit);
router.use("/prdTempDel/:id", productController.prdTempDel);
router.get("/prdTrash", productController.prdListTrash);
router.use("/prdRestore/:id", productController.prdRestore);
router.use("/prdDel/:id", productController.prdDel);
router.use("/prdChangeStatus/:id/:status", productController.prdChangeStatus);

//order
router.get("/orderList/:page", orderController.orderList);
router.use("/orderEdit/:id", orderController.orderEdit);
router.use("/doOrderEdit/:id", orderController.doOrderEdit);
router.use("/orderTempDel/:id", orderController.orderTempDel);
router.get("/orderTrash", orderController.orderListTrash);
router.use("/orderRestore/:id", orderController.orderRestore);
router.use("/orderDel/:id", orderController.orderDel);
router.use("/orderChangeStatus/:id/:status", orderController.orderChangeStatus);
router.use("/orderDetail/:id", orderController.orderDetail);
router.use("/doOrderDetail/:id", orderController.doOrderDetail);

//user
router.get("/userList/:page", userController.userList);
router.use("/userEdit/:id", userController.userEdit);
router.use("/doUserEdit/:id", userController.doUserEdit);
router.use("/userTempDel/:id", userController.userTempDel);
router.get("/userTrash", userController.userListTrash);
router.use("/userRestore/:id", userController.userRestore);
router.use("/userDel/:id", userController.userDel);
router.use("/userChangeStatus/:id/:status", userController.userChangeStatus);
router.use("/userHistory/:id", userController.userHistory);

//cart
router.get("/addToCart/:id", cartController.addToCart);
router.get("/showCart", cartController.showCart);
router.get("/infoCart", cartController.infoCart);
router.post("/saveCart", cartController.saveCart);
router.get("/endCart", cartController.endCart);

module.exports = router;
