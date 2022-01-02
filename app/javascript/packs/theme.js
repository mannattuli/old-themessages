window.addEventListener("DOMContentLoaded", (_event) => {
  const themeBtn = document.getElementById("themeBtn");
  const body = document.querySelector("body");

  themeBtn.addEventListener("click", function () {
    if (body.classList.contains(dark)) {
      body.classList.remove("dark");
      themeBtn.innerHTML = "light";
    } else {
      body.classList.add("dark");
      themeBtn.innerHTML = "dark";
    }
  });
});
