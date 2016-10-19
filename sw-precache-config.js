module.exports = {
  staticFileGlobs: [
    '/index.html',
    '/manifest.json',
    '/bower_components/webcomponentsjs/webcomponents-lite.min.js'
  ],
  templateFilePath: 'service-worker.tmpl',
  navigateFallback: '/',
  navigateFallbackWhitelist: [/^(?!\/__)/],
  stripPrefixMulti: {
    'bower_components': '/bower_components',
    'bower_components/': '/bower_components/',
    'src/bower_components/': '/bower_components/',
    '/src/bower_components/': '/bower_components/',
    '../src/bower_components/': '/bower_components/',
    '../bower_components/': '/bower_components/'
  }
};
