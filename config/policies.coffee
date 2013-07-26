module.exports.policies =
  
	# Default policy for all controllers and actions
	# (`true` allows public access) 
	"*": "authenticated"
	
	auth:
		"*": true