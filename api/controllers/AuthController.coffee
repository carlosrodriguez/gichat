#---------------------
#    :: Auth 
#	-> controller
#---------------------
passport = require 'passport'

AuthController =
	index: (req, res) ->
		res.view()

	logout: (req, res) ->
		req.logout()
		res.redirect '/'

	github: (req, res) ->
		passport.authenticate('github',  
			scope: 'repo'
			failureRedirect: '/login'
		, (err, user) ->
			req.logIn user, (err) ->
				if err
					res.view()
					return
				res.redirect '/'
				return

		) req, res

	callback: (req, res) ->
		_res = res
		passport.authenticate('github', (req, res) ->
			_res.redirect '/'
		) req, res

module.exports = AuthController