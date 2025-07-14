#DIA ATUAL AGORA
SELECT curdate();

#HORA ATUAL
SELECT current_time();

#DATA E HORA ATUAL
SELECT current_timestamp();

#ANO
SELECT YEAR(current_timestamp());

#DIA
SELECT DAY(current_timestamp());

#MÊS
SELECT MONTH(current_timestamp());

#NOME DO MES
SELECT MONTHNAME(current_timestamp());

#QUANTOS DIAS EU TENHO ENTRE HOJE E O PRIMEIRO DIA DO ANO 2019
SELECT datediff(CURRENT_TIMESTAMP(), '2019-01-01') AS RESULTADO;

#quantos dias eu vivi?
SELECT datediff(CURRENT_TIMESTAMP(), '1984-04-21') AS RESULTADO;
SELECT datediff(CURRENT_TIMESTAMP(), '2019-11-05') AS RESULTADO;

#diminuir 5 dias da data de hoje
select date_sub(current_timestamp(), interval 5 day) as resultado;

# Dessa forma, o retorno mostrará a data de hoje (na coluna que nomeamos "DIA_HOJE") 
#e o resultado da** substração **de 5 dias na segunda coluna.
SELECT CURRENT_TIMESTAMP() AS DIA_HOJE, DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS RESULTADO;

/*E, por fim, faremos um exemplo usando as tabelas do nosso banco de dados "sucos_vendas". 
Primeiramente, vamos verificar todas as datas em que foram emitidas notas fiscais:*/
SELECT DISTINCT DATA_VENDA FROM NOTAS_FISCAIS;

/*Agora, utilizaremos as funções DAYNAME() e MONTHNAME() para que seja mostrado no resultado o dia da semana e o mês em que 
as vendas ocorreram, bem como o ano (com a função YEAR()):*/
SELECT DISTINCT DATA_VENDA,
DAYNAME(DATA_VENDA) AS DIA, MONTHNAME(DATA_VENDA) AS MES, YEAR(DATA_VENDA) AS ANO FROM NOTAS_FISCAIS;
/*Assim, além da primeira coluna informando a data, haverá outras três colunas mostrando o dia da semana, 
o nome do mês e o ano das vendas.*/