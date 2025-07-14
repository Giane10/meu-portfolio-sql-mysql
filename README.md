# Meu Portfólio de Projetos SQL e MySQL 

Olá! Seja bem-vindo(a) ao meu portfólio de projetos e exercícios desenvolvidos durante meus estudos de SQL e MySQL.

## Sobre Mim
Sou Giane Costa, uma entusiasta de dados, futura desenvolvedora backend. Este repositório serve como um registro do meu progresso e das habilidades que estou desenvolvendo em bancos de dados.

**Importante:** Os projetos aqui presentes foram desenvolvidos como parte de cursos da plataforma **Alura**. Meu objetivo é demonstrar a aplicação prática dos conhecimentos e habilidades que adquiri em modelagem e manipulação de dados.


## Projetos
Aqui estão os projetos e conjuntos de scripts que você encontrará neste repositório:

### 1. Curso: Consultas SQL: avançando no SQL com MySQL 
* **Origem:** Curso **"Aula 2 - Consultas SQL avançando no SQL com MySQL"** da Alura.
* **Descrição Geral:** Este projeto abrangente demonstra desde a configuração inicial do ambiente de banco de dados (`sucos_vendas_db`) até a realização de consultas e filtros complexos para análise de dados. Ele engloba a base necessária para manipulação e exploração de dados no MySQL.

#### 1.1. Criação do Ambiente: Sucos Vendas DB 
* **Propósito:** Scripts para a construção da estrutura completa do banco de dados `sucos_vendas_db` e a inserção dos dados iniciais. Essencial para recriar o ambiente de estudo.
* **Conceitos Demonstrados:**
    * Criação de Banco de Dados e Tabelas (`CREATE DATABASE`, `CREATE TABLE`).
    * Definição de chaves primárias (`PRIMARY KEY`) e estrangeiras (`FOREIGN KEY`).
    * Inclusão de dados (`INSERT INTO`).
    * Compreensão da modelagem de um banco de dados relacional.
* **Acessar Scripts:** Veja os arquivos na pasta [`sucos-vendas-db/sql/`](https://github.com/Giane10/meu-portfolio-sql-mysql/tree/main/sucos-vendas-db/sql/).
---

#### 1.2. Filtragem e Consultas de Dados 
* **Propósito:** Scripts com exemplos de consultas SQL para filtrar, buscar e extrair informações específicas do banco de dados `sucos_vendas_db` usando diversos operadores e lógicas.
* **Conceitos Demonstrados:**
    * Seleção de colunas (`SELECT`) e uso de apelidos (`AS`).
    * Filtragem de registros com `WHERE`.
    * Operadores de comparação (`=`, `>`, `<`, `>=`, `<=`, `BETWEEN`).
    * Operadores lógicos (`AND`, `OR`, `NOT`).
    * Operador `IN` para listar múltiplos valores.
    * Operador `LIKE` e o curinga `%` para busca por padrões.
    * Compreensão e aplicação de lógica booleana em consultas.
* **Acessar Scripts:** Veja os arquivos na pasta [`consultas-avancadas-aula2/sql/`](https://github.com/Giane10/meu-portfolio-sql-mysql/tree/main/consultas-avancadas-aula2/sql/).
---

#### 1.3. Apresentação dos Dados de uma Consulta 
* **Propósito:** Este módulo explora técnicas essenciais para apresentar e manipular os resultados de consultas SQL, incluindo ordenação, limitação de resultados, eliminação de duplicatas e agrupamento de dados com condições.
* **Conceitos Demonstrados:**
    * Ordenação de resultados (`ORDER BY` com `ASC`/`DESC`).
    * Limitação do número de registros (`LIMIT`).
    * Remoção de duplicatas (`DISTINCT`).
    * Agrupamento de dados (`GROUP BY`).
    * Filtragem de grupos (`HAVING`).
    * Expressões condicionais em consultas (`CASE`).
    * Funções de agregação (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).
* **Acessar Scripts:** Veja os arquivos na pasta [`apresentacao-dados-consultas/sql/`](https://github.com/Giane10/meu-portfolio-sql-mysql/tree/main/apresentacao-dados-consultas/sql/).
---

#### 1.4. Juntando Tabelas e Consultas 
* **Propósito:** Este módulo aprofunda a capacidade de combinar dados de múltiplas tabelas e utilizar subconsultas para análises mais complexas, além de introduzir o conceito de Views para simplificar e organizar consultas.
* **Conceitos Demonstrados:**
    * Junções (`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `CROSS JOIN`).
    * Simulação de `FULL OUTER JOIN` com `UNION`.
    * Combinação de resultados (`UNION`, `UNION ALL`).
    * Subconsultas (`IN`, `EXISTS`, subconsultas no `SELECT` e `FROM`).
    * Criação e uso de Views (`CREATE VIEW`, `SELECT FROM VIEW`).
* **Acessar Scripts:** Veja os arquivos na pasta [`juntando-tabelas-consultas/sql/`](https://github.com/Giane10/meu-portfolio-sql-mysql/tree/main/juntando-tabelas-consultas/sql/).
---

#### 1.5. Funções do MySQL 💡
* **Propósito:** Este módulo explora a vasta gama de funções built-in do MySQL para manipulação e formatação de dados. Ele demonstra como usar funções de string, matemática, data e conversão para transformar e processar informações diretamente nas consultas.
* **Conceitos Demonstrados:**
    * Funções de String (`UPPER`, `LOWER`, `SUBSTRING`, `CONCAT`, `LENGTH`, `TRIM`).
    * Funções Matemáticas (`ROUND`, `CEIL`, `FLOOR`, `POWER`, `SQRT`).
    * Funções de Data e Hora (`CURDATE`, `NOW`, `YEAR`, `MONTH`, `DAY`, `DATEDIFF`, `DATE_ADD`, `DATE_SUB`, `DATE_FORMAT`).
    * Funções de Conversão de Dados (`CAST`, `CONVERT`).
    * Aplicação prática de funções em diversos cenários de consulta.
* **Acessar Scripts:** Veja os arquivos na pasta [`funcoes-mysql/sql/`](https://github.com/Giane10/meu-portfolio-sql-mysql/tree/main/funcoes-mysql/sql/).
---
  
