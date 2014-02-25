path = require "path"

module.exports = (grunt)->
   grunt.initConfig
      coffee:
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

      copy: all:
         expand: true
         cwd: 'src/'
         src: ['**/*.html', '**/*.css']
         dest: 'bin/'

      browserify:
         js:
            src: 'src/js/app.js'
            dest: 'bin/js/app.js'

      watch:
         files:['src/coffee/**/*.coffee', 'src/**/*.html','src/**/*.css']
         tasks:['compile']


   grunt.loadNpmTasks 'grunt-contrib-watch'
   grunt.loadNpmTasks 'grunt-contrib-coffee'
   grunt.loadNpmTasks 'grunt-browserify'
   grunt.loadNpmTasks 'grunt-contrib-copy'

   grunt.registerTask 'compile', ['coffee','browserify', 'copy']
   grunt.registerTask 'default', ['coffee']
