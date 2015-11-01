
# =============================================
  # haVideoStreamController
  # =============================================
angular.module "ngLook.controllers"
  .controller 'lkVideoStreamController', ($scope, $element) ->

    # =============================================
    # Options
    # =============================================
    $scope.options =
      videoHeight     : 600
      videoWidth      : 800

    videoElement  = $element.find('.videoStream')[0]
    canvasElement = $element.find('#canvasPicture')[0]
    context       = canvasElement.getContext('2d')

    # =============================================
    # Methods
    # =============================================
    $scope.actions =

      takePicture: ($event)->

        width  = $scope.options.videoWidth
        height = $scope.options.videoHeight

        if width? and height?
          canvasElement.width  = width
          canvasElement.height = height
          context.drawImage(videoElement, 0, 0, width, height)

          $scope.imageUrl = canvasElement.toDataURL('image/png')

        $event.preventDefault()


      onCanPlay: (ev) ->
        unless streaming
          height = videoElement.videoHeight / (videoElement.videoWidth/$scope.options.videoWidth)

          # Firefox currently has a bug where the height can't be read from
          # the video, so we will make assumptions if this happens.
          if isNaN(height) then height = $scope.options.videoWidth / (4/3)


          videoElement.setAttribute('width', $scope.options.videoWidth)
          videoElement.setAttribute('height', height)
          canvasElement.setAttribute('width', $scope.options.videoWidth)
          canvasElement.setAttribute('height', height)

          streaming = yes
          # $scope.actions.track()

      track: ->
        tracker = new tracking.ObjectTracker('face')

        tracker.setInitialScale(4)
        tracker.setStepSize(2)
        tracker.setEdgesDensity(0.1)

        tracking.track('.videoStream', tracker, { camera: true })

        tracker.on 'track', (event) ->
          # context.clearRect(0, 0, canvasElement.width, canvasElement.height)

          event.data.forEach (rect) ->
            context.strokeStyle = '#a64ceb'
            context.strokeRect(rect.x, rect.y, rect.width, rect.height)
            context.font = '11px Helvetica'
            context.fillStyle = "#fff"
            context.fillText('x: ' + rect.x + 'px', rect.x + rect.width + 5, rect.y + 11)
            context.fillText('y: ' + rect.y + 'px', rect.x + rect.width + 5, rect.y + 22)




    # =============================================
    # Events
    # =============================================
    videoElement.addEventListener 'canplay', $scope.actions.onCanPlay, false

    # =============================================
    # Initialize
    # =============================================
    $scope.$watch 'stream', (newVal, oldVal) ->
      if newVal
        if navigator.mozGetUserMedia
          videoElement.mozSrcObject = $scope.stream
        else
          vendorURL        = window.URL or window.webkitURL
          videoElement.src = vendorURL.createObjectURL($scope.stream)

        videoElement.play()