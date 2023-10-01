import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    this.element.addEventListener('click', (event) => {
      event.preventDefault();
      this.dispatch("click", { detail: { url: event.target.dataset.src, select: event.target.closest('li').querySelector('select') } })
    })
  }
}
