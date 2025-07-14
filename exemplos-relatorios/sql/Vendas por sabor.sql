/* Criar um relatorio sobre a venda do ano de 2016 por sabores. Tudo de forma ordenada do maior para o menor, onde terei as 
quantidades em litros vendidas no ano todo e no final um percentual de participacao*/

/*Para nosso relatório, precisamos de três informações que estão em três tabelas diferentes. 
Quantidade de vendas encontra-se na tabela de itens de notas fiscais. Os sabores são listados na tabela de produtos. 
E o ano das vendas está na tabela de notas fiscais, na coluna "DATA_VENDA". Primeiro juntaremos essas tabelas com o comando JOIN.*/

#Nossa primeira junção será entre a tabela de produtos e a tabela de itens de notas fiscais, 
#que têm "CODIGO_DO_PRODUTO" como campo em comum:

SELECT * FROM tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO;

/*Em seguida, faremos mais um INNER JOIN com a tabela de notas fiscais, dessa vez usando o campo em comum "NUMERO". 
Essa junção é importante para acessarmos a data, presente nas notas fiscais:*/

SELECT * FROM tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO;

/*E, depois, vamos selecionar apenas as colunas relevantes para o relatório (sabor, quantidade e data). Ou seja, 
substituiremos o asterisco pelos campos que nos interessam, cuidando para colocar os prefixos corretos, 
já que cada coluna pertence a uma tabela distinta — sabor, à tabela de produtos; o ano, à tabela de notas fiscais; 
e quantidade, à de itens de notas fiscais:*/

SELECT TP.SABOR, NF.DATA_VENDA, INF.QUANTIDADE FROM
tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO;

/*Lembrando que o foco do relatório é 2016, nossa primeira meta será agrupar os registros anualmente (ignorando dia e mês). 
Então, vamos modificar o formato da data para que mostre somente o ano. Aplicaremos a função YEAR sobre a data da venda:*/

SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, INF.QUANTIDADE FROM
tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO;

#Em seguida, agruparemos os registros pelo ano e pelo sabor, somando os valores da coluna "QUANTIDADE". Usaremos GROUP BY:

SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) QUANTIDADE FROM
tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA);

/*Com esses dados agrupados, filtraremos apenas os registros cujo ano é 2016. Usaremos a cláusula WHERE (depois do JOIN, 
mas antes do GROUP BY). E, finalmente, vamos organizar o resultado do maior para o menor (ordem descendente), de acordo com os 
valores da coluna "QUANTIDADE". Basta adicionar o comando ORDER BY ao final da consulta:*/

/* QUANTIDADE VENDIDA POR SABOR ANO 2016 */
SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) QUANTIDADE FROM
tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE year(NF.data_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;

/*A seguir, focaremos na coluna de participação. Para calcular esse percentual, dividimos a quantidade vendida de cada sabor 
pela quantidade total de sucos vendidos, então multiplicamos o resultado por 100.

Para obter a quantidade total, basta reutilizar a última seleção, removendo as duas ocorrências de TP.SABOR:*/
SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) QUANTIDADE FROM
tabela_de_produtos TP
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE year(NF.data_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;

/*Logo, sabemos que a quantidade total é 3626240 litros! Agora, precisamos fazer a junção desta tabela com aquela que 
reservamos há pouco, com a quantidade vendida por sabor em 2016.

Para facilitar o entendimento, primeiramente vamos copiá-las uma abaixo da outra, retirando os dois comandos ORDER BY. 
Não é preciso rodar o script ainda, estamos construindo a consulta passo a passo:

 QUANTIDADE VENDIDA POR SABOR ANO 2016 */

SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA);

/* QUANTIDADE TOTAL 2016*/
SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA);
/*Depois, vamos colocá-las entre parênteses (seguidos de AS) para transformá-las em subconsultas, 
atribuindo-lhes aliases "VENDA_SABOR" e "VENDA_TOTAL":*/

(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR;

(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL;

/*Então, faremos um INNER JOIN entre essas duas subconsultas. É interessante lembrar que os INNER JOINs não precisam 
necessariamente ser feitos com tabelas, podemos aplicá-los em subconsultas. No nosso caso, a coluna "ANO" será o campo em comum:*/

SELECT * FROM
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO;

/*Finalmente, vamos executar a seleção. As três primeiras colunas do resultado são referentes à primeira subconsulta, 
em que "QUANTIDADE" é o volume de suco vendido de cada sabor. As duas colunas seguintes são referentes à segunda subconsulta, 
onde "QUANTIDADE" é o volume total de suco vendido.*/

/*Selecionaremos somente os campos que nos interessam e adicionaremos a coluna "PARTICIPACAO". Como vimos antes, 
o cálculo desse percentual é a divisão da quantidade vendida de cada sabor pela quantidade total de sucos vendidos, 
multiplicado por 100:*/

SELECT VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
(VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2 AS PARTICIPACAO FROM 
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO;

/*No campo "PARTICIPACAO", aplicaremos a função ROUND() para exibir duas casas decimais. 
Por fim, vamos ordenar a consulta, aplicando um ORDER BY:*/

SELECT VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
ROUND((VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)) AS VENDA_SABOR
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_SABOR.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_SABOR.QUANTIDADE DESC;

/*Visualizando esse ranqueamento dos sabores mais vendidos, reconhecemos, por exemplo, em primeiro lugar 
o suco de manga, com 613309 litros vendidos, representando 16,91% das vendas totais de 2016. Note que, com o uso do ROUND(), 
a participação que antes mostrava 16,9131% passou a ter apenas duas casas decimais (16,91%) — assim, a leitura ficou mais simples.

Conseguimos, então, criar o relatório conforme o modelo solicitado pela área de vendas da empresa de sucos!

*/
