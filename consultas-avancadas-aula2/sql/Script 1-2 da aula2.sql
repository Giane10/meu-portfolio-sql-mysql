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


use sucos_vendas;
/*selecione na tabela a condicao sabor manga ou tamanho 470ml*/
select * from tabela_de_produtos where sabor = 'manga'
or tamanho = '470 ml';

/*selecione na tabela a condicao sabor manga e tamanho 470ml*/
select * from tabela_de_produtos where sabor = 'manga'
and tamanho = '470 ml';

/*selecione na tabela a condicao NAO(sabor manga e tamanho 470ml)*/
select * from tabela_de_produtos where not(sabor = 'manga'
and tamanho = '470 ml');

/*selecione na tabela a condicao NAO(sabor manga ou tamanho 470ml)*/
select * from tabela_de_produtos where not(sabor = 'manga'
or tamanho = '470 ml');

/*selecione na tabela a condicao sabor manga e NAO(tamanho 470ml)*/
select * from tabela_de_produtos where sabor = 'manga'
and not(tamanho = '470 ml');

/*in= contido: listar todos que sejam laranja e manga*/
select * from tabela_de_produtos where sabor in ('laranja', 'manga');

/*igual o in= contido: listar todos que sejam laranja ou manga*/
select * from tabela_de_produtos where sabor = 'laranja' or SABOR = 'manga';

/*lista todos que moram e sao paulo e rio de janeiro, e que tem idade maior que 20 anor*/
select * from tabela_de_clientes where cidade in ('rio de janeiro', 'sao paulo')
and idade >= 20;

/*lista todos que moram e sao paulo e rio de janeiro, e que tem idade maior ou = a 19 anos e menor ou =  21 anos*/
select * from tabela_de_clientes where cidade in ('rio de janeiro', 'sao paulo')
and (idade >= 19 and idade <=21);


/*operador LIKE*/
/*Nesse exemplo, "tab" refere-se a uma tabela, e "campo" é a coluna que se está consultando. 
Após o LIKE, escrevemos o critério de busca entre aspas simples. 
Esse critério deve ser um texto e pode vir acompanhado do 
símbolo de porcentagem, também chamado de percent (%).

O % é usado para representar qualquer registro genérico que venha antes ou depois do texto 
que estamos procurando. Ele é como um caractere curinga em determinado trecho de 
uma string, equivalente ao * quando manipulamos arquivos.*/

#SELECT * FROM tab WHERE campo LIKE '<condição>';

/* a seleção retorna produtos com dois sabores diferentes: Maçã e Cereja/Maçã.*/
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';

/*buscaremos todos os produtos que contêm "Maça" no campo "SABOR" E cuja embalagem é PET.*/
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%' AND
EMBALAGEM = 'PET';