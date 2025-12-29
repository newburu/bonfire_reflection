import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { speed: { type: Number, default: 30 } }

  connect() {
    this.text = this.element.textContent.trim()
    this.element.textContent = ""
    this.index = 0
    this.type()
  }

  type() {
    if (this.index < this.text.length) {
      this.element.textContent += this.text.charAt(this.index)
      this.index++

      // Randomize speed slightly for natural feel
      const randomSpeed = this.speedValue + (Math.random() * 20 - 10)
      setTimeout(this.type.bind(this), randomSpeed)

      // Trigger scroll
      this.element.scrollIntoView({ behavior: "smooth", block: "nearest" })
    }
  }
}
