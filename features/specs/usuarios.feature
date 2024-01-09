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
            Cenário: Criar um novo usuário
            Dado API1_Login_POST - realizo o login
            E API1_Usuarios_POST - cadastro um novo usuario - conforme a tabela
            | nome          | email          | password     | administrador |
            | "random_name" | "random_email" | "random_num" | "true"        |
            E API1_Usuarios_GET - pesquiso o usuario pelo Id
            E API1_Usuarios - Validar se os dados correspondem ao cadastro


            # Verbo: PUT
            #     * path: "/usuarios"
            #     * descrição: "Atualizar"(deveria ser patch) um usuario
            @smoke_testing
            Cenário: Atualizar um usuário
            Dado API1_Login_POST - realizo o login
            E API1_Usuarios_POST - cadastro um novo usuario - conforme a tabela
            | nome          | email          | password     | administrador |
            | "random_name" | "random_email" | "random_num" | "true"        |
            E API1_Usuarios_GET - pesquiso o usuario pelo Id
            E API1_Usuarios - Validar se os dados correspondem ao cadastro
            E API1_Usuarios_PUT - atualizo um novo usuario - conforme a tabela
            | nome        | email                 | password  | administrador |
            | "Testador1" | "testador1@email.com" | "1234567" | "false"       |
            E API1_Usuarios_GET - pesquiso o usuario pelo Id
            E API1_Usuarios - Validar se os dados correspondem a consulta - conforme a tabela
            | nome        | email                 | password  | administrador |
            | "Testador1" | "testador1@email.com" | "1234567" | "false"       |