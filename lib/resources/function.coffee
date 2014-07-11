parseFunc = require('./utils').parseFunc

module.exports = (server) ->
    log = server.log
    db = server.db
    app = server.app

    log.debug "Setting up function resource"

    app.post '/db/:databaseName/schemas/:schemaName/functions/:funcName', (req, res) ->
        func = parseFunc req
        args = "'#{JSON.stringify req.body}'"
        sql = "SELECT #{func}(#{args})"
        console.log sql
        db.query
            sql: sql
            res: res
            values: []
            database: req.params.databaseName
            callback: (result) ->
                res.send result.rows
