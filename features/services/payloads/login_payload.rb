Dir[File.join(File.dirname(__FILE__), "/features/services/models/*_body.rb")].each{|file| require file}

class LoginPayload
    attr_accessor :body

    def initialize
        self.body = nil?
    end

    def create_post_login_body()
        self.body = JSON.parse(post_login_body)
    end

end
