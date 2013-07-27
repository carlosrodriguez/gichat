###
Allow any authenticated user.
###
module.exports = (req, res, ok) ->

	# User is allowed, proceed to controller
	console.log 'session'
	console.log req.session
	if typeof req.session.passport.user isnt 'undefined'
		console.log 'User exitsts and logged in'
		console.log req.session.passport.user
		ok()

	# User is not allowed
	else
		res.redirect '/login'