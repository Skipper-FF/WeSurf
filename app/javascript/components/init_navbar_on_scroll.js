
// TO ADD IN components/init_navbar_transparency.js

const initNavbarOnScroll = () => {
  $(window).scroll(function () {
    // Change 100 to whatever suits you
    const navbar = document.querySelector(".navbar")
    if (navbar.dataset.transparent === "true") {
      if ($(window).scrollTop() >= 552) {
        navbar.style.background = "white"
        navbar.querySelectorAll(".nav-link").forEach((navLink) => {
          navLink.classList.remove("nav-link")
          navLink.classList.add("nav-link-black")
        })
        const navTitle = navbar.querySelector(".nav-title-link")
        navTitle.classList.remove("nav-title-link")
        navTitle.classList.add("nav-title-link-black")
      } else {
        navbar.style.background = "transparent"
        navbar.querySelectorAll(".nav-link-black").forEach((navLink) => {
          navLink.classList.add("nav-link")
          navLink.classList.remove("nav-link-black")
        })
        const navTitle = navbar.querySelector(".nav-title-link-black")
        navTitle.classList.add("nav-title-link")
        navTitle.classList.remove("nav-title-link-black")
      }
    }
  })
}

export { initNavbarOnScroll }
