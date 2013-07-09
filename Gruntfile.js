/*!
* File name:   Gruntfile.js
* Description: Build file for the plugin
* Version:     1.0
*/

module.exports = function (grunt) {

	// Project configuration.
	grunt.initConfig({

		pkg: grunt.file.readJSON('package.json'),

		files: {
			source: '.',
			compressed: 'assets',
			scss: [
				'<%= files.source %>/ui/**/*.scss',
				'<%= files.source %>/views/**/*.scss'
			],
			css: [
				"<%= files.source %>/ui/basic/**/*.css",
				"<%= files.source %>/ui/ui-class/**/*.css",
				"<%= files.source %>/views/**/*.css"
			],
			coffee: [
				"<%= files.source %>/ui/basic/**/*.coffee",
				"<%= files.source %>/ui/ui-class/**/*.coffee",
				"<%= files.source %>/views/**/*.coffee"
			]
		},

		compass: {
			build: {
				options: {
					config: 'config.rb'
				}
			}
		},

		concat: {
			coffee: {
				options: {
					stripBanners: true
				},
				src: '<%= files.coffee %>',
				dest: 'assets/js/all.coffee'
			},
			css: {
				options: {
					stripBanners: true,
					banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
					'<%= grunt.template.today("yyyy-mm-dd") %> */'
				},
				src: '<%= files.css %>',
				dest: '<%= files.compressed %>/styles/all.css'
			}
		},

		jshint: {
			options: {
				"curly": true,
				"eqnull": true,
				"eqeqeq": true,
				"undef": false,
				"globals": {
					"jQuery": true
				}
			},
			files: {
				src: [
					'<%= files.js %>'
				]
			}
		},

		watch: {
			scss: {
				files: [
					'<%= files.scss %>'
				],
				tasks: 'scss'
			},
			coffee: {
				files: [
					'<%= files.coffee %>'
				],
				tasks: 'concat:coffee'
			}
		}, 

		sails: {}
	});

	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-jshint');


	// Tasks
	grunt.registerTask(		// Only SCSS
		'scss',
		[
			'compass:build',
			'concat:css'
		]
	);

	grunt.registerTask('default', ['scss','concat:coffee', 'watch']);


	grunt.registerTask('sails', 'Start a sails app with forever', function() {

	    var args = ['-w', 'app.js'];
	    var options = this.options();

	    // Use options for specifying Sails server environment
	    if (options.development) args.push('--dev');
	    if (options.production) args.push('--prod');

	    grunt.log.writeln('Starting sails server');

	    // Start server and restart when files change

	    grunt.util.spawn({
	      cmd: './node_modules/grunt-sails/node_modules/forever/bin/forever',
	      args: args,
	      opts: {
	        stdio: 'inherit'
	      }
	    }, function (error, result) {
	      if (error) {
	        grunt.fail.fatal(result.stdout);
	      }
	      grunt.log.writeln(result.stdout);
	      done();
	    });
	  });
	
};