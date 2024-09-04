drop database redes_sociais;
create database redes_sociais;
use redes_sociais;

create table usuarios(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    email varchar(100) not null unique,
    data_de_criacao date not null
);

create table postagens(
	id int not null auto_increment primary key,
	texto varchar(255) not null,
	data_de_publicacao date not null,
	imagem varchar(255),
	usuarios_id int not null,
    foreign key (usuarios_id) references usuarios (id)
);

create table comentarios(
	id int not null auto_increment primary key,
	texto varchar(100) not null,
	data_de_criacao date not null,
	usuarios_id int not null,
    postagens_id int not null,
    foreign key (usuarios_id) references usuarios (id),
    foreign key (postagens_id) references postagens (id)
);


create table curtidas(
	postagens_id int not null,
    usuarios_id int not null, 
	primary key (postagens_id , usuarios_id),
    foreign key (postagens_id) references postagens (id),
    foreign key (usuarios_id) references usuarios (id)
);

insert into usuarios ( nome, email, data_de_criacao) values ('João','joao@senai.com', "2024-08-09" );
insert into usuarios ( nome, email, data_de_criacao) values ('Eduardo','edu@senai.com', "2024-07-12" );
insert into usuarios ( nome, email, data_de_criacao) values ('Richard','richard@senai.com', "2024-05-29" );
insert into usuarios ( nome, email, data_de_criacao) values ('Guilherme','gui@senai.com', "2024-10-04" );
insert into usuarios ( nome, email, data_de_criacao) values ('Matheus','matheus@senai.com', "2024-03-24" );
select * from usuarios;
select * from postagens;
select * from curtidas;

insert into postagens (texto, data_de_publicacao, usuarios_id) values ('Hoje é meu primeiro dia na faculdade', "2024-09-14", 3);
insert into curtidas (postagens_id, usuarios_id) values (1, 3);
insert into comentarios (texto, data_de_criacao, usuarios_id, postagens_id) values ('Finalmente facul', "2024-09-14", 2, 3);





