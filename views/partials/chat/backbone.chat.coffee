# ## backbone.chat.coffee
# File name:   backbone.chat.coffee
# Description: Backbone views/collection for the chat
# Version:     1.0

# Model
MessageModel = Backbone.Model.extend(urlRoot: '/messages')

SailsCollection = Backbone.Collection.extend(
    sailsCollection: ""
    socket: null
    sync: (method, model, options) ->
        where = {}
        where = where: options.where  if options.where
        if typeof @sailsCollection is "string" and @sailsCollection isnt ""
            @socket = io.connect()
            @socket.on "connect", _.bind(->
                @socket.request "/" + @sailsCollection, where, _.bind((users) ->
                    @set users
                , this)
                @socket.on "message", _.bind((msg) ->
                    m = msg.uri.split("/").pop()
                    if m is "create"
                        @add msg.data
                    else if m is "update"
                        @get(msg.data.id).set msg.data
                    else @remove @get(msg.data.id)  if m is "destroy"
                , this)
            , this)
        else
            console.log "Error: Cannot retrieve models because property 'sailsCollection' not set on the collection"
)

# Collection
MessageCollection = SailsCollection.extend
    sailsCollection: 'messages'
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