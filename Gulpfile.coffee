gulp = require 'gulp'
connect = require 'gulp-connect'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'
checkIf = require 'gulp-if'

its = (type) ->
    (file) =>
        return file.path.indexOf("." + type) > -1

gulp.task 'connectDev', ->
    connect.server
        root: [
            'test'
            'tmp'
            'node_modules/angular'
            'node_modules/resemblejs'
            'src'

        ]
        port: 8000
        livereload: true
    return

gulp.task 'connectDist', ->
    connect.server
        root: 'dist'
        port: 8001
        livereload: true
    return

gulp.task 'js', ->
    gulp
        .src('./src/**.{js,coffee}')
        .pipe checkIf its('coffee'), coffee bare: true
        .pipe concat 'app.js'
        .pipe gulp.dest './dist'
        .pipe connect.reload()
    return


gulp.task 'html', ->
    gulp.src('./src/*.html').pipe connect.reload()
    return

gulp.task 'watch', ->
    gulp.watch [ './src/*.html' ], [ 'html' ]
    gulp.watch [ './src/*.{js,coffee}' ], [ 'js' ]
    return

gulp.task 'default', [
    'connectDist'
    'connectDev'
    'watch'
]