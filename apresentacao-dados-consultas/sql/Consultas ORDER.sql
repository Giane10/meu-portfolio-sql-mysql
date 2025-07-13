#Caso não seja especificado ASC ou DESC, o MySQL automaticamente optará pela ordem ascendente.

SELECT * FROM tabela_de_produtos;

#Verificando o resultado, notaremos que os registros estão ordenados conforme a ordem crescente da coluna "PRECO_DE_LISTA", 
#começando no valor R$2,808 e indo até R$38,012.
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;

#Para mudar a direção da ordenação, vamos inserir o comando DESC na nossa consulta, depois do nome do campo:
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;

#A seguir, faremos uma seleção nessa mesma tabela, porém ordenando pelo campo "NOME_DO_PRODUTO", que tem dados em formato de texto:
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO;

#O resultado estará ordenado pela ordem alfabética dos nomes dos produtos. Caso nosso objetivo seja ver na ordem contrária, 
#precisaremos acrescentar o comando DESC:
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC;

#Por fim, vamos fazer um teste usando um critério composto:
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

#É possível deixar essa consulta ainda mais específica, acrescentando a direção da ordenação que queremos para cada um dos campos:
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;
