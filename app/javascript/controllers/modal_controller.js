import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]
  connect() {
    document.addEventListener('trigger:click', () => this.openModal(event))

    this.handleCreate = this.handleCreate.bind(this)
    document.addEventListener('modal:created', this.handleCreate)
  }

  handleCreate(event) {
    const customer = event.detail.content
    document.querySelector('#order_customer_id').innerHTML += `<option value="${customer.id}" selected>${customer.name}</option>`;
    this.element.style.display = "none"
    this.contentTarget.innerHTML = ""
    this.contentTarget.src = ""
  }

  openModal(event) {
    this.contentTarget.src = `${event.detail.url}`
    this.element.style.display = "block"

    this.contentTarget.addEventListener('turbo:frame-render', () => {
      const form = this.contentTarget.querySelector('form')
      form.addEventListener('turbo:submit-end', (event) => {
        console.log("submit-end", event)
      })
    })
  }

  garbage() {

  }
}
