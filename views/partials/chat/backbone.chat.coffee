# ## backbone.chat.coffee
# File name:   backbone.chat.coffee
# Description: Backbone views/collection for the chat
# Version:     1.0

# Model
MessageModel = Backbone.Model.extend(urlRoot: '/messages')

# Collection
MessageCollection = Backbone.Collection.extend
    url: '/messages'
    model: MessageModel

messages = new MessageCollection
messages.fetch()

# View
_.templateSettings = interpolate: /\{\{(.+?)\}\}/g
MessagesView = Backbone.View.extend(
    el: '#chatWindow'
    initialize: ->
        @collection.on 'add', @render, this
        @render()

    template: _.template '<div><p>{{ message }}</p></div>'
    render: ->
        @$el.html ''
        @collection.each ((msg) ->
            @$el.append @template msg.toJSON()
        ), this
)
mView = new MessagesView(collection: messages)