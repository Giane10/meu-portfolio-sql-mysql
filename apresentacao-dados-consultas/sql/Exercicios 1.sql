
# Atividades:

#Quais são os bairros da cidade do Rio de Janeiro que possuem clientes?
select distinct bairro from tabela_de_clientes WHERE cidade = 'Rio de Janeiro';
SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';

#Queremos obter as 10 primeiras vendas do dia 01/01/2017. Qual seria o comando SQL para obter este resultado?
SELECT * FROM notas_fiscais where DATA_VENDA = '2017/01/01' limit 10;
SELECT * FROM notas_fiscais  WHERE DATA_VENDA = '2017-01-01' limit 10;

/*Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto 
“Linha Refrescante - 1 Litro - Morango/Limão”, em quantidade? 
(Obtenha este resultado usando 2 SQLs).*/

#Com esta consulta obtemos o resultado do código deste produto: ‘1101035’
SELECT * FROM tabela_de_produtos WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão';
#Com esta informação fazemos a consulta para achar a maior quantidade vendida deste produto.
select * from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' order by quantidade desc;
SELECT * FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC;

/*Aproveitando o exercício do vídeo anterior (maior quantidade vendida) quantos itens de venda existem para o produto '1101035' ?

Uma dica é que, nesse caso, você precisará rodar duas queries. Sendo a primeira associada a maior quantidade de produtos, 
e a segunda com o resultado da primeira, na forma de parâmetro desta segunda query.*/

#Primeiro execute o comando para descobrir a maior quantidade de produtos em um pedido:
SELECT MAX(`QUANTIDADE`) as 'MAIOR QUANTIDADE' FROM itens_notas_fiscais WHERE `CODIGO_DO_PRODUTO` = '1101035' ;
#Depois o comando passando no parâmetro quantidade o valor encontrado no código anterior :
#conta quantas vezes o produto '1101035' foi vendido com a quantidade exatamente igual a 99.
SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;




#Qual é o total de vendas por produto?
SELECT * FROM itens_notas_fiscais;
select CODIGO_DO_PRODUTO, SUM(quantidade) as valor_total 
from itens_notas_fiscais 
group by CODIGO_DO_PRODUTO;

#Qual é o preço médio dos produtos por categoria?
select CODIGO_DO_PRODUTO, avg(preco) as preco_medio 
from itens_notas_fiscais 
group by CODIGO_DO_PRODUTO;

#Quantos clientes existem em cada estado?
SELECT * FROM tabela_de_clientes;
SELECT estado, COUNT(*) 
as Quant_clientes FROM tabela_de_clientes
GROUP BY estado;

#Quais foram os clientes que fizeram mais de 2000 compras em 2016?
/*__**A função COUNT(*) conta o número total de registros (linhas) para cada grupo de cpf.
**__A cláusula WHERE é usada para filtrar os registros antes da agregação. Neste caso, estamos filtrando as notas fiscais 
para incluir apenas aquelas cuja data de venda (DATA_VENDA) é do ano de 2016.
**__A função YEAR(DATA_VENDA) extrai o ano da coluna DATA_VENDA, permitindo que a condição verifique se é igual a 2016.
**__Após aplicar o filtro, estamos agrupando os resultados pelo cpf. Isso significa que todos os registros com o mesmo CPF 
serão agrupados juntos, e a função COUNT(*) contará quantas notas fiscais cada CPF possui.
**__Depois de agrupar os dados, a cláusula HAVING é utilizada para filtrar os grupos resultantes. Neste caso, 
estamos interessados apenas nos CPFs que têm mais de 2000 notas fiscais registradas em 2016.
**__O HAVING COUNT(*) > 2000 garante que apenas os CPFs que atendem a essa condição sejam retornados na consulta final.*/
select cpf, count(*) from notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING COUNT(*) > 2000;

/*Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, 
nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. 
Liste o nome do cliente e esta classificação.*/

select * from tabela_de_clientes;

SELECT nome, 
CASE 
	when year(data_de_nascimento) < 1990 then 'Velho'
    when year(data_de_nascimento) >= 1990 and YEAR(data_de_nascimento) <= 1995 then 'Joven'
    ELSE 'Criança' 
END AS Status_Ano 
FROM tabela_de_clientes;
    


