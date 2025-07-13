/*1) Voltando ao Workbench, vamos ver formas diferentes de exibir os resultados. Digite:*/
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;
#Veja que temos linhas onde o conjunto EMBALAGEM / TAMANHO se repete

#2) Agora digite o comando:
select distinct embalagem, tamanho from tabela_de_produtos;
#O simples fato de incluirmos a cláusula DISTINCT faz com que os registros não se repitam

#3) Podemos aplicar filtros a seleção com DISTINCT.
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos
WHERE SABOR = 'Laranja';

#4) E podemos acrescentar mais campos à seleção DISTINCT.
SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM tabela_de_produtos;

#5) Podemos limitar o número de linhas exibidas na saída. Digite:
SELECT * FROM tabela_de_produtos LIMIT 5;
#Temos acima nossa saída limitada aos primeiros 5 registros.

#6) Podemos exibir os registros dentro de um intervalo de linhas. Digite:
SELECT * FROM tabela_de_produtos LIMIT 2,3;

#7) As saídas de uma comando SELECT podem ser apresentadas de forma ordenada. Veja abaixo:
SELECT * FROM tabela_de_produtos order by PRECO_DE_LISTA;
#Temos os valores ordenados por preço de lista, do menor para o maior.

#8) Podemos mudar esta ordem. Digite:
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;

#9) Os valores podem vir ordenados alfabeticamente quando incluímos um campo texto no critério de ordenação. Digite:
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO;

#10) Também, no critério de ordenação do tipo texto, podemos mudar a ordem para do maior para o menor. Digite:
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC;

#11) O critério de ordenação pode ser diferente para cada tipo. Veja o exemplo abaixo onde usamos 
#dois campos como critério de ordenação e a ordem diferente para cada um deles:
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

/*12) Os dados podem ser agrupados. Quando isso acontece, temos que aplicar um critério de agrupamento para os campos numéricos. 
Podemos usar SUM, AVG, MAX, MIN, e outros mais. Digite o comando abaixo:*/
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;
/*Note que temos várias linhas para RJ e SP. Como fazemos para somar todos os limites de crédito para RJ e SP?*/

#13) A solução está no comando abaixo:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO;

#14) Podemos usar outros critérios como o valor máximo.
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_Produtos GROUP BY EMBALAGEM;
#Aqui vemos o maior preço de lista para cada tipo de embalagem.

#15) O comando COUNT conta o número de ocorrências na tabela. Digite:
SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM;
#Temos acima o número de produtos PET, Garrafa e Lata.

#16) O filtro pode ser aplicado sobre o agrupamento, como uma consulta qualquer. Digite:
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;

#17) Além disso, o agrupamento também pode ser feito por mais de um campo. Digite:
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
GROUP BY ESTADO, BAIRRO;

#18) Podemos mesclar agrupamento com ordenação. Digite:
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
WHERE CIDADE = 'Rio de Janeiro'
GROUP BY ESTADO, BAIRRO
ORDER BY BAIRRO;

#19) Veja a consulta abaixo:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO;

#20) Queremos aplicar um filtro sobre o resultado desta consulta. Logo digite:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
WHERE SOMA_LIMITE > 900000
GROUP BY ESTADO;
#Veja que a consulta acima vai ocasionar um erro.

#21) Usamos o HAVING para filtrar a saída de uma consulta usando como critério o valor agrupado. Digite:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 900000;

#22) O critério usado no HAVING não precisa ser o mesmo usado no filtro. Veja o comando abaixo:
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;
#Ele usa o MIN para agrupamento.

#23) Porém, na consulta abaixo, o critério do HAVING pede a soma. Digite:
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80;

#24) No HAVING podemos usar mais de um critério usando AND ou OR.
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80 AND MAX(PRECO_DE_LISTA) >= 5;

#25) O comando CASE permite que possa ser classificado cada registro da tabela. Digite o comando abaixo:
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO
FROM tabela_de_produtos;
#Com o CASE foi possível classificar os produtos como CARO, BARATO ou EM CONTA conforme o valor do seu preço de lista.

#26) Podemos usar o CASE como critério de agrupamento, Digite o comando abaixo:
SELECT EMBALAGEM,
CASE
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO'
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM,
CASE
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO'
END
ORDER BY EMBALAGEM;

/*Nesta aula, aprendemos:

Como apresentar somente linhas distintas numa seleção;
Como ordenar a saída da seleção;
Como agrupar linhas por um conjunto de campos e aplicando um critério de agrupamento sobre os campos numéricos (SUM, MIN, MAX, AVG, etc ..).
Como utilizar o comando HAVING para aplicar um filtro usando os campos numéricos agrupados como condição.
Como limitar a saída das consultas;
Como usar o CASE para classificar um determinado campo por um critério.*/
