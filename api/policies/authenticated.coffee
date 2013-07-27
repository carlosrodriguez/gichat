###
Allow any authenticated user.
###
module.exports = (req, res, ok) ->

	# User is allowed, proceed to controller
	if typeof req.session.passport.user isnt 'undefined'
		ok()

	# User is not allowed
	else
		res.redirect '/login'