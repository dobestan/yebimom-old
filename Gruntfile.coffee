module.exports = (grunt) ->
    grunt.initConfig
        bowercopy:
            options:
                # Bower components folder will be removed afterwards
                clean: true
            libs:
                options:
                    destPrefix: 'components/bower_components'
                files:
                    'js/jquery.min.js': 'jquery/dist/jquery.min.js'
                    'js/jquery.min.map': 'jquery/dist/jquery.min.map'

                    'js/bootstrap.min.js': 'bootstrap/dist/js/bootstrap.min.js'
                    'css/bootstrap.min.css': 'bootstrap/dist/css/bootstrap.min.css'

                    'js/underscore.min.js': 'underscore/underscore-min.js'
                    'js/underscore-min.map': 'underscore/underscore-min.map'

                    'css/font-awesome.min.css': 'components-font-awesome/css/font-awesome.min.css'
                    'fonts/': 'components-font-awesome/fonts/'

        sass:
            dist:
                files:
                    'yebimom/static/css/yebimom.css': 'yebimom/static/css/yebimom.sass'

        jshint:
            files: ['yebimom/**/*.js']

        shell:
            pep8:
                command: 'pep8'

            testing:
                command: 'NOSE_NOCAPTURE=1 python manage.py test -v2 --color --noinput'

        watch:
            sass:
                files: '**/*.sass'
                tasks: 'sass'

            jshint:
                files: '<%= jshint.files %>'
                tasks: 'jshint'

            pep8:
                files: '**/*.py'
                tasks: ['shell:pep8', 'shell:testing']


    grunt.loadNpmTasks 'grunt-bowercopy'
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-shell'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-notify'

    grunt.registerTask 'default', [
        'bowercopy'
        'sass'
        'jshint'
        'watch'
    ]
