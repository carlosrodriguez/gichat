#---------------------
#    :: Chat 
#	-> controller
#---------------------
ChatController = 
	index: (req, res) ->
		req.session.roomId = if (typeof (req.param("id") isnt "undefined")) then req.param("id") else ""
		console.log 'Room Id: ', req.session.roomId
		console.log req.session.passport
		console.log req.user[0]
		res.view 
			chat: 'index'
			user: req.user[0]

module.exports = ChatController