// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import {initFlatpicker} from "../plugins/flatpickr";
import { initMapbox } from '../plugins/init_mapbox';
import { initNavbarOnScroll } from '../components/init_navbar_on_scroll';
import { initTyped } from '../plugins/init_typed';





// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initTyped();
  initFlatpicker();
  initMapbox();
  initNavbarOnScroll();
  document.addEventListener("click", (event) => {
    console.log("test before")
    if (document.querySelector("video")) {
      console.log("test")
      document.querySelector("video").play()
    }
  })
});
