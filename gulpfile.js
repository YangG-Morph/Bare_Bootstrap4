"use strict";

// Load plugins
const browsersync = require("browser-sync").create();
const del = require("del");
const gulp = require("gulp");
const merge = require("merge-stream");
const sass = require('gulp-sass');
const autoprefixer = require('gulp-autoprefixer');

// BrowserSync
function browserSync(done) {
  browsersync.init({
    server: {
      baseDir: "./"
    },
    port: 3000,browser: ["Chrome"]
  });
  done();
}

// BrowserSync reload
function browserSyncReload(done) {
  browsersync.reload();
  done();
}

// Clean vendor
function clean() {
  return del(["./vendor/"]);
}

// Bring third party dependencies from node_modules into vendor directory
function modules() {
  // Bootstrap
  var bootstrap = gulp.src('./node_modules/bootstrap/dist/**/*')
    .pipe(gulp.dest('./vendor/bootstrap'));

  // Prefixer
  var prefixer = gulp.src('./node_modules/bootstrap/scss/bootstrap.scss')
  .pipe(autoprefixer())
  .pipe(sass().on('error', sass.logError))
  .pipe(gulp.dest('./vendor/bootstrap/css'));
  // .pipe(browserSync.stream());

  // jQuery
  var jquery = gulp.src([
      './node_modules/jquery/dist/*',
      '!./node_modules/jquery/dist/core.js'
    ])
    .pipe(gulp.dest('./vendor/jquery'));
  return merge(bootstrap, jquery, prefixer);
}

// Watch files
function watchFiles() {
  // gulp.watch('./scss/**/*.scss', style);
  gulp.watch('./node_modules/bootstrap/scss/**/*.scss', modules);
  gulp.watch("./**/*.css", browserSyncReload);
  gulp.watch("./**/*.html", browserSyncReload);
}

// Define complex tasks
const vendor = gulp.series(clean, modules);
const build = gulp.series(vendor);
const watch = gulp.series(build, gulp.parallel(watchFiles, browserSync));

// Export tasks
exports.clean = clean;
exports.vendor = vendor;
exports.build = build;
exports.watch = watch;
exports.default = build;
