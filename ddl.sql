DROP TABLE IF EXISTS categoria; 
DROP TABLE IF EXISTS ingrediente;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS receita;
DROP TABLE IF EXISTS busca;
DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(45) NOT NULL unique,
  token VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS busca (
	id INT AUTO_increment primary key, 
    valor varchar(100) not null, 
    usuario int not null, 
    constraint fk_busca_usuario_usuario_id
		foreign key (usuario)
        references usuario(id)
);

create table if not exists receita ( 
	id int auto_increment primary key, 
    nome varchar(60) not null,
    preparo text not null 
);

create table if not exists produto (
	id int auto_increment primary key,
    nome varchar(30) not null
);

create table if not exists ingrediente (
	id int auto_increment primary key,
    receita int not null,
    produto int not null,
    medida varchar(20) not null,
    quantidade int not null,
    constraint fk_ingrediente_receita_receita_id
		foreign key (receita)
        references receita(id),
    constraint fk_produto_receita_produto_id
		foreign key (produto)
        references produto(id)
);

create table if not exists categoria (
	id int auto_increment primary key,
    nome varchar(45) not null,
    receita int not null,
	constraint fk_categoria_receita_receita_id
		foreign key (receita)
        references receita(id)
);