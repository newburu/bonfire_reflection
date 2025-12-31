import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.close()
  }

  toggle(event) {
    if (event) event.preventDefault()
    this.menuTarget.classList.toggle("hidden")
  }

  hide(event) {
    // クリックされた要素がこのコントローラーの要素内部であれば何もしない（メニュー内クリックなど）
    // ただし、トグルボタン自体は click->toggle で処理されるので、
    // "window" click イベントとしては「外側クリック」だけを拾いたい。
    if (!this.element.contains(event.target)) {
      this.close()
    }

    // エスケープキー対応
    if (event.type === 'keydown' && event.key === 'Escape') {
      this.close()
    }
  }

  close() {
    this.menuTarget.classList.add("hidden")
  }
}
