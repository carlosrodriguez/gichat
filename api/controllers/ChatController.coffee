#---------------------
#    :: Chat 
#	-> controller
#---------------------
ChatController = 
	index: (req, res) ->
		req.session.roomId = if (typeof (req.param("id") isnt "undefined")) then req.param("id") else ""
		console.log 'Room Id: ', req.session.roomId
		res.view chat: 'index'

module.exports = ChatController