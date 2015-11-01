
angular.module "ngLook.controllers"
  .controller "SideNavCtrl", ($rootScope, $scope, $state, $modal, hAlert, $translatePartialLoader, $translate, $timeout) ->
    ###
    ## Init
    ###
    $translatePartialLoader.addPart('components/sidenav')
    $scope.attrs =
      features : []


    $timeout ->
      $scope.attrs.features = [
        { name: 'GENERAL.HOME', route: 'home', icon: '' }
      ]


