'use strict'

taskName = 'Clean' # used with humans
safeTaskName = 'clean' # used with machines

del = require 'del'

{getConfig, gulp, API: {notify, typeCheck, debug}} = require 'pavios'
debug = debug 'task:' + taskName

config = getConfig safeTaskName

result = typeCheck.raw '{ directories: [String] }', config
debug 'Type check ' + (if result then 'passed' else 'failed')

unless result
  typeCheck.typeCheckErr taskName

gulp.task safeTaskName, (cb) ->
  unless result
    debug 'Exiting task early because config is invalid'
    return cb()

  debug 'Deleting these directories: ', config.directories.join ', '

  del.sync config.directories # doing sync because Gulp has problems with the callback being called "too many times"

  debug 'Finished deleting'
  notify.taskFinished taskName
  cb()

module.exports.order = 0
