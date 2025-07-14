/*Então, devemos entregar um relatório sobre vendas válidas e inválidas ao gerente de vendas para que possa ser analisado se o 
parâmetro de volume de compras está sendo considerado durante as negociações com os clientes.

Agora que compreendemos nossa meta, aos poucos vamos construir uma seleção que atenda essa demanda. Começaremos abrindo o MySQL 
Workbench e criando um script. Nosso primeiro passo será descobrir o volume total de vendas para cada cliente dentro de um mês, 
lembrando que o mês é o fator limitante.*/

SELECT * FROM ITENS_NOTAS_FISCAIS;
SELECT * FROM NOTAS_FISCAIS;

#Para unificar essa visualização, vamos fazer uma seleção com INNER JOIN:

SELECT * FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO;

#Então, vamos refazer essa consulta, selecionando apenas as colunas relevantes para nosso relatório:
SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO;

#seria interessante agrupar as vendas mensalmente
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, INF.QUANTIDADE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO;

#Se temos vendas no mesmo mês para o mesmo cliente, podemos agrupá-las por esses campos:

/* primeiro passo CONSULTA COM VENDAS DE CLIENTES POR MES */
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');

#  segundo passo exibir o volume de compra permitido para cada cliente.
SELECT * FROM TABELA_DE_CLIENTES TC;

#amos selecionar apenas os campos relevantes:

/* LIMITE DE COMPRA POR CLIENTE */
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE
FROM TABELA_DE_CLIENTES TC;

/*terceiro passo será comparar as tabelas resultantes do primeiro e do segundo passo. Faremos um INNER JOIN entre elas:*/
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO
, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
, TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');








