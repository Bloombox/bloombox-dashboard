module.exports = {
  staticFileGlobs: [
    '/manifest.json',
    '/components/webcomponentsjs/webcomponents-lite.min.js'
  ],
  handleFetch: true,
  skipWaiting: true,
  templateFilePath: 'service-worker.tmpl',
  directoryIndex: false,
  navigateFallback: '/',
  navigateFallbackWhitelist: [/^(?!\/__)/],
  stripPrefixMulti: {
    'bower_components': '/components',
    'bower_components/': '/components/',
    'src/bower_components/': '/components/',
    '/src/bower_components/': '/components/',
    '../src/bower_components/': '/components/',
    '../bower_components/': '/components/',
    'components': '/components',
    'components/': '/components/',
    'src/components/': '/components/',
    '/src/components/': '/components/',
    '../src/components/': '/components/',
    '../components/': '/components/'
  }
};
