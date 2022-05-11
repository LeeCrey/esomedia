import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icons"
export default class extends Controller {
  static values = {
    icon: String,
  }

  static targets = ['icon']

  connect() {
    console.log(this.iconValue);

    if (window.screen.width <= 640) {
      if (this.iconTarget.parentNode.classList.contains('active')) {
        // this.classList.
      }
    }
  }
}
