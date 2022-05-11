import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="application"
export default class ApplicationController extends Controller {
	static targets = ['theme']

	connect() {
		var theme = sessionStorage.getItem('theme')
		if (theme !== null) {
			if (theme === 'dark') {
				this.makeDarkTheme()
			}
		}
	}

	redirectBack(_event) {
		history.back()
	}

	toggleTheme(event) {
		if (event.target.checked) {
			this.makeDarkTheme()
		} else {
			this.makeLightTheme()
		}
	}

	makeDarkTheme() {
		document.documentElement.classList.add('dark')
		sessionStorage.setItem('theme', 'dark')
		this.themeTarget.checked = true
	}

	makeLightTheme() {
		document.documentElement.classList.remove('dark')
		sessionStorage.removeItem('theme')
		this.themeTarget.checked = false
	}
}
