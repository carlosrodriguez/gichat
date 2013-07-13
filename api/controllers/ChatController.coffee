#---------------------
#    :: Chat 
#	-> controller
#---------------------
ChatController = 
	index: (req, res) ->
		console.log 'Room Id: ',req.param 'id'
		req.session.roomId = req.param 'id'
		res.view chat: 'index'
		# res.json

module.exports = ChatController