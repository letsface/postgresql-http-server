module.exports = (server) ->
    log = server.log
    db = server.db
    app = server.app

    log.debug "Setting up functions resource"

    app.get '/db/:databaseName/schemas/:schemaName/functions', (req, res) ->
        sql = "SELECT routines.routine_name, parameters.data_type, parameters.ordinal_position
          FROM information_schema.routines JOIN information_schema.parameters
          ON routines.specific_name=parameters.specific_name
          WHERE routines.specific_schema=$1
          ORDER BY routines.routine_name, parameters.ordinal_position"
        db.query
            sql: sql
            res: res
            values: [req.params.schemaName]
            database: req.params.databaseName
            callback: (result) ->
                res.send
                    type: 'functions'
                    children: (row.routine_name for row in result.rows)
