def post_usuarios_schema
    payload = {
      "type": "object",
      "properties": {
        "message": {
          "type": "string"
        },
        "_id": {
          "type": "string"
        }
      },
      "required": [
        "message",
        "_id"
      ]
    }
    payload.to_json
end

def put_usuarios_schema
  payload = {
    "type": "object",
    "properties": {
      "message": {
        "type": "string"
      }
    },
    "required": [
      "message"
    ]
  }
  payload.to_json
end
