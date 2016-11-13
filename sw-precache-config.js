module.exports = {
  staticFileGlobs: [
    '/manifest.json'
  ],
  handleFetch: true,
  skipWaiting: true,
  templateFilePath: 'service-worker.tmpl',
  directoryIndex: false,
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
