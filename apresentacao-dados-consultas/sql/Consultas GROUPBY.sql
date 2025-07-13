#O comando que vamos aprender é o GROUP BY, que apresentará o resultado agrupando valores numéricos por uma chave de critério:
#SELECT X, SUM(Y) FROM tab GROUP BY X;
#SELECT X, MAX(Y) FROM tab GROUP BY X;
#SELECT X, MIN(Y) FROM tab GROUP BY X;
#SELECT X, AVG(Y) FROM tab GROUP BY X;
/*Um detalhe importante: quando omitimos os campos de agregação e utilizamos apenas a fórmula, não é 
necessário colocar a cláusula GROUP BY. Por exemplo:
SELECT SUM(Y) FROM tab;*/
SELECT * FROM tabela_de_clientes;
#vamos restringir um pouco essa consulta, selecionando apenas o estado e o limite de crédito na tabela:
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;
#Ao fazer essa consulta, veremos uma lista em que cada linha mostra o estado e o limite de crédito de um cliente. 
#Se nosso objetivo for saber o total de limite de crédito de cada estado, usaremos o GROUP BY:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO;
/*Sempre que uma fórmula for usada, é necessário usar um alias ("apelido") 
para o campo. No nosso caso, definimos "LIMITE_TOTAL" como alias da soma dos limites de crédito.
O retorno mostrará os limites de crédito somados agrupados por estado: 
em São Paulo, o limite total é R$810.000,00 e, no Rio de Janeiro, é R$995.000,00.*/
#Faremos, agora, uma consulta relativa às embalagens e aos preços de lista presentes na tabela de produtos:
SELECT EMBALAGEM, PRECO_DE_LISTA FROM tabela_de_produtos;
#Vamos supor que precisamos descobrir qual é o preço mais caro de cada tipo de embalagem (PET, garrafa e lata):
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_Produtos GROUP BY EMBALAGEM;
#Com essa consulta, constatamos que o produto mais caro que vem em garrafas tem o valor de R$13,312. 
#O mais caro com embalagem PET é R$38,012. E o de lata custa R$4,56.
#Além disso, é possível criar seleções com o comando COUNT:
SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM;
/*O retorno nos mostrará a quantidade de produtos que existem com cada tipo de embalagem: 
11 tem embalagem garrafa, 15 vem em PET e 5 em lata.
Vale lembrar que podemos aplicar critérios de filtro juntamente do ORDER BYe do GROUP BY. Como exemplo, primeiramente vamos 
selecionar os limites de crédito agrupados por bairro:*/
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes GROUP BY BAIRRO;
#E, para filtrar a consulta, usaremos uma cláusula WHERE para ver apenas os limites de crédito dos bairros da cidade do Rio de Janeiro:
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;
#Ademais, é possível usar mais de um campo no GROUP BY:
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
GROUP BY ESTADO, BAIRRO;
/*Note que adicionamos o campo "ESTADO" no início da seleção (SELECT ESTADO) e também no fim, depois de 
GROUP BY. Na primeira ocorrência, estamos determinando como exibiremos os dados, já na segunda indicamos como queremos que sejam agrupados.
Em seguida, aplicaremos um filtro que irá restringir a consulta somente à cidade do Rio de Janeiro:*/
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO;
/*Ou seja, estamos selecionando estado, bairro e a soma dos limites de crédito somente da 
cidade do Rio de Janeiro, agrupando esses dados por estado e bairro.
E, por fim, se nossa meta for visualizar esse resultado de forma ordenada, podemos ainda incluir o ORDER BY:*/
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes 
WHERE CIDADE = 'Rio de Janeiro' 
GROUP BY ESTADO, BAIRRO
ORDER BY BAIRRO;

/*Dessa forma, veremos que o retorno respeitará a ordem alfabética dos bairros, começando por Água Santa, 
Barra da Tijuca, Cidade Nova e assim por diante. Essa última consulta é mais complexa, pois estamos agrupando, 
filtrando e ordenando dados em uma única seleção.
Aviso, quando realizamos o agrupamento é importante destacar que podemos receber o erro 1055 que acontece 
porque o MySQL tem um modo de operação chamado "only_full_group_by", o qual determina que todas as colunas 
contidas no SELECT também estejam presentes na cláusula GROUP BY (que realiza o processo de agregação dos registros).*/

