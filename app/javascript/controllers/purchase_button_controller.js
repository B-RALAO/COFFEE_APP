import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purchase-button"
export default class extends Controller {
  static targets = [ "toggleButton" ]

  connect() {
    console.log("You're good to go!")
  }

  toggle() {
    console.log("You're the man")
    console.log(this.toggleButtonTarget)
  }
}
