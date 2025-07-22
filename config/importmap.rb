# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "chart_render", to: "chart_render.js"
pin "add_choice", to: "add_choice.js"
pin_all_from "app/javascript/controllers", under: "controllers"
