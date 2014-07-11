exports.parseTable = (req) ->
    "\"#{req.params.schemaName}\".\"#{req.params.tableName}\""
exports.parseFunc = (req) ->
    "\"#{req.params.schemaName}\".\"#{req.params.funcName}\""
