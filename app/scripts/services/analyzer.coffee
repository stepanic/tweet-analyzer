'use strict'

angular.module('tweetAnalyzerApp')
  .service 'Analyzer', [
    '$http'
    ($http) ->

      execute: (input, callback) ->
        # Parse source
        s = []
        hm = []
        for i in input
          s.push i.title
          hm.push i.howMany

        data =
          sources: s
          how_many: hm

        # Prepare for POST sending
        for key, d of data.sources
          data.sources[key] = "sources=#{d}"
        data.sources = data.sources.join '&'

        for key, d of data.how_many
          data.how_many[key] = "how_many=#{d}"
        data.how_many = data.how_many.join '&'


        $http.post("http://tweet-analyzer.herokuapp.com/analyzer/",
          "#{data.sources}&#{data.how_many}"
        ).success(callback).error (error) ->
          console.log error
          return
  ]

