class UsuariosRequest
    include HTTParty
    base_uri CONFIG["aplicacao1"]["url"]

    def initialize
    @timeout = CONFIG["aplicacao1"]["timeout"]
    @headers = {"Content-Type": "application/json"}
    @options = {
        "timeout": CONFIG["aplicacao1"]["timeout"],
        "headers": @headers
    }

    end

    def post_usuarios(body)
        url_path = "/usuarios"
        self.class.post(url_path, @options.merge!({:body => body}))
    end

    def put_usuarios(body, usuario_id)
        url_path = "/usuarios/#{usuario_id}"
        self.class.put(url_path, @options.merge!({:body => body}))
    end

    def get_usuarios_by_id(usuario_id)
        url_path = "/usuarios/#{usuario_id}"
        self.class.get(url_path)
    end

end
