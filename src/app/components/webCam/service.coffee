angular.module 'ngLook.services'
  .service 'webcamService', ($stateParams, hAlert, $translate, $q)->

    navigator.getUserMedia = navigator.getUserMedia or
      navigator.webkitGetUserMedia or
      navigator.mozGetUserMedia

    service =
      defer : null
      videoStream: null

    alerts =
      info: ->
        hAlert.info {
          title            : $translate.instant('WEBCAMIMPORT.ALERT.TITLE')
          text             : $translate.instant('WEBCAMIMPORT.ALERT.TEXT')
          allowEscapeKey   : no
          showCancelButton : no
        }

      error: ->
        config =
          text: $translate.instant('WEBCAMIMPORT.ERROR.DEFAULT')

        hAlert.error(config, service.defer.resolve)



    webcamActions =
      getUserMedia: ->
        if !navigator.getUserMedia?
          return alerts.error()

        alerts.info()
        mediaConfig =
          audio: no
          video: yes

        navigator.getUserMedia(mediaConfig, webcamActions.openWebCam, webcamActions.rejectedCamera)


      openWebCam: (videoStream) ->
        hAlert.close()
        service.videoStream = videoStream
        return service.defer.resolve(videoStream)


      rejectedCamera : (data)->
        alerts.error()
        service.defer.reject(data)

      stop: (videoStream = service.videoStream) ->
        videoStream.active = no
        videoStream.getVideoTracks()[0]?.stop()

      get: () ->
        service.defer = $q.defer()

        if !navigator.getUserMedia?
          service.defer.reject()
        else
          getMedia = webcamActions.getUserMedia()

        return service.defer.promise

    return webcamActions