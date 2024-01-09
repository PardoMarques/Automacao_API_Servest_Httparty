            #language: pt

            @regression_testing @usuarios
            Funcionalidade: Validar endpoints Usuarios

            #################################
            ##################### SMOKE TESTS
            #################################

            # Verbo: POST
            #     * path: "/usuarios"
            #     * descrição: Criar um novo usuario
            @smoke_testing
            Esquema do Cenário: Criar um novo usuário
            Dado via API1 - realizo um novo login
            E via API1 - cadastro um novo usuario - conforme a tabela
            | nome           | email                  | password | administrador |
            | "Caio Marques" | "caio.teste@email.com" | "123456" | "true"        |
            E via API1 - pesquiso o usuario pelo Id
            E via API1 - VALIDAR - os dados correspondem a consulta - conforme a tabela
            | nome           | email                  | password | administrador |
            | "Caio Marques" | "caio.teste@email.com" | "123456" | "true"        |


            # Verbo: PUT
            #     * path: "/usuarios"
            #     * descrição: "Atualizar"(deveria ser patch) um usuario
            @smoke_testing
            Esquema do Cenário: Atualizar um usuário
            Dado via API1 - realizo um novo login
            E via API1 - cadastro um novo usuario - conforme a tabela
            | nome           | email                  | password | administrador |
            | "Caio Marques" | "caio.teste@email.com" | "123456" | "true"        |
            E via API1 - pesquiso o usuario pelo Id
            E via API1 - VALIDAR - os dados correspondem a consulta - conforme a tabela
            | nome           | email                  | password | administrador |
            | "Caio Marques" | "caio.teste@email.com" | "123456" | "true"        |