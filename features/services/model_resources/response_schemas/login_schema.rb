def post_login_schema
    payload = {
        "type": "object",
        "properties": {
            "message": {
            "type": "string"
            },
            "authorization": {
            "type": "string"
            }
        },
        "required": [
            "message",
            "authorization"
            ]
        } 
    payload.to_json
end