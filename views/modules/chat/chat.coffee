# ## chat.Js
# File name:   chat.js
# Description: jQuery client methods for the chat functionality
# Version:     1.0


class Chat
	el: undefined
	submit: undefined
	params: url.params()

	init: (element) ->
		el = element
		el.on 'submit', @sendMessage
		console.log @params

	sendMessage: (evt) ->
		evt.preventDefault()

		_self = @

		params = url.params()

		messageText = $('#message').val()
		messages.create
			room: if (typeof (params.room) isnt 'undefined') then params.room else 0
			message: messageText
		,
			wait: true

		$('#message').val ''


jQuery(document).ready ($) ->
	el = $(".chat-form")
	if el.length > 0
		chat = new Chat
		chat.init el