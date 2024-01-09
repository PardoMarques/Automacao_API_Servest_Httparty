Dado('via API1 - realizo um novo login') do
    @login_payload.create_post_login_body()
    @request_body = @login_payload.body

    @response = login_request.post_login(@request_body.to_json)
    log %{
      STATUS CODE: #{@response.code}
    }

    expect(@response.code).to eql(200)
    expect(@response["message"]).not_to be(nil)
    expect(@response["authorization"]).not_to be(nil)
    @response_login_authorization = @response["authorization"]

    sleep 1
    log %{
      RESPONSE: #{@response.parsed_response}
    }
end
