import Password from "./registration/password_controller";

// Connects to data-controller="login"
export default class extends Password {
  static targets = ['theme']

  connect() {
    super.connect()

    var theme = sessionStorage.getItem('theme')
    if (theme !== null) {
      if (theme === 'dark') {
        this.themeTarget.checked = true
      }
    }
  }
}
