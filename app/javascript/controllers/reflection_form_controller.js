import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  // Ctrl+Enter (or Cmd+Enter) で送信
  submit(event) {
    if ((event.ctrlKey || event.metaKey) && event.key === "Enter") {
      event.preventDefault()
      this.element.requestSubmit()
    }
  }

  // 送信完了時にクリア
  clear(event) {
    if (event.detail.success) {
      this.inputTarget.value = ""
      this.inputTarget.focus() // 続けて投稿しやすいようにフォーカスを戻す
    }
  }
}
