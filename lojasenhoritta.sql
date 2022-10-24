/*
	Database - Loja Senhoritta
    @author Pamella Pereto
    @version 1.0
*/

create database lojasenhoritta;

show databases;

use lojasenhoritta;

-- Unique (não permitir valores duplicados)
create table usuarios(
	idusu int primary key auto_increment,
    usuario varchar(50) not null,
    login varchar(15) not null unique,
    senha varchar(255) not null,
    perfil varchar(10) not null
);

describe usuarios;

-- Para inserir uma senha com criptografia usa-se md5()
insert into usuarios(usuario,login,senha,perfil)
values('Administrador','admin',md5('admin'),'admin');

select * from usuarios;


create table fornecedores(
idfor int primary key auto_increment,
cnpj varchar(18) not null unique,
ie varchar(18) unique,
im varchar(18) unique,
razao varchar(100) not null,
fantasia varchar(100) not null,
site varchar(80),
redesocial varchar (60),
fone varchar(20) not null,
contato varchar(20),
email varchar(50),
cep varchar(9) not null,
endereco varchar(60) not null,
numero varchar(10) not null,
complemento varchar(50),
bairro varchar(50) not null,
cidade varchar(50) not null,
uf char(2) not null,
obs varchar(255)
);


describe fornecedores;

insert into  fornecedores (cnpj, razao,fantasia,fone,cep,endereco,numero,bairro,cidade,uf)
values ('99.152.736/0001-33','Roberta Campos','Arazze','(11) 92621-6085','03728-000','Rua São José do Campestre','390','Jardim Danfer','São Paulo','SP');


select * from fornecedores;

create table produtos(
	codigo int primary key auto_increment,
    barcode varchar(45),
    produto varchar(60) not null,
    cor varchar(30) not null,
    tamanho varchar(10) not null,
    estampa varchar(20) not null,
    descricao text not null,
    categoria varchar(255) not null,
    fabricante varchar(100) not null,    
    datacad timestamp default current_timestamp not null,
    iniciovenda timestamp not null,
    datavendido timestamp not null,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(30) not null,
    setor varchar(100),
    custo decimal(10,2) not null,
    lucro decimal(10,2) not null,
    foto1 varchar(255),
    foto2 varchar(255),
    foto3 varchar(255),
    foto4 varchar(255),
    idfor int not null,
	foreign key (idfor) references fornecedores (idfor)
    );
    

describe produtos;
    

select * from produtos;

create table clientes (
 idcli int primary key auto_increment,
 login varchar(30) not null unique,
 senha varchar(255) not null,
 nome varchar (100) not null,
 fone varchar(20) not null,
 cpf varchar(15) not null unique,
email varchar(50) unique not null,
marketing char(3) not null,
datanascimento timestamp,
foto varchar(255) default "usuario.jpg",
cep varchar(9),
endereco varchar(60),
bairro varchar(50),
numero varchar(10),
complemento varchar(50),
cidade varchar(50),
uf char(2)
);


describe clientes;


create table pedidos (
idpedido int primary key auto_increment,
dataped timestamp default current_timestamp,
situacao enum('Pendente', 'Finalizado', 'Cancelado') not null,
idcli int not null,
foreign key (idcli) references clientes(idcli)
);

describe pedidos;

select * from pedidos;

create table itenspedido (
	iditenspedido int not null,
	idpedido int not null,
    codigo int not null,
    quantidade int not null,
    foreign key(idpedido) references pedidos(idpedido),
    foreign key(codigo) references produtos(codigo)
);

describe itenspedido;

select * from itenspedido;


create table carrinho (
idcarrinho int primary key auto_increment,
idcli int not null,
chavecarrinho varchar(100) not null,
codigo int not null,
nomeproduto varchar(100) not null,
quantidade int not null default 0,
preco decimal (10,2) not null default 0.00,
subtotal decimal (10,2) not null default 0.00
);

describe carrinho;

select * from carrinho;