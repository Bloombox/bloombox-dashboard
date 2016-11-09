module.exports = {
  staticFileGlobs: [
    '/manifest.json'
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
