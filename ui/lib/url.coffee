class @Url
	url: window.location
	parameters = undefined

	process: (params) ->
		keys = _.filter params, (num) ->
			(num + 2) % 2 isnt 0
		values = _.filter params, (num) ->
  			(num + 2) % 2 is 0

  		_.zipObject keys, values

	params: () ->
		params = @url.pathname.split('/')
		params.shift()
		@process params

