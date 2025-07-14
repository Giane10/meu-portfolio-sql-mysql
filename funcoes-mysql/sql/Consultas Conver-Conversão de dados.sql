/*Abriremos um novo script e começaremos com uma consulta simples, selecionando a data atual no formato timestamp:*/
SELECT CURRENT_TIMESTAMP() AS RESULTADO;

/*O retorno será um dado no formato de data. A título de exemplo, vamos tentar rodar uma função de texto com esse dado em formato de data:*/
SELECT CONCAT('O dia de hoje é : ', CURRENT_TIMESTAMP()) AS RESULTADO;

/*Note que essa data é exibida no formato padrão (ano, mês, dia, horas, minutos e segundos). Agora, com a função DATE_FORMAT() e os 
especificadores que vimos há pouco, podemos modificar essa visualização. Vamos começar usando %Y:*/
SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%Y') ) AS RESULTADO;

/*Nosso primeiro parâmetro é a data atual. Já o segundo parâmetro diz respeito ao formato: na tabela que consultamos, 
no Manual de Referências, a descrição de %Y indica a conversão do ano com quatro dígitos. Podemos optar por outro formato, 
por exemplo, usando o %y (com "y" minúsculo) e a exibição do ano terá apenas dois dígitos:*/
SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%y') ) AS RESULTADO;

#Ademais, é possível concatenar com outros especificadores e até símbolos, como a barra:
SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%m/%y') ) AS RESULTADO;

/*Agora, teremos mês e ano. No caso, %m exibirá o número do mês com dois dígitos. Se nosso objetivo for apresentar o mês com apenas 
um dígito, nós vamos à tabela e procuramos como fazer essa mudança — com %c.
Um padrão bastante usado é o dia, seguido do mês (com dois dígitos) e o ano (com quatro dígitos):*/
SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%d/%m/%Y') ) AS RESULTADO;

#Ademais, podemos acrescentar o dia da semana (com %W):
SELECT CONCAT('O dia de hoje é: ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%m/%Y') ) AS RESULTADO;

/*Também temos a opção de adicionar o número da semana (com %U). Ou seja, se o resultado mostrar o número 15, quer dizer 
que estamos na 15ª semana do ano:*/
SELECT CONCAT('O dia de hoje é : ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%m/%Y - %U') ) AS RESULTADO;


/*Finalmente, aprenderemos sobre a função CONVERT(), que faz a conversão de um tipo para outro (especificado como segundo parâmetro). 
Por exemplo, vamos transformar um valor numérico em char:*/
SELECT CONVERT(23.3, CHAR) AS RESULTADO;
#No retorno, é difícil distinguir o tipo desse registro. Para confirmar a conversão, podemos executar uma função que só 
#admite textos, como o SUBSTRING():
SELECT SUBSTRING(CONVERT(23.3, CHAR),1,1) AS RESULTADO;
#Dessa vez, o retorno será 2, o que quer dizer que a função SUBSTRING() identificou "23.3" como um texto e fez a extração da substring
# (um caractere a partir do primeiro).
