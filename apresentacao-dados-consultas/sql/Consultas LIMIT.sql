
SELECT * FROM tabela_de_produtos;

#O número que colocamos depois de LIMIT dirá quantas linhas serão exibidas. Para ver em um exemplo, considere a seguinte tabela:
#O resultado dessa consulta traria os quatro primeiros registros da tabela original:
SELECT * FROM tabela_de_produtos LIMIT 5;

/*Ou seja, o primeiro número depois do termo LIMIT determina a partir de qual registro queremos ver, e o segundo número 
define a quantidade de itens a serem mostrados. Nesse caso, a partir do segundo item da tabela original, vemos três registros.

É necessário lembrar que as tabelas do MySQL se iniciam no índice 0. Sendo assim, o retorno correto de
 SELECT * FROM tabela LIMIT 2,3 seria o seguinte:*/
SELECT * FROM tabela_de_produtos LIMIT 2,3;
SELECT * FROM tabela_de_produtos LIMIT 0,2;