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
			],
			libCoffee: [
				"<%= files.source %>/ui/lib/**/*.coffee"
			]
		},

		compass: {
			build: {
				options: {
					config: 'config.rb'
				}
			}
		},

		coffee: {
			compile: {
				options: {
					join: true
				},
				files: {
					'assets/js/all.js': ['<%= files.source %>/ui/basic/**/*.coffee', '<%= files.source %>/ui/ui-class/**/*.coffee', '<%= files.source %>/views/**/*.coffee']
				}
			},
			lib: {
				options: {
					join: true
				},
				files: {
					'assets/js/lib/lib.js': '<%= files.libCoffee %>'
				}
			}
		},

		concat: {
			// coffee: {
			// 	options: {
			// 		stripBanners: true
			// 	},
			// 	src: '<%= files.coffee %>',
			// 	dest: 'assets/js/all.coffee'
			// },
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
				tasks: 'coffee:compile'
			},
			libCoffee: {
				files: [
					'<%= files.libCoffee %>'
				],
				tasks: 'coffee:lib'
			}
		}
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

	grunt.registerTask('default', ['scss','coffee','watch']);

	
};