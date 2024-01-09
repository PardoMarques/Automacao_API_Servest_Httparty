Dir[File.join(File.dirname(__FILE__), "/features/services/models/*_body.rb")].each{|file| require file}

class UsuariosPayload
    attr_accessor :body, :tabela_gherkin

    def initialize
        self.body = nil
        self.tabela_gherkin = nil
    end

    # BASE PAYLOAD

        # POST

            def create_post_usuarios_body()
                if self.body == nil
                    self.body = JSON.parse(post_usuarios_body)
                end
            end

            def create_post_usuarios_body_default()
                self.body = JSON.parse(post_usuarios_body)
            end

        # END

        # PUT

            def create_put_usuarios_body()
                self.body = JSON.parse(post_usuarios_body)
            end
        
        # END

    # END


    def edit_post_usuarios_body_by_table(table)
        self.tabela_gherkin = table

        self.tabela_gherkin.each do |chave, valor|

        case chave

            # UPDATE KEY

                when "nome"
                    update_nome(valor)

                when "email"
                    update_email(valor)

                when "password"
                    update_password(valor)

                when "administrador"
                    update_administrador(valor)
                
            # END

            # CLEAR KEY

                when "delete_nome"
                    delete_nome(valor)

                when "delete_email"
                    delete_email(valor)

                when "delete_password"
                    delete_password(valor)

                when "delete_administrador"
                    delete_administrador(valor)

            # END

            else
                raise "Invalid Parameter!!! -> #{chave}"
            end
        end
    end

    # SET KEY WITH JSON

        def set_JSON_exemplo(jsonExemplo)
            self.body["exemplo"] = exemplo
        end

    # END

    # CLEAR KEY

        def delete_nome(condicao)
            if condicao == "sem informações"
                self.body["nome"] = nil
            elsif condicao == "sem o objeto"
                self.body.delete("nome")
            end
        end

        def delete_email(condicao)
            if condicao == "sem informações"
                self.body["email"] = nil
            elsif condicao == "sem o objeto"
                self.body.delete("email")
            end
        end

        def delete_password(condicao)
            if condicao == "sem informações"
                self.body["password"] = nil
            elsif condicao == "sem o objeto"
                self.body.delete("password")
            end
        end

        def delete_administrador(condicao)
            if condicao == "sem informações"
            self.body["administrador"] = nil
            elsif condicao == "sem o objeto"
            self.body.delete("administrador")
            end
        end

    # END

    # UPDATE KEY

        def update_nome(nome)
            self.body["nome"] = nome
        end

        def update_email(email)
            self.body["email"] = email
        end

        def update_password(password)
            self.body["password"] = password
        end

        def update_administrador(administrador)
            self.body["administrador"] = administrador
        end

    # END

end
