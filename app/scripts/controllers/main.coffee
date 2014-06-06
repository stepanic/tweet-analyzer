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


      $scope.analyzeInProgress = null
      $scope.StartAnalyze = () ->
        # TODO call backend
        $scope.analyzeInProgress = true

        # after get result $scope.analyzeInProgress = false


      $scope.model.classes = {
        0: 'Sport NEWS'
        1: 'NEWS'
        2: 'Private message'
        3: 'Opinion'
        4: 'Music'
      }



      $scope.model.tweets = null
      ###
      $scope.model.tweets = [
        {
          id: 1
          text: 'Ovo je tweet sa bla bla bla 123'
          class_id: 1
        }
        {
          id: 2
          text: 'Ovo je tweet sa bla bla bla 2323123'
          class_id: 2
        }
        {
          id: 3
          text: 'Ovo je tweet sa bla bla bla 343435 2323123'
          class_id: 2
        }
        {
          id: 4
          text: 'Ovo je tweet sa bla bla bla 56565 343435 2323123'
          class_id: 0
        }

      ]
      ###



  ]
