#---------------------
#    :: Messages 
#	-> controller
#---------------------
MessagesController = 
	create: (req, res) ->
		# Setting a hardcoded user and room id for initial testing
		entry =
			roomId: '1'
			userId: '1'
			message: req.param 'message'

		Messages.create(entry).done (err, entry) ->
			
			# Error handling
			if err
				console.log err
  
			# The User was created successfully!
			else
				console.log "User created:", entry
				res.json entry

module.exports = MessagesController