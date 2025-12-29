import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.scrollToBottom()
    this.observer = new MutationObserver((mutations) => {
      this.scrollToBottom()
    })
    this.observer.observe(this.element, { childList: true, subtree: false })
  }

  scrollToBottom() {
    setTimeout(() => {
      this.element.scrollTo({
        top: this.element.scrollHeight,
        behavior: "smooth"
      })
    }, 50)
  }
}
