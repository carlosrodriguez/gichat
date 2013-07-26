module.exports.routes =
	'/':
		controller: 'chat'
		action: 'index'

	'/room/:id':
		controller: 'chat'
		action: 'index'

	'/login':
		controller: 'auth'
		action: 'index'

	'/logout':
		controller: 'auth'
		action: 'logout'