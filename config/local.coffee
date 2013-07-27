
passport = require 'passport'
GitHubStrategy = require('passport-github').Strategy

verifyHandler = (token, tokenSecret, profile, done) ->
	process.nextTick ->
		Users.find
			uid: profile.id
		, (err, user) ->
			if user.length
				console.log 'failed it think there is a user'
				# req.session.passport.user = user
				console.log done
				done null, user
			else
				Users.create(
					provider: profile.provider
					uid: profile.id
					name: profile.displayName
				).done (err, user) ->
					if err
						throw err
					# req.session.passport.user = user
					done null, user


passport.serializeUser (user, done) ->
	console.log 'serialize'
	done null, user.uid

passport.deserializeUser (uid, done) ->
	console.log 'deserialize'
	User.find
		uid: uid
	, (err, user) ->
		done err, user

module.exports =
  
	# In production, you'll probably want to change this setting 
	# to 80 (http://) or 443 (https://) if you have an SSL certificate
	port: process.env.PORT or 1337

	# By default, Sails sets its environment using the `NODE_ENV` environment variable.
	# If NODE_ENV is not set, Sails will run in the 'development' environment.
	environment: process.env.NODE_ENV or 'development'
	github:
		clientID: '4efde5e70493fc987424'
		clientSecret: 'e81d6169c9d102c21c5ab616b8c822dddc4499aa'
		callbackURL: 'http://localhost:1337/auth/callback'

	express:
		customMiddleware: (app) ->
			passport.use new GitHubStrategy(
				clientID: module.exports.github.clientID
				clientSecret: module.exports.github.clientSecret
				callbackURL: module.exports.github.callbackURL
			, verifyHandler)
			
			app.use passport.initialize()
			app.use passport.session
				secret: 'ee7986c30dbd5f62aa9a1e69a3c9429a'