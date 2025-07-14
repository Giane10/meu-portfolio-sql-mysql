#Obtenha o faturamento anual da empresa. Leve em consideração que o valor financeiro das vendas consiste 
#em multiplicar a quantidade pelo preço.

SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA)

/*  --------O comando SELECT * FROM notas_fiscais exibe todas as linhas e colunas da tabela notas_fiscais. 
Da mesma forma, o comando SHOW COLUMNS FROM notas_fiscais mostra a estrutura da tabela, ou seja, as colunas e seus tipos de dados.

Sobre sua dúvida quanto ao alias FATURAMENTO, gostaria de reforçar que não é uma coluna existente na tabela, 
mas sim um nome temporário dado ao resultado da expressão SUM(QUANTIDADE * PRECO) na consulta. Esse alias é um apelido que facilita 
a referência ao resultado da soma na saída da consulta.

O INNER JOIN combina as linhas das duas tabelas (NOTAS_FISCAIS e ITENS_NOTAS_FISCAIS) onde a condição especificada é verdadeira.

No código abaixo:

SELECT * FROM NOTAS_FISCAIS, ITENS_NOTAS_FISCAIS;

Este comando combina cada linha da tabela NOTAS_FISCAIS com cada linha da tabela ITENS_NOTAS_FISCAIS, 
resultando em um produto cartesiano. ------------*/

# - Preencha a sentença onde temos pontos de interrogação no comando SQL abaixo:

/*SELECT * FROM
TAB1 ???? TAB2 ON TAB1.COD = TAB2.COD

#FULL JOIN

/*Preencha a sentença em interrogação do comando SQL abaixo: SELECT * FROM TAB1 ???? TAB2 ON TAB1.COD = TAB2.COD

Dica: Queremos ver todos os registros da TAB2 e apenas os que correspondem da TAB1.

Alternativa correta
RIGHT JOIN*/




#Quando eu quero listar todos os registros de duas ou mais tabelas, listando inclusive os repetidos, qual UNION eu uso? R; UNION ALL

/*Qual seria a consulta usando subconsulta que seria equivalente a:*/

  SELECT CPF, COUNT(*) FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF
  HAVING COUNT(*) > 2000;
  
  #resposta
  
  SELECT X.CPF, X.CONTADOR FROM 
(SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF) X WHERE X.CONTADOR > 2000


