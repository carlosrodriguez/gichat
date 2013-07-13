# ## chat.Js
# File name:   chat.js
# Description: jQuery client methods for the chat functionality
# Version:     1.0


class Chat
	el: undefined
	submit: undefined
	init: (element) ->
		el = element
		el.on 'submit', @sendMessage

	sendMessage: (evt) ->
		evt.preventDefault()

		messageText = $('#message').val()
		messages.create
			message: messageText
		,
			wait: true

		$('#message').val ''


jQuery(document).ready ($) ->
	el = $(".chat-form")
	if el.length > 0
		chat = new Chat()
		chat.init el