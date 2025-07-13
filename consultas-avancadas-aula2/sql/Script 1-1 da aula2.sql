use sucos_vendas;

select cpf, nome from tabela_de_clientes;

select * from tabela_de_clientes;

SELECT CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA FROM tabela_de_clientes;
/* selecinar com nome trocado da coluna*/
select cpf as identificador, nome as cliente from tabela_de_clientes;

select * from tabela_de_produtos;

/* condicional*/
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO ="1000889";

select * from tabela_de_produtos where sabor = 'laranja';

select * from tabela_de_produtos where embalagem = 'pet';

/* ponto flutuante nao consegue buscar, a nao ser com o comando between*/
select * from tabela_de_produtos where PRECO_DE_LISTA = 19.51;/*fica vazio o resultado*/

select * from tabela_de_produtos where PRECO_DE_LISTA between 19.50 and 19.52 ;


/*colocando os operadores AND e OR no meio das expressões*/
SELECT * FROM tab WHERE X = A OR Y = B;
SELECT * FROM tab WHERE X = A AND Y = B;

/*inverte o resultado da expressao*/
NOT (X = A OR Y = B);
NOT (X = A AND Y = B);

((NOT (F)) AND (V OR F)) OR F

((NOT (F)) AND (V)) OR F

((V) AND (V)) OR F

(V) OR F