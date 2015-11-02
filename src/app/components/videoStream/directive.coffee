

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
        <canvas id="canvasPicture"></canvas>
        <video class="videoStream" preload autoplay loop muted>Vídeo não está disponível</video>
      </div>
    """