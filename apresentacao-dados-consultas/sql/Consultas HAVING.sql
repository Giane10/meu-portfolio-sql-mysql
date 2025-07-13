/*Agora que entendemos o conceito, vamos criar alguns exemplos na nossa base "sucos_vendas". 
Abriremos o MySQL Workbench, criaremos um novo script e começaremos com uma seleção da tabela de clientes, 
consultando a soma dos limites de crédito agrupados por estado:*/
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO;

/*O retorno mostrará que, no estado de São Paulo, temos o total de limite de crédito de R$810.000,00 e, 
no estado do Rio de Janeiro, R$995.000,00. Agora, se nosso objetivo for listar apenas os estados cuja soma do limite 
de crédito for maior que R$900.000,00, parece natural que usemos a cláusula WHERE:*/
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
WHERE SOMA_LIMITE > 900000
GROUP BY ESTADO;

/*No entanto, ao tentar rodar essa consulta, obteremos um erro! O problema é que, 
quando o WHERE é aplicado, o agrupamento ainda não ocorreu. A solução será usar o HAVING, que virá depois do GROUP BY:*/
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 900000;

/*Ou seja, primeiro agrupamos e depois aplicamos a condição. Dessa vez, nossa consulta retornará com sucesso.

Nesse último caso, usamos SUM(LIMITE_DE_CREDITO) tanto no SELECT quanto no HAVING, entretanto não há necessidade de 
sempre usar o mesmo critério. Para exemplificar, primeiro vamos selecionar as embalagens, o maior preço e o menor preço, 
agrupando-os pelo tipo de embalagem:*/
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

/*EMBALAGEM	MAIOR_PRECO	MENOR_PRECO
Garrafa	13.312	3.768
PET	    38.012	7.004
Lata	4.56	2.808*/

/*E, com o intuito de usar o HAVING, filtraremos esse resultado, buscando apenas os produtos cuja soma dos preços 
de lista seja menor ou igual a R$80,00:*/
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80;

/*No SELECT utilizamos MAXe MIN, enquanto no HAVING usamos o SUM - essa consulta ilustra que não há necessidade de 
escolher os mesmos critérios. No retorno, veremos que a embalagem PET não aparece mais, pois não satisfaz a nova condição 
que impomos (SUM(PRECO_DE_LISTA) <=80).

Para finalizar, vale lembrar que temos a opção de acrescentar mais condições ao HAVING, criando um filtro composto com os 
operadores OR e AND, por exemplo:*/
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80 AND MAX(PRECO_DE_LISTA) >= 5;

/*Com essa nova condição (MAX(PRECO_DE_LISTA) >= 5), vamos notar que a embalagem "lata" também não aparecerá mais, 
já que seu valor máximo do preço de lista é R$4,56.*/
