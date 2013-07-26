#---------------------
#    :: Messages
#	-> model
#---------------------
module.exports =
	adapter: 'mongo'
	attributes:
		userId: "INT"
		username: "STRING"
		roomId: "INT"
		message: "STRING"