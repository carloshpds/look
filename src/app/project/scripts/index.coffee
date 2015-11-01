angular.module "ngLook.vendors", [
  "ngTouch"
  "ngSanitize"
  "ngResource"
  "ui.router"
  "ui.bootstrap"
  "ui.select"
  "oitozero.ngSweetAlert"
  "ngToast"
  "angular-loading-bar"
  "pascalprecht.translate"
]

# =============================================
# Modules
# =============================================
angular.module "ngLook.controllers" , ["ngLook.vendors"]
angular.module "ngLook.filters"     , ["ngLook.vendors"]
angular.module "ngLook.factories"   , ["ngLook.vendors"]
angular.module "ngLook.constants"   , ["ngLook.vendors"]
angular.module "ngLook.services"    , ["ngLook.vendors"]
angular.module "ngLook.directives"  , ["ngLook.vendors"]
angular.module "ngLook.mocks"       , ["ngLook.vendors"]
angular.module "ngLook.i18n"        , ["ngLook.vendors"]
angular.module "ngLook.configs"     , ["ngLook.vendors"]
angular.module "ngLook.providers"   , ["ngLook.vendors"]



# =============================================
# Scripts Module
# =============================================
angular.module "ngLook.scripts"     , [
  "ngLook.controllers"
  "ngLook.constants"
  "ngLook.filters"
  "ngLook.factories"
  "ngLook.services"
  "ngLook.directives"
  "ngLook.mocks"
  "ngLook.i18n"
  "ngLook.providers"
  "ngLook.configs"
]


# =============================================
# Main Module
# =============================================
angular.module "ngLook", [
  "ngLook.scripts"
  "ngLook.vendors"
]