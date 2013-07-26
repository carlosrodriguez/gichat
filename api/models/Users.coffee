#---------------------
#    :: Users
#	-> model
#---------------------
module.exports =
    adapter: 'mongo'
    attributes:
        provider: 'STRING'
        uid: 'INTEGER'
        name: 'STRING'