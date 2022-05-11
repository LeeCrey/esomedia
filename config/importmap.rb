# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-clipboard" # @3.1.0
pin "stimulus-notification" # @2.0.0
pin "stimulus-read-more" # @3.0.0
pin "stimulus-remote-rails" # @4.0.0
pin "stimulus-scroll-to" # @4.0.0
pin "stimulus-timeago" # @4.0.0
pin "hotkeys-js" # @3.9.3
pin "stimulus-use" # @0.50.0
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.0.1
