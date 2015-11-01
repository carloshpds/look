'use strict';

var gulp   = require('gulp');
var gutil  = require('gulp-util');
var wrench = require('wrench');

/*
  ==========================
  Basic Options
  ==========================
*/
var options = {
  mainAngularModule : 'ngLook'
};


/*
  ==========================
  Base build
  ==========================
*/

options.modulesData = {
  build: {},
  server : {
    routes : {
      '/bower_components': 'bower_components'
    }
  },
  proxy: {
    target: 'http://docker:49000',
    isEnabled: false
  }
}

/*
  ==========================
  Read gulp files
  ==========================
*/
require('basebuild-angular')(options);


/*
  ==========================
  Default Task
  ==========================
*/
gulp.task('default', ['clean'], function () {
    gulp.start('build');
});
