# Bloombox Dashboard  [![Build Status](https://buildbot.hq.mm-corp.systems/jenkins/buildStatus/icon?job=Bloombox/Dashboard)](https://buildbot.hq.mm-corp.systems/jenkins/job/Bloombox/Dashboard)

[![Code Climate](https://codeclimate.com/repos/589fa5560d110112e6000001/badges/ca2ebf423c39fe91f120/gpa.svg)](https://codeclimate.com/repos/589fa5560d110112e6000001/feed) [![Issue Count](https://codeclimate.com/repos/589fa5560d110112e6000001/badges/ca2ebf423c39fe91f120/issue_count.svg)](https://codeclimate.com/repos/589fa5560d110112e6000001/feed)

Further docs coming soon.

### Setup

##### Prerequisites

Install [polymer-cli](https://github.com/Polymer/polymer-cli):

    npm install -g polymer-cli

##### Initialize project from template

    mkdir my-app
    cd my-app
    polymer init app-drawer-template

### Start the development server

This command serves the app at `http://localhost:8080` and provides basic URL
routing for the app:

    polymer serve


### Build

This command performs HTML, CSS, and JS minification on the application
dependencies, and generates a service-worker.js file with code to pre-cache the
dependencies based on the entrypoint and fragments specified in `polymer.json`.
The minified files are output to the `build/unbundled` folder, and are suitable
for serving from a HTTP/2+Push compatible server.

In addition the command also creates a fallback `build/bundled` folder,
generated using fragment bundling, suitable for serving from non
H2/push-compatible servers or to clients that do not support H2/Push.

    polymer build

### Test the build

This command serves the minified version of the app in an unbundled state, as it would
be served by a push-compatible server:

    polymer serve build/unbundled

This command serves the minified version of the app generated using fragment bundling:

    polymer serve build/bundled

### Extend

You can extend the app by adding more elements that will be demand-loaded
e.g. based on the route, or to progressively render non-critical sections
of the application.  Each new demand-loaded fragment should be added to the
list of `fragments` in the included `polymer.json` file.  This will ensure
those components and their dependencies are added to the list of pre-cached
components (and will have bundles created in the fallback `bundled` build).
