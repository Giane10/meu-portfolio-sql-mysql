
SELECT (23+((25-2)/2)*45) AS RESULTADO;
# arredondamento pra mais
SELECT CEILING(12.33333232323) AS RESULTADO;
#arredondamento real
SELECT ROUND(12.33333232323) AS RESULTADO;
#arredondamento pra menos
SELECT FLOOR(12.7777232323) AS RESULTADO;
# numneros aleatorios
SELECT RAND() AS RESULTADO; 

#PRA CADA NOTA FISCAL EU TENHO A QUANTIDADE E O PRECO
SELECT NUMERO, QUANTIDADE, PRECO FROM itens_notas_fiscais;

#FATURAMENTO DA EMPRESA, COM MUITAS CASAS DECIMAIS
SELECT NUMERO, QUANTIDADE, PRECO, QUANTIDADE * PRECO AS FATURAMENTO
 FROM ITENS_NOTAS_FISCAIS;
 
 #ROUND ARREDONDAMENTO REAL COM PARAMETRO 2 = DUAS CASAS DECIMAIS
 SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO
 FROM ITENS_NOTAS_FISCAIS;
