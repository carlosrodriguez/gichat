passport = require 'passport'
GitHubStrategy = require('passport-github').Strategy

module.exports =
	express:
		customMiddleware: (app) ->
			app.use passport.initialize()
			app.use passport.session
				secret: 'ee7986c30dbd5f62aa9a1e69a3c9429a'