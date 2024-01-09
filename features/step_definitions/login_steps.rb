require "./features/services/model_resources/response_schemas/login_schema.rb"

Dado('API1_Login_POST - realizo o login') do
    @login_payload.create_post_login_body()
    @request_body = @login_payload.body

    
    @response = login_request.post_login(@request_body.to_json)
    log %{
      STATUS CODE: #{@response.code}
    }
    @response_post_login = @response.parsed_response 
    schema = JSON.parse(post_login_schema)
    resultSchema = JSON::Validator.validate(schema, @response_post_login)

    expect(@response.code).to eql(200)
    expect(resultSchema).to eql(true)
    expect(@response["message"]).not_to eql(nil)
    expect(@response["authorization"]).not_to eql(nil)
    @response_login_authorization = @response["authorization"]

    log %{
      RESPONSE: #{@response.parsed_response}
    }
end
