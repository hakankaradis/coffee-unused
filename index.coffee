fs            = require 'fs'
walk          = require 'walk'
analyzeCode   = require './find-unused-vars'
processResult = require './process-result'
async = require 'async'

module.exports = (folder, skipParseError) ->

  lookForFile = {}
  pathToWalk  = folder
  walker      = walk.walk pathToWalk, {}

  work = (path) ->
    code = fs.readFileSync path, 'utf8'
    varsAndPath = analyzeCode code, path, skipParseError
    processResult varsAndPath.stats, varsAndPath.path

  q = async.queue(((path, work) ->
    work(path)
  ), 5)


  walker.on "file", (root, fileStats, next) ->
    if root.indexOf('node_modules') is -1
      checkUsedFiles = {}
      if fileStats.name.endsWith '.coffee'
        openFile = "#{root}/#{fileStats.name}"
        q.push(openFile, work)

    next()

