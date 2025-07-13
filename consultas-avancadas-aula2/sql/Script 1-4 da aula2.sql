# Consolidando o conhecimento:

#Aqui veremos todos os campos da tabela Tabela_de_Clientes. Isso porque os campos foram selecionados um a um.
USE sucos_vendas;
SELECT CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO,
CEP, DATA_DE_NASCIMENTO,
IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA
FROM tabela_de_clientes;

#Este resultado foi semelhante a consulta anterior. Isso porque, ao colocar * estamos selecionado todos os campos.
SELECT * FROM tabela_de_clientes;

#Agora podemos ver que não é necessário selecionar todos os campos de uma tabela. Basta eu destacar os campos que serão vistos.
SELECT CPF, NOME FROM tabela_de_clientes;

#Nem sempre o nome original da coluna é o nome que queremos que seja retornado pela consulta. Por isso, podemos criar Alias (Apelidos) 
#para os campos escrevendo algo após o comando AS.
SELECT CPF as INDENTIFICADOR, NOME AS CLIENTE FROM tabela_de_clientes;

#Aqui, o nosso retorno foi uma linha, porque selecionamos um filtro através da chave primária, que não repete.
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';

#Os filtros usados abaixo retornam mais linhas. Podemos usar qualquer coluna como critério.
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Uva';
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja';
SELECT * FROM tabela_de_produtos WHERE EMBALAGEM = 'PET';
SELECT * FROM tabela_de_produtos WHERE EMBALAGEM = 'pet';

#Neste caso podemos usar >,>=, <, <=, =, <> e Between. Assim podemos aplicar 
#filtros sobre os valores que retornem mais valores.
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA > 19.50;
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA BETWEEN 19.50 AND 19.52;

#Aqui retornamos ou um filtro (Sabor = Manga) ou outro ( Tamanho = 470 ml). Isso porque usamos o operador OR.
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga'
OR TAMANHO = '470 ml';
#Agora, por causa do operador AND, o retorno somente ocorrerá quando as duas condições ocorrerem na mesma linha da tabela.
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga'
AND TAMANHO = '470 ml';

#Aqui iremos buscar todos os registros cujo sabor possua a palavra Maça. Não importa se no início, no meio ou no final do texto.
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';

#Por fim, faremos a consulta do texto “Maça” apenas para embalagens PET.
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%'
AND EMBALAGEM = 'PET';