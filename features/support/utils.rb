# Remover aspas dos Valores (cleanQuoteTable)
def formatarRegexDaTabela(tabela)

  tabela.each do |chave, valor|

    if valor.include?(%{\"})
      valor = valor.delete(%{\"})
    end

    if valor.include?(':: ')
      valor = valor.split(%{:: })
    end

    tabela[chave] = valor
  end

  return tabela
end