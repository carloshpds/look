


# =============================================
# Module
# =============================================
angular.module 'ngLook'

  # =============================================
  # httpProvider Config
  # =============================================
  .config( ['$httpProvider', ($httpProvider) ->

    # Customize $httpProvider
    # =============================================
    $httpProvider.defaults.transformRequest  = (data) -> if data then $.param(data, yes) else data
    $httpProvider.defaults.headers.post = "Content-type": "application/x-www-form-urlencoded"
    $httpProvider.defaults.headers.put  = "Content-type": "application/x-www-form-urlencoded"
    $httpProvider.defaults.headers.delete  = "Content-type": "application/x-www-form-urlencoded"

  ])