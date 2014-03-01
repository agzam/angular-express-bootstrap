path = require "path"

module.exports = (grunt)->
   grunt.initConfig
      coffee:
         server:
            options: bare: true
            expand: true
            cwd: '.'
            src: ['src/server.coffee']
            dest:''
            ext: '.js'
         app:
            options: bare: true
            expand: true
            cwd: '.'
            src: ['src/coffee/**/*.coffee']
            dest:'src/js'
            ext: '.js'
            rename:(destBase, destPath, options)->
               destPath = destPath.replace /src\/coffee\//, ""
               console.log destPath
               path.join destBase, destPath

      copy:
         server:
            src: ['src/server.js']
            dest: 'bin/server.js'
         all:
            expand: true
            cwd: 'src/'
            src: ['**/*.html', '**/*.css']
            dest: 'bin/'

      browserify:
         js:
            src: 'src/js/app.js'
            dest: 'bin/js/app.js'

      watch:
         files:['src/**/*.coffee', 'src/**/*.html','src/**/*.css']
         tasks:['compile']


   grunt.loadNpmTasks 'grunt-contrib-watch'
   grunt.loadNpmTasks 'grunt-contrib-coffee'
   grunt.loadNpmTasks 'grunt-browserify'
   grunt.loadNpmTasks 'grunt-contrib-copy'

   grunt.registerTask 'server', "starts local node server", ->
      grunt.task.run('compile')
      spawnOptions =
         cmd:'node'
         args:['bin/server.js']
      grunt.util.spawn spawnOptions
      grunt.task.run('watch')

   grunt.registerTask 'compile', ['coffee','browserify', 'copy']
   grunt.registerTask 'default', ['compile']

