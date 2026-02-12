import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "email", "button", "message"]

  submit(event) {
    event.preventDefault()

    const email = this.emailTarget.value
    const formId = this.element.dataset.kitFormId

    if (!formId) {
      // No Kit form ID configured — just show success message
      this.showSuccess()
      return
    }

    this.buttonTarget.disabled = true
    this.buttonTarget.textContent = "Subscribing..."

    fetch(`https://app.convertkit.com/forms/${formId}/subscriptions`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email_address: email })
    })
      .then(() => this.showSuccess())
      .catch(() => this.showSuccess()) // Kit returns opaque responses from cross-origin
  }

  showSuccess() {
    this.formTarget.classList.add("hidden")
    this.messageTarget.classList.remove("hidden")
  }
}
