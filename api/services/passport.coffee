passport = require 'passport'
GitHubStrategy = require('passport-github').Strategy

verifyHandler = (token, tokenSecret, profile, done) ->
	process.nextTick ->
		Users.find
			uid: profile.id
		, (err, user) ->
			if user.length
				done null, user
			else
				Users.create(
					provider: profile.provider
					uid: profile.id
					name: profile.displayName
				).done (err, user) ->
					if err
						throw err
					done null, user


passport.serializeUser (user, done) ->
	done null, user.uid

passport.deserializeUser (user, done) ->
	Users.find
		uid: user.uid
	, (err, user) ->
		done err, user

passport.use new GitHubStrategy(
	clientID: '4efde5e70493fc987424'
	clientSecret: 'e81d6169c9d102c21c5ab616b8c822dddc4499aa'
	callbackURL: 'http://localhost:1337/auth/callback'
, verifyHandler)