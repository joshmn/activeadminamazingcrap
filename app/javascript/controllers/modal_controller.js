import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = ["content"]
  connect() {
    this.selectTarget = null;

    this.handleCreate = this.handleCreate.bind(this)
    document.addEventListener('trigger:click', () => this.openModal(event))
    document.addEventListener('modal:created', this.handleCreate)
  }

  handleCreate(event) {
    const object = event.detail.content;
    this.selectTarget.innerHTML += `<option value="${object.id}" selected>${object.name}</option>`;
    this.closeModal()
  }

  openModal(event) {
    this.contentTarget.src = `${event.detail.url}`
    this.selectTarget = event.detail.select;
    this.element.open = true
    this._observe, this.unobserve = useClickOutside(this, { element: this.element })
  }

  clickOutside(event) {
    event.preventDefault()
    this.closeModal()
  }

  close(event) {
    event.preventDefault();
    event.target.closest('dialog').open = false;
    event.target.closest('turbo-frame').innerHTML = ""
    this.selectTarget = null;
  }

  closeModal() {
    this.element.open = false;
    this.contentTarget.innerHTML = ""
    this.contentTarget.src = ""
    this.selectTarget = null;
    this.unobserve()
  }

}
