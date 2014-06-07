'use strict'

describe 'Service: Analyzer', ->

  # load the service's module
  beforeEach module 'tweetAnalyzerApp'

  # instantiate service
  Analyzer = {}
  beforeEach inject (_Analyzer_) ->
    Analyzer = _Analyzer_

  it 'should do something', ->
    expect(!!Analyzer).toBe true
