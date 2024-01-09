Before do 
  @login_payload = LoginPayload.new
  @usuarios_payload = UsuariosPayload.new
end

Before('@skip') do
  skip_this_scenario
end

# After do |scenario|
# end
