module.exports.routes =
	"/":
		controller: "chat"
		action: "index"

	"/room/:id":
		controller: "chat"
		action: "index"

	"post /messages":
		controller: "messages"
		action: "create"

	"/messages":
		controller: "messages"
		action: "index"