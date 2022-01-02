// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

window.addEventListener("turbolinks:load", (_event) => {
  const themeBtn = document.getElementById("themeBtn");
  const body = document.querySelector("body");

  themeBtn.addEventListener("click", function () {
    if (body.classList.contains("dark")) {
      body.classList.remove("dark");
      themeBtn.innerHTML = "light";
      localStorage.setItem("theme", "light");
    } else {
      body.classList.add("dark");
      themeBtn.innerHTML = "dark";
      localStorage.setItem("theme", "dark");
    }
  });

  let theme = localStorage.getItem("theme");

  if (theme === "light") {
    body.classList.remove("dark");
    themeBtn.innerHTML = "light";
    localStorage.setItem("theme", "light");
  } else {
    body.classList.add("dark");
    themeBtn.innerHTML = "dark";
    localStorage.setItem("theme", "dark");
  }
});
