# Validar chaves

    E('Validar se o valor da chave {string} é igual a {string}') do |chave, valor|
        log %{
            Validar se o valor da chave #{chave} é igual a #{valor}
            @response[#{chave}] = #{@response[chave].to_s}
        }

        if (valor == "null")
            valor = nil
        end
        expect(@response[chave]).to eql(valor)
    end

    E('Validar se o valor da chave {string} é igual a {int}') do |chave, valor|
        log %{
            Validar se o valor da chave #{chave} é igual a #{valor}
            @response[#{chave}] = #{@response[chave].to_s}
        }

        if (valor == "null")
            valor = nil
        end
        expect(@response[chave]).to eql(valor)
    end

    E('Validar se o valor da chave {string} não é igual a {string}') do |chave, valor|
        log %{
            Validar se o valor da chave #{chave} não é igual a #{valor}
            @response[#{chave}] = #{@response[chave].to_s}
        }

        if (valor == "null")
            valor = nil
        end
        expect(@response[chave]).not_to eql(valor)
    end

    # E('Validar se o valor da chave {string} deve ser {string}') do |chave, valor|
    #     log %{
    #         Validar se o valor da chave #{chave} deve ser #{valor}
    #         @response[#{chave}] = #{@response[chave].to_s}
    #     }

    #     if (valor == "null")
    #         valor = nil
    #     end
    #     expect(@response[chave]).to be(valor)
    # end

    # E('Validar se o valor da chave {string} não deve ser {string}') do |chave, valor|
    #     log %{
    #         Validar se o valor da chave #{chave} não deve ser #{valor}
    #         @response[#{chave}] = #{@response[chave].to_s}
    #     }

    #     if (valor == "null")
    #         valor = nil
    #     end
    #     expect(@response[chave]).not_to be(valor)
    # end

    E('Validar se o quantidade de itens do objeto {string} é igual a {int}') do |chave, qtd_itens|
        expect(@response[chave].size).to eql(qtd_itens)
    end

# END
