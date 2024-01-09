Dado('API1_Usuarios_POST - cadastro um novo usuario - conforme a tabela') do |table|
  table = formatarRegexDaTabela(table.hashes[0])
  @usuarios_payload.create_post_usuarios_body(table)
  @request_body = @usuarios_payload.body

  @response = usuarios_request.post_usuarios(@request_body.to_json)
  log %{
    STATUS CODE: #{@response.code}
  }
  @response_parsed = @response.parsed_response  

  expect(@response.code).to eql(200)
  expect(@response_parsed["message"]).to be("Cadastro realizado com sucesso")
  expect(@response_parsed["_id"]).not_to be(nil)
  @response_usuarios_id = @response_parsed["_id"]

  log %{
    RESPONSE: #{@response_parsed}
  }
end

Dado('API1_Usuarios_GET - pesquiso o usuario pelo Id') do
  @response = usuarios_request.get_usuarios_by_id(@response_usuarios_id)
    log %{
      STATUS CODE: #{@response.code}
    }
    @response_parsed = @response.parsed_response  

    expect(@response.code).to eql(200)
    steps %{
      E Validar se o valor da chave "nome" não é igual a "null"
      E Validar se o valor da chave "email" não é igual a "null"
    }

    log %{
      RESPONSE: #{@response_parsed}
    }
end
 
E('API1_Usuarios - Validar se os dados correspondem a consulta - conforme a tabela') do |table|
  table = formatarRegexDaTabela(table.hashes[0])

  table.each do |chave, valor|
    if (valor == "null") 
      valor = nil 
    end

    case chave            
      when "nome"
        expect(@response_parsed["nome"]).to eql(valor)

      when "email"
        expect(@response_parsed["email"]).to eql(valor)
        
      when "password"
        expect(@response_parsed["password"]).to eql(valor)

      when "administrador"
          expect(@response_parsed["administrador"]).to eql(valor)
          
      else
        raise "Invalid Parameter!!! -> #{chave}"
    
    end
  end
end


Dado('API1_Usuarios_PUT - atualizo um novo usuario - conforme a tabela') do |table|
  byebug
  table = formatarRegexDaTabela(tabela.hashes[0])
  @usuarios_payload.create_put_usuarios_body(table)
  @request_body = @usuarios_payload.body

  @response = usuarios_request.put_usuarios(@request_body.to_json)
  log %{
    STATUS CODE: #{@response.code}
  }

  expect(@response.code).to eql(200)
  expect(@response["message"]).to be("Registro alterado com sucesso")

  sleep 1
  log %{
    RESPONSE: #{@response.parsed_response}
  }
end