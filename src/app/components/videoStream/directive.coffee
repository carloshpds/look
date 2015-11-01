

# =============================================
# Module
# =============================================
angular.module "ngLook.directives"
  .directive 'lkVideoStream', () ->
    restrict: 'A'
    replace : yes
    scope:
      stream   : "="
      imageUrl : "=?"
    controller: 'lkVideoStreamController'
    template  : """
      <div class="text-center">
        <canvas id="canvasPicture" ng-show="false"></canvas>
        <video class="videoStream">Vídeo não está disponível</video>
      </div>
    """