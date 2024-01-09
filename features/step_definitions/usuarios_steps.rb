Dado('API1_Usuarios_POST - cadastro um novo usuario - conforme a tabela') do |table|
  table = formatarRegexDaTabela(table.hashes[0])
  @cadastro_tabela = table

  @usuarios_payload.create_post_usuarios_body()
  @usuarios_payload.edit_post_usuarios_body_by_table(table)
  @request_body = @usuarios_payload.body

  @response = usuarios_request.post_usuarios(@request_body.to_json)
  log %{
    STATUS CODE: #{@response.code}
  }
  @response_post_usuarios = @response.parsed_response  

  expect(@response.code).to eql(201)
  expect(@response_post_usuarios["message"]).to eql("Cadastro realizado com sucesso")
  expect(@response_post_usuarios["_id"]).not_to eql(nil)

  log %{
    RESPONSE: #{@response_post_usuarios}
  }
end


Dado('API1_Usuarios_GET - pesquiso o usuario pelo Id') do
  @response = usuarios_request.get_usuarios_by_id(@response_post_usuarios["_id"])
    log %{
      STATUS CODE: #{@response.code}
    }
    @response_get_usuarios_by_id = @response.parsed_response  

    expect(@response.code).to eql(200)
    steps %{
      E Validar se o valor da chave "nome" não é igual a "null"
      E Validar se o valor da chave "email" não é igual a "null"
    }

    log %{
      RESPONSE: #{@response_get_usuarios_by_id}
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
        expect(@response_get_usuarios_by_id["nome"]).to eql(valor)

      when "email"
        expect(@response_get_usuarios_by_id["email"]).to eql(valor)
        
      when "password"
        expect(@response_get_usuarios_by_id["password"]).to eql(valor)

      when "administrador"
          expect(@response_get_usuarios_by_id["administrador"]).to eql(valor)
          
      else
        raise "Invalid Parameter!!! -> #{chave}"
    
    end
  end
end


Dado('API1_Usuarios - Validar se os dados correspondem ao cadastro') do
  expect(@response_get_usuarios_by_id["nome"]).to eql(@cadastro_tabela["nome"])
  expect(@response_get_usuarios_by_id["email"]).to eql(@cadastro_tabela["email"])
  expect(@response_get_usuarios_by_id["password"]).to eql(@cadastro_tabela["password"])
  expect(@response_get_usuarios_by_id["administrador"]).to eql(@cadastro_tabela["administrador"])
end


Dado('API1_Usuarios_PUT - atualizo um novo usuario - conforme a tabela') do |table|
  table = formatarRegexDaTabela(table.hashes[0])
  @atualizacao_tabela = table

  @usuarios_payload.create_put_usuarios_body()
  @usuarios_payload.edit_post_usuarios_body_by_table(table)
  @request_body = @usuarios_payload.body

  @response = usuarios_request.put_usuarios(@request_body.to_json, @response_post_usuarios["_id"])
  log %{
    STATUS CODE: #{@response.code}
  }
  
  @response_put_usuarios = @response.parsed_response  

  expect(@response.code).to eql(200)
  expect(@response_put_usuarios["message"]).to eql("Registro alterado com sucesso")

  log %{
    RESPONSE: #{@response_put_usuarios}
  }
end


Dado('API1_Usuarios - Validar se os dados correspondem a atualização') do
  expect(@response_get_usuarios_by_id["nome"]).to eql(@atualizacao_tabela["nome"])
  expect(@response_get_usuarios_by_id["email"]).to eql(@atualizacao_tabela["email"])
  expect(@response_get_usuarios_by_id["password"]).to eql(@atualizacao_tabela["password"])
  expect(@response_get_usuarios_by_id["administrador"]).to eql(@atualizacao_tabela["administrador"])
end