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





