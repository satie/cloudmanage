'use strict';

/**
 * @ngdoc overview
 * @name uiApp
 * @description
 * # uiApp
 *
 * Main module of the application.
 */
 angular
 .module('cloudmanageApp', [
  'ngAnimate',
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngTouch',
  'ui.router'
  ])
 .config(['$stateProvider', '$urlRouterProvider','$httpProvider', 
  function($stateProvider, $urlRouterProvider, $httpProvider){
    $urlRouterProvider.otherwise('/');
    $stateProvider
    .state('login', {
     url: '/login',
     templateUrl: 'views/login.html'
    })
    .state('vpc',{
      url: '/vpc',
      templateUrl: 'views/vpc.html'
    })
    .state('home',{
      url: '/',
      templateUrl: 'views/home.html'
    });
    $httpProvider.interceptors.push('serviceUrlInterceptor');
    $httpProvider.interceptors.push('accessDeniedInterceptor');
  }])
 .value('serviceUrl', '/service');
