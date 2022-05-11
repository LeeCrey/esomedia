import ApplicationController from "../application_controller"

// Connects to data-controller="registration--edit"
export default class EditController extends ApplicationController {
  static targets = ['biography', 'biographyCharsCount']

  static values = {
    biographyCount: Number
  }

  connect() {
    var value = this.biographyTarget.value.length
    // fires biographyCountValueChanged event
    this.biographyCountValue = value
  }

  changeCharsCount(event) {
    this.biographyCountValue = event.target.value.length;
  }

  clearChars() {
    this.biographyTarget.value = ''
    // fires biographyCountValueChanged event
    this.biographyCountValue = 0
  }

  // ************** EVENT *************
  biographyCountValueChanged() {
    this.showCharsCount()
  }

  // ***************COMMON ********************
  showCharsCount() {
    this.biographyCharsCountTarget.textContent = `${this.biographyCountValue}/200`
  }
}
