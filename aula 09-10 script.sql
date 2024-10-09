drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

-- A sequencia das colunas podem ser alteradas
select valor, id, nome from pizzas;

-- Nome da coluna exibido na resposta do comando pode ser alterada com a cláusula as
select id as codigo, nome, valor as 'Valor R$' from pizzas;

-- Operações aritimieticas
select 10 + 3, 10 - 3, 10 / 3, 10 * 3;
select 10 + 3 as 'Soma' , 10 - 3 as 'Subtração', 10 / 3 as 'Divisão', 10 * 3 as 'Multiplicação';

select *, (valor/100)*10 + valor as '+10%' from pizzas;


alter table pizzas add column custo decimal(15,2);
update pizzas set custo = valor * 0.60;

select * from pizzas where valor > 17;

select * from pizzas where valor >= 17;

select * from pizzas where valor < 17;

select * from pizzas where valor <= 17;

-- diferente
select * from pizzas where valor != 17;
select * from pizzas where valor <> 17;

-- valor null
select * from pizzas where valor <=> null;
select * from pizzas where valor is null;

-- valores entre 15 20 e (AND ou &&), ou (OR ou ||) e não (NOT ou !)
select * from pizzas where valor > 15 and valor < 20;
select * from pizzas where valor between 16 and 19;

-- valores menores ou maiores que 17
select * from pizzas where valor < 17 or valor > 17;

-- valores nao menores ou maiores do que 17
select * from pizzas where not (valor < 17 or valor > 17);

-- selecionar valores na faixa de 17 e 20
select * from pizzas where valor >= 17 and valor <= 20;
select * from pizzas where valor between 17 and 20;

-- selecionar valores fora da faixa entre 17 e 20
select * from pizzas where valor <17 or valor > 20;
select * from pizzas where valor not between 17 and 20;
select * from pizzas where not (valor >=17 and valor <=20);

-- selecionar todas as pizzas com valores iguais a 15 e 20
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15,20);

-- selecionar valores de pizzas diferentes de 15 e 20:

select * from pizzas where valor != 15 and valor != 20;
select * from pizzas where valor not in (15,20);

-- selecionar todas as pizzas com valores nao nulos
select * from pizzas where valor is not null;
select * from pizzas where valor > 0;

-- selecionar todas as pizzas com nomes que comecem com a letra e
select * from pizzas where nome like 'e%';

-- selecionar todas as pizzas com nomes que terminem com a letra a
select * from pizzas where nome like '%a';

-- selecionar todas as pizzas com nomes que tenham as letras
select  * from pizzas where nome like '%l%';
select  * from pizzas where nome like '%esa%';

select * from pizzas order by nome asc;
select * from pizzas order by nome desc;

select * from pizzas order by valor desc, nome asc;

select * from pizzas;

select * from pizzas limit 2;
select * from pizzas order by valor desc limit 2;

select valor from pizzas order by 1;

select distinct valor from pizzas order by valor;

/* Funções de agregaçãoptimize
 Conhecidas como funções estatísticas, as funções de agregação obtêm
 Informação sobre conjuntos de linhas especificados
 AVG(coluna) Média dos valores da coluna
 COUNT Número de linhas
 MAX(coluna) Maior valor da coluna
 MIN(coluna) Menor valor da coluna
 SUM(coluna) Soma dos valores da coluna
 */
 
 select count(*) from pizzas;
 select count(nome) from pizzas;
 select count(valor) from pizzas;
 
 
select avg(valor) as media from pizzas;
select avg(valor) as media from pizzas where nome like '%esa';

-- Qual é o valor da pizza mais cara do cardápio da pizzaria?
select max(valor) as 'maior valor' from pizzas;
-- Qual é o valor da pizza mais barata do cardápio da pizzaria?
select min(valor) as 'manor valor' from pizzas;
-- Qual é o valor total do pedido número 7?
select sum(valor) from itens_pedido where pedido_id = 7;

select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;

select pedido_id as pedido, sum(valor) as 'valor pedido', sum(quantidade) as 'qtde pizzas',
avg(valor) as media, sum(valor) / sum(quantidade) as 'valor médio' from itens_pedido group by pedido_id;

-- INNER JOIN: Retorna registros quando há pelo menos uma correspondência em ambas as tabelas.
select * from clientes as c inner join pedidos as p on p.cliente_id = c.id;
select c.id, c.nome, p.id  as pedido from clientes as c inner join pedidos as p on p.cliente_id = c.id;

select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
inner join pedidos on pedidos.cliente_id = clientes.id;

select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
left join pedidos on pedidos.cliente_id = clientes.id;

select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes
right join pedidos on pedidos.cliente_id = clientes.id;

insert into pedidos(id, data, valor) values (9,'2024-10-02', 0);

select nome, telefone, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id group by nome, telefone;

-- quantos pedidos foram feitos no total?
select count(cliente_id) from pedidos;

-- quantos pedidos foram feitos pelo cliente com o nome alexandre santos


-- qual o valor total de todos os pedidos feitos ate agr?

select * from clientes;
select * from pedidos;


-- questão 1 Liste todos os pedidos com o nome do cliente correspondente
select pedidos.id as pedido, clientes.nome from pedidos inner join clientes on pedidos.cliente_id = clientes.id;

-- questão 2 Quantos pedidos foram feitos no total?
select count(cliente_id) from pedidos;

-- questão 3 Liste os pedidos feitos após '2016-12-15' com o nome do cliente
select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos inner join clientes on pedidos.cliente_id = clientes.id where data > '2016-12-15 23:59:59';

-- questão 4 Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"?
select pedidos.id  as pedido, clientes.nome from pedidos inner join clientes on  pedidos.cliente_id = clientes.id where nome = 'Alexandre Santos';
 
-- questão 5 Liste todos os pedidos e seus respectivos clientes, incluindo pedidos feitos por clientes que foram excluídos da tabela clientes.
select pedidos.id as pedido, clientes.nome from pedidos inner join clientes on pedidos.cliente_id = clientes.id;

-- questão 6  Qual o valor total de todos os pedidos feitos até agora?
select sum(valor) from itens_pedido;

-- questão 7 Qual o total gasto por cada cliente?
select clientes.id, telefone, nome, sum(valor) as 'total gasto' from pedidos right join clientes on clientes.id = cliente_id group by nome;

-- questão 8 Liste todos os clientes e seus pedidos feitos no mês de dezembro de 2016 (inclua clientes sem pedidos)
select clientes.nome, pedidos.id as pedido, pedidos.data, pedidos.valor from clientes 
inner join pedidos on pedidos.cliente_id = clientes.id where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';

-- questão 9 Qual o valor médio dos pedidos realizados?
select avg(valor) as media from pedidos;

-- questão 10 Liste o valor total dos pedidos por cliente, incluindo pedidos feitos por clientes que foram excluídos (nome aparecerá como NULL)
select clientes.id, clientes.nome, sum(pedidos.valor) as valor_total, count(pedidos.id) as total_pedidos from pedidos 
left join clientes on clientes.id = pedidos.cliente_id group by clientes.id, clientes.nome;

-- questão 11 Qual o valor do pedido mais caro registrado?
select max(valor) as 'maior valor' from pedidos;

-- questão 12 Qual o valor do pedido mais barato registrado?
select min(valor) as 'menor valor' from pedidos;

-- questão 13 Quantos pedidos cada cliente fez (mesmo que não tenham feito nenhum)?
select count(pedidos.id) as pedido, clientes.nome from pedidos inner join clientes on clientes.id = pedidos.cliente_id group by clientes.id, clientes.nome;

-- questão 14 Qual o pedido mais caro, exibir o nome do cliente e o valor do pedido

-- questão 15 Qual a média de pizzas por pedido e quantos pedidos foram feitos?
select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido;

-- questão 16 Qual o total de pizzas vendidas e o número de pedidos do cliente "Bruna Dantas"?
select sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id where clientes.nome = 'Bruna Dantas';

-- questão 17 Qual o pedido mais caro e o mais barato do cliente "Laura Madureira"?
select  clientes.nome, min(valor), max(valor) from pedidos inner join clientes on clientes.id = pedidos.cliente_id where nome = 'Laura Madureira';

-- questão 18 Quantas pizzas cada cliente comprou no total?
select clientes.nome, itens_pedido.quantidade from itens_pedido
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on pedidos.cliente_id = clientes.id
group by clientes.nome, itens_pedido.quantidade;

-- questão 19 Qual o pedido mais barato, exibir o nome do cliente e o valor do pedido.


-- questão 20 Liste todos os clientes, mesmo que não tenham feito pedidos, com seus respectivos pedidos (se houver)

-- questão 21 Liste todos os clientes com o valor total de seus pedidos (mesmo que não tenham feito pedidos)

-- questão 22 . Liste os 3 clientes que mais gastou, exibir nome do cliente e o valor gasto.
