def post_login_body
    payload = {
        "email": "fulano@qa.com",
        "password": "teste"
    }
    payload.to_json
end