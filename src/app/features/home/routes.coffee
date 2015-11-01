

# =============================================
# Main Module
# =============================================
angular.module 'ngLook'

  # =============================================
  # Config Twain
  # =============================================
  .config ($stateProvider, $urlRouterProvider) ->

    $stateProvider
      .state "home",
        url         : "/"
        templateUrl : "app/features/home/home.html"
        controller  : "HomeController"

    $urlRouterProvider.otherwise '/'