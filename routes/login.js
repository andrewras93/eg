const express = require("express");
const router = express.Router();
const queryController = require("../controllers/queryController");
const bcrypt = require("bcrypt");
const validator = require("validator");

router.get("/signup", async function (req, res) {
  res.render("signup", {
    title: "Signup",
  });
});

router.post("/signup", async function (req, res) {
  const userEmail = req.body.email;
  const password = bcrypt.hashSync(req.body.password, 10);
  const userFirstname = validator.whitelist(
    req.body.firstname.toLowerCase(),
    "a-zæøå"
  );
  const userLastname = validator.whitelist(
    req.body.lastname.toLowerCase(),
    "a-zæøå"
  );

<<<<<<< HEAD
    if (
        validator.isEmail(userEmail) &&
        password &&
        userFirstname &&
        userLastname
    ) {
        try {
            const user = await queryController.handleQuery(
                `INSERT INTO users (email, password_hashed, firstname, lastname) VALUES ("${userEmail}","${password}","${userFirstname}","${userLastname}")`
            );

            if (user) {
                res.redirect("/login");
            }
        } catch(err) {
            res.render("signup", {
                title: "Signup",
                errorMsg: "Emailen er allerede registreret",
            });
        }
=======
  if (
    validator.isEmail(userEmail) &&
    password &&
    userFirstname &&
    userLastname
  ) {
    const user = await queryController.handleQuery(
      `INSERT INTO users (email, password_hashed, firstname, lastname) VALUES ("${userEmail}","${password}","${userFirstname}","${userLastname}")`
    );

    if (user) {
      res.redirect("/login");
    } else {
      res.render("signup", {
        title: "Signup",
        errorMsg: "Emailen er allerede registreret",
      });
>>>>>>> ce8ae20c7745767f51a69642ea533466df9b8b90
    }
  }
});

router.get("/", async function (req, res) {
  res.render("login", {
    title: "Login",
  });
});

router.post("/", async function (req, res) {
  const userEmail = req.body.email;
  const password = req.body.password;

  if (validator.isEmail(userEmail) && password) {
    const hashedPass = await queryController.handleQuery(
      `SELECT password_hashed FROM users WHERE email="${userEmail}"`
    );
    const pw = hashedPass[0]["password_hashed"];
    const verified = bcrypt.compareSync(password, pw);

    if (verified) {
      res.redirect("/");
    } else {
      res.render("login", {
        title: "Login",
        errorMsg: "Forkert email eller kode",
      });
    }
  }
});

module.exports = router;
