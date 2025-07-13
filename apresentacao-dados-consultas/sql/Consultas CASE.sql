
SELECT * FROM tabela_de_produtos;
/***_Digamos que nossa intenção é classificar os produtos entre "baratos", "em conta" ou "caros". 
Faremos uma consulta usando o comando CASE e o campo "PRECO_DE_LISTA":
**_Ao final da seleção, coloca-se o END para encerrar o CASE e cria-se um alias. Ao rodar a consulta, 
teremos um retorno com as colunas "NOME_DO_PRODUTO", "PRECO_DE_LISTA" e "STATUS_PRECO", com uma relação de 
quais produtos estão baratos, quais estão em conta e quais estão caros.*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE 
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO 
FROM tabela_de_produtos;

/*Aplicando uma das fórmulas que aprendemos na aula anterior, podemos fazer, por exemplo, 
uma seleção que apresenta a média (average) de preços de produtos baratos, em conta ou caros, agrupados por tipo de embalagem:*/
SELECT EMBALAGEM,
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM, 
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END 
ORDER BY EMBALAGEM;

/*Note que o CASE completo precisa ser inserido no GROUP BY.
Ao analisar o retorno, podemos ver no primeiro registro que os sucos em garrafa que custam menos de R$7 (barato) tem uma 
média de preço de R$5,23. No segundo registro, notamos que os PETs em conta tem uma média de preço de R$9,10, e assim por diante.
Assim, notamos que é possível misturar vários tipos de comandos em um única seleção. Cabe ainda nessa consulta inserirmos um 
ORDER BY EMBALAGEM ao final do script e o resultado será a mesma lista, porém respeitando a ordem alfabética dos tipos de embalagem. 
Com essa nova organização, ficará mais fácil de verificar, por exemplo, que não existem embalagens PET baratas e que todos os 
sucos em lata custam menos de R$7 (baratos).
É possível até incluir uma cláusula WHERE para filtrar somente os produtos com sabor de manga. Veja como fica a consulta completa: */
SELECT EMBALAGEM,
CASE 
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM, 
CASE 
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' 
END 
ORDER BY EMBALAGEM;

/*Nesse caso, podemos observar na primeira linha do resultado, por exemplo, que a média de preços de sucos de manga baratos 
vendidos em garrafas é de R$5,17. Mesclando tudo que já estudamos nesse curso, já somos capazes de criar consultas bastante 
específicas e complexas.*/