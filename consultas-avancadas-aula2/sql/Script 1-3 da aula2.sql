/*Atividade*/

/*Qual seria o comando SQL para selecionar todos os itens de notas fiscais 
cuja quantidade seja maior que 60 e preço menor ou igual a 3?*/

select * from itens_notas_fiscais where quantidade > 60 and preco <= '3';
SELECT * FROM itens_notas_fiscais WHERE QUANTIDADE > 60 AND PRECO <= 3;

/*Quantos clientes possuem o último sobrenome Mattos?*/

select * from tabela_de_clientes where nome like '%Mattos';
SELECT * FROM tabela_de_clientes WHERE NOME LIKE '%Mattos'