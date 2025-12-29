import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]


  connect() {
    this.resize()
  }

  // Ctrl+Enter (or Cmd+Enter) で送信
  submit(event) {
    if ((event.ctrlKey || event.metaKey) && event.key === "Enter") {
      event.preventDefault()
      this.element.requestSubmit()
    }
  }

  // 自動リサイズ
  resize() {
    const input = this.inputTarget
    input.style.height = "auto"
    input.style.height = `${input.scrollHeight}px`
  }

  // 送信完了時にクリア
  clear(event) {
    if (event.detail.success) {
      this.inputTarget.value = ""
      this.inputTarget.style.height = "auto" // リセット時はautoに戻す
      this.inputTarget.focus() // 続けて投稿しやすいようにフォーカスを戻す
    }
  }
}
