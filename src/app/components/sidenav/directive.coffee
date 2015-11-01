angular.module "ngLook.directives"
  .directive "sideNav", () ->
    restrict: "EA"
    scope: {}
    replace: true
    templateUrl: 'app/components/sidenav/template.html'
    controller: 'SideNavCtrl'