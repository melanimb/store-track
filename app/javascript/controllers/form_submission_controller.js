import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('hi');
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 200)
  }
}
