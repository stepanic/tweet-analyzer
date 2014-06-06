'use strict'

angular.module('tweetAnalyzerApp')
  .controller 'MainCtrl', [
    '$scope'
    ($scope) ->

      $scope.model = {}

      $scope.model.sources = [
        {
          title: '@dnevnikhr'
          howMany: 20
        }
        {
          title: '#music'
          howMany: 13
        }
        {
          title: '#ladygaga'
          howMany: 15
        }
      ]

      $scope.isValid = true
      $scope.CheckValidation = () ->
        for source in $scope.model.sources
          if not source.howMany? or not source.title?
            return $scope.isValid = false
        $scope.isValid = true


      $scope.AddNewSource = () ->
        $scope.model.sources.push
            title: null
            howMany: null


  ]
