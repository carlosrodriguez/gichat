#---------------------
#    :: Messages 
#	-> controller
#---------------------
MessagesController = 
	index: (req, res) ->
		query = roomId: req.session.roomId
		Messages.findAll(query).done (err, messages) ->
			return res.send(err, 500)  if err
			console.log 'send message'
			console.log messages
			res.json messages
			

	create: (req, res) ->
		# Setting a hardcoded user and room id for initial testing
		entry =
			roomId: req.session.roomId
			userId: '1'
			message: req.param 'message'

		Messages.create(entry).done (err, entry) ->
			
			# Error handling
			if err
				console.log err
  
			# The User was created successfully!
			else
				console.log "Message created: ", entry
				res.json entry

module.exports = MessagesController