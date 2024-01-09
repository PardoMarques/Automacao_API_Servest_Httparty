def post_usuarios_body
    payload = {
        "nome": "Fulano da Silva",
        "email": "beltrano@qa.com.br",
        "password": "teste",
        "administrador": "true"
    }
    payload.to_json
end

def put_usuarios_body
    payload = {
        "nome": "Fulano da Silva",
        "email": "beltrano@qa.com.br",
        "password": "teste",
        "administrador": "true"
    }
    payload.to_json
end