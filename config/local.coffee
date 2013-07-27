
module.exports =
  
	# In production, you'll probably want to change this setting 
	# to 80 (http://) or 443 (https://) if you have an SSL certificate
	port: process.env.PORT or 1337

	# By default, Sails sets its environment using the `NODE_ENV` environment variable.
	# If NODE_ENV is not set, Sails will run in the 'development' environment.
	environment: process.env.NODE_ENV or 'development'