module.exports.routes =
	"/":
		controller: "chat"
		action: "index"

	"/signup":
		controller: "main"
		action: "signup"

	"/login":
		controller: "main"
		action: "login"

	"/chat":
		controller: "chat"
		action: "index"