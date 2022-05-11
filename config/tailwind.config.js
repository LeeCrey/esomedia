const colors = require("tailwindcss/colors");
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  darkMode: "class",
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },

      colors: {
        dark: {
          // primary: "#192734",
          primary: "#171717",
          // onPrimary: "#15202b",
          onPrimary: "#202124",

          app: "#121212",
          // onApp: "#1e1e1e"
          onApp: "#252525",
          btn: "#303134"
        },

        btn: "#2E9FFF",
        following: "#5bb666",
        app: "#e6e6e6",
        tint: "#262626",
        link: "#2770cc",
        profile: "#262626",
      },
      height: {
        desktop: "450px",
        "90p": "90%",
      },
      width: {
        "80p": "80%",
        "side": "275px",
        "160px": "160px",

        desktop: "500px",
        "600px": "600px"
      },
      spacing: {
        desktop: "430px",
        104: '26rem'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
