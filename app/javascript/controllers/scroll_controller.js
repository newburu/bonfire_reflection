import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.scrollToBottom()
    this.observer = new MutationObserver(this.scrollToBottom.bind(this))
    this.observer.observe(this.element, { childList: true, subtree: true })
  }

  disconnect() {
    this.observer.disconnect()
  }

  scrollToBottom() {
    this.element.scrollTo({
      top: this.element.scrollHeight,
      behavior: "smooth"
    })
  }
}
