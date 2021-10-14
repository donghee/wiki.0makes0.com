module.exports = {
  purge: {
    enabled: true,
    content: ['./theme/*.hbs', './templates/*.mustache','./*.md', './chapters/*.md', './wiki/*.html', './book/*.html'],
  },
  theme: {
    fontFamily: {
      spoqa: ["Spoqa Han Sans", 'sans-serif']
    },
    extend: {},
  },
  variants: {},
  plugins: [],
  corePlugins: {
     preflight: false,
  }
}
