import Typed from 'typed.js';

const initTyped = () => {
  if (document.querySelector(".home.description")) {
    var options = {
      strings: ['', 'Anytime,', 'Anywhere,', 'and enjoy surfing for a day 🤙'],
      typeSpeed: 50,
      loop: true,
      loopCount: Infinity,
      showCursor: false
    };

    var typed = new Typed('.home.description', options);
  }
}

export { initTyped }
