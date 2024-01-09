Dir[File.join(File.dirname(__FILE__), "/services/requests/*_requests.rb")].each{|file| require file}

module HelperRequests

  def login_request
    @login_request ||= LoginRequest::new
  end

  def usuario_request
    @usuario_request ||= UsuariosRequest::new
  end

end
