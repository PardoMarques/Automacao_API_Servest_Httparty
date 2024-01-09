# Remover aspas dos Valores (cleanQuoteTable)
def formatarRegexDaTabela(tabela)

  tabela.each do |chave, valor|

    if valor.include?(%{\"})
      valor = valor.delete(%{\"})
    end

    if valor.include?(':: ')
      valor = valor.split(%{:: })
    end

    tabela[chave] = verificarRandomico(valor)
  end

  return tabela
end

def verificarRandomico(entrada)
  resultado = entrada
  case entrada
    when "random_name"
      resultado = Faker::Name.male_first_name

    when "random_email"
      resultado = "#{rand(1..10000)}caio@teste.com"

    when "random_num"
      resultado = "#{rand(1..10000)}"

    when "random_cpf"
      resultado = CpfGenerator.formatted
  end
  return resultado
end