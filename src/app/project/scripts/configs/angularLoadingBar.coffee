'use strict'

###
## [MODULE] LoadingBar
___

**App Config**
###
angular.module 'ngLook.configs'
  .config [ 'cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.includeSpinner = yes
    cfpLoadingBarProvider.latencyThreshold = 250
  ]
