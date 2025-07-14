
#Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).

SELECT CONCAT(NOME, ' (', CPF, ') ') AS RESULTADO FROM TABELA_DE_CLIENTES;

SELECT * FROM tabela_de_clientes;

SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO) AS COMPLETO 
FROM tabela_de_clientes

#Crie uma consulta que mostre o nome e a idade atual dos clientes.
#Dica: Vc pode usar a função "TIMESTAMPDIFF" neste caso
SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS    IDADE
FROM  tabela_de_clientes

/*Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens temos a quantidade e o faturamento. 
Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.*/
SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA)




/*Queremos construir um SQL cujo resultado seja, para cada cliente:

“O cliente João da Silva faturou 120000 no ano de 2016”.

Somente para o ano de 2016.*/

SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA)
/*Copiar código
Atenção com esse código podemos receber o erro 1055

O erro 1055 acontece porque o MySQL tem um modo de operação chamado "only_full_group_by", o qual determina que todas as colunas contidas no SELECT também estejam presentes na cláusula GROUP BY (que realiza o processo de agregação dos registros).

Para que esse erro não apareça nesta situação ou em outras semelhantes, podemos realizar o seguinte passo a passo:

1 - Executar o script abaixo em nosso MySQL Workbench:*/

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

/*De maneira geral, estamos alterando a organização do nosso ambiente global, substituindo o modo de operação “only_full_group_by” (que está causando o erro) por uma string vazia, a qual na realidade não representa nada.

2 - Localizar, no menu de navegação, a opção “Database” e selecioná-la com o botão do mouse;

3 - Clicar em “Connect to Database” para inicializar o ambiente.

Para um melhor entendimento, observa a imagem abaixo que ilustra os passos 2 e 3:

Início da transcrição. Recorte de captura de tela do menu de opções superior do MySQL Workbench. Dentre os itens do menu, está 
selecionada a opção “Database”, ao seu lado há um círculo vermelho com o número “2” de coração branca. Da opção “Database”, é expandido uma lista de seleção cujo primeiro item, que diz “Connect to Database”, está destacado por um borda vermelha, no seu lado direito há um círculo vermelho com o número “3” de coloração branca. Fim da transcrição.

Feito isso, seu Banco de Dados será reconectado, basta você clicar no botão “Ok” para confirmar e então executar novamente o SELECT 
disponibilizado pelo exercício:*/

SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA);

/*Por meio dessas etapas, fazemos com que o modo "only_full_group_by" não seja mais levado em consideração pelo MySQL. Logo, o 
erro 1055 não aparecerá mais em nosso programa.*/