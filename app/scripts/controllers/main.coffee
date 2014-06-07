'use strict'

angular.module('tweetAnalyzerApp')
  .controller 'MainCtrl', [
    '$scope'
    '$timeout'
    'Analyzer'
    ($scope, $timeout, Analyzer) ->

      $scope.model = {}

      $scope.model.sources = [
        ##{
        ##  title: '@dnevnikhr'
        ##  howMany: 20
        ##ß}
      ]

      $scope.model.analyzeAlgorithms = [
        {
          'title': 'SVM'
          'value': 0
        }
        {
          'title': 'Na¨ıve Bayes'
          'value': 1
        }
        {
          'title': 'k-NN'
          'value': 2
        }
      ]
      $scope.model.analyzeAlgorithm = $scope.model.analyzeAlgorithms[1].value

      $scope.model.classes = {
        0: 'Sport NEWS'
        1: 'NEWS'
        2: 'Private message'
        3: 'Opinion'
        4: 'Music'
      }



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
      $scope.RemoveSource = (source) ->
        $scope.model.sources = $scope.model.sources.filter (s) -> s isnt source
        $scope.CheckValidation()


      $scope.analyzeInProgress = null
      $scope.StartAnalyze = () ->
        if $scope.isValid


          Analyzer.execute($scope.model.sources
          , (response) ->
            $scope.model.tweets = response.data
            $scope.RefreshGraph()
          )


          # TODO call backend
          $scope.analyzeInProgress = true

          $timeout () ->
            $scope.analyzeInProgress = false
          , 1000

        # after get result $scope.analyzeInProgress = false

      $scope.ResetAnalyze = () ->
        $scope.analyzeInProgress = null
        $scope.model.sources = []
        $scope.model.tweets = []
        $scope.RefreshGraph()
        $scope.CheckValidation()

      $scope.model.tweets = [
        ##{
        ##  tweet_id: 1
        ##  tweet_text: 'Ovo je tweet sa bla bla bla 123'
        ##  class_id: [1,1,2]
        ##}
      ]

      $scope.RefreshGraph = () ->
        $scope.model.classesValues = {
          0: 0
          1: 0
          2: 0
          3: 0
          4: 0
        }
        for t in $scope.model.tweets
          $scope.model.classesValues[t.class_id[$scope.model.analyzeAlgorithm]]++


        $scope.chartConfig.series = [
          {
            name: $scope.model.classes[0]
            data: [$scope.model.classesValues[0]]
          }
          {
            name: $scope.model.classes[1]
            data: [$scope.model.classesValues[1]]
          }
          {
            name: $scope.model.classes[2]
            data: [$scope.model.classesValues[2]]
          }
          {
            name: $scope.model.classes[3]
            data: [$scope.model.classesValues[3]]
          }
          {
            name: $scope.model.classes[4]
            data: [$scope.model.classesValues[4]]
          }
        ]



      $scope.model.classesValues = {
        0: 0
        1: 0
        2: 0
        3: 0
        4: 0
      }




      # Highchart CONFIG
      $scope.chartConfig =
        options:
          chart:
            type: "column"

        series: [
          {
            name: $scope.model.classes[0]
            data: [$scope.model.classesValues[0]]
          }
          {
            name: $scope.model.classes[1]
            data: [$scope.model.classesValues[1]]
          }
          {
            name: $scope.model.classes[2]
            data: [$scope.model.classesValues[2]]
          }
          {
            name: $scope.model.classes[3]
            data: [$scope.model.classesValues[3]]
          }
          {
            name: $scope.model.classes[4]
            data: [$scope.model.classesValues[4]]
          }
        ]
        title:
          text: ""


        xAxis:
          categories: [
            'Tweet Class'
          ]

        loading: false
















  ]
