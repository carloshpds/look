
# =============================================
# Module
# =============================================
angular.module "ngLook.controllers"

  # =============================================
  # HomeController
  # =============================================
  .controller "HomeController", ($state, $rootScope, $scope, webcamService) ->

    $scope.attrs =
      videoStream: null


    $scope.actions =
      getWebcam: ->
        webcamService.get().then (videoStream)->
          $scope.attrs.videoStream = videoStream




