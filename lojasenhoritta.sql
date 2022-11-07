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
    estampa varchar(20),
    descricao text not null,
    categoria varchar(50) not null,
    fabricante varchar(100) not null,    
    datacad timestamp default current_timestamp not null,
    iniciovenda timestamp not null,
    datavendido timestamp,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(30) not null,
    setor varchar(100),
    custo decimal(10,2) not null,
    lucro decimal(10,2) not null,
    venda decimal(10,2),
    foto1 varchar(255),
    foto2 varchar(255),
    foto3 varchar(255),
    foto4 varchar(255),
    idfor int not null,
	foreign key (idfor) references fornecedores (idfor)
    );


describe produtos;
    
    
insert into produtos (produto, cor, tamanho, descricao, categoria, fabricante, iniciovenda, estoque, estoquemin, unidade, custo, lucro, idfor)
values ("Blusa", "azul", "P", "Decote trabalhando em renda", "blusas", "Arazze", 20221105, 10, 5, "PÇ", 10.00, 100, 1);

insert into produtos (produto, cor, tamanho, descricao, categoria, fabricante, iniciovenda, estoque, estoquemin, unidade, custo, lucro, venda, foto1, foto2, foto3, foto4, idfor)
values ("Blusa", "azul", "M", "Amarração nas costas", "blusas", "Arazze", 20221106, 20, 8, "PÇ", 15.00, 100, 30.00, "https://img.ltwebstatic.com/images3_pi/2022/07/15/1657874703d3cae722d186c201e90dafdb5c3ae213_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/07/15/16578747000185408982dbfe69cfad42913bb99763_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/07/15/16578747081b30fca8acd829fce5e7de1caef595eb_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/07/15/16578747069ff989a0722774dbcae975eaeb5a5e14_thumbnail_600x.webp", 1);

insert into produtos (produto, cor, tamanho, descricao, categoria, fabricante, iniciovenda, estoque, estoquemin, unidade, custo, lucro, venda, foto1, foto2, foto3, foto4, idfor)
values ("Saia", "preto", "M", "Cintura alta, com uma pequena fenda", "saias", "Arazze", 20221106, 8, 3, "PÇ", 13.00, 100, 26.00, "https://img.ltwebstatic.com/images3_pi/2022/05/30/1653875123a11ef532b89790acf25488ce3b341b39_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/05/30/165387512117c6881d9687ec403e07e648455380b4_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/05/30/1653875118d0b22032dd6da7e7c76e57ebb6f43cba_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/05/30/16538751151c8face1cac3dae6b313e48c3827c7aa_thumbnail_600x.webp", 1);

insert into produtos (produto, cor, tamanho, descricao, categoria, fabricante, iniciovenda, estoque, estoquemin, unidade, custo, lucro, venda, foto1, foto2, foto3, foto4, idfor)
values ("Calça pantalona", "preto", "M", "Calça com botão na frente e zíper com cinto, tecido alfaiataria", "calças", "Arazze", 20221106, 18, 9, "PÇ", 40.00, 100, 80.00, "https://img.ltwebstatic.com/gspCenter/goodsImage/2022/8/20/8046863309_1006933/5A232AD5F1937BAE2512F4A87229373D_thumbnail_600x.jpg", "https://img.ltwebstatic.com/gspCenter/goodsImage/2022/8/20/8046863309_1006933/25BC2EB74F14435B08077A0ABC905A2E_thumbnail_600x.jpg", "https://img.ltwebstatic.com/gspCenter/goodsImage/2022/8/20/8046863309_1006933/E3422CDC6845B79E420847F00A1A5055_thumbnail_600x.jpg", "https://img.ltwebstatic.com/gspCenter/goodsImage/2022/8/20/8046863309_1006933/6BE770BF15ED911C8A164F992F57D921_thumbnail_600x.jpg", 1);

insert into produtos (produto, cor, tamanho, descricao, categoria, fabricante, iniciovenda, estoque, estoquemin, unidade, custo, lucro, venda, foto1, foto2, foto3, foto4, idfor)
values ("Vestido florido", "azul", "P", "Vestido com fenda na coxa, estampa tropical", "vestidos", "Arazze", 20221106, 11, 6, "PÇ", 75.00, 100, 150.00, "https://img.ltwebstatic.com/images3_pi/2022/04/14/1649944903f423817e330afa29664d00d1ca8d9275_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/04/14/16499449059a335f9060f67182363d8cf18541e48b_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/04/14/164994490666b9d43c2a16ceed172827c65361b8e5_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2022/04/14/16499449081cde8b638b667a7ec504d98679775209_thumbnail_600x.webp", 1);

insert into produtos (produto, cor, tamanho, descricao, categoria, fabricante, iniciovenda, estoque, estoquemin, unidade, custo, lucro, venda, foto1, foto2, foto3, foto4, idfor)
values ("Macacão florido", "preto", "M", "Macacão com bolso em estampa floral", "macacoes", "Arazze", 20221106, 7, 3, "PÇ", 55.00, 100, 105.00, "https://img.ltwebstatic.com/images3_pi/2021/06/08/16231229519366dc1bdd66959d27d5c77e5f926050_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2021/06/08/1623122954b683083f97ad64956b7644ff0eef017f_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2021/06/08/162312295805564ae49a25d304581285ecc3055983_thumbnail_600x.webp", "https://img.ltwebstatic.com/images3_pi/2021/06/08/16231229610520e848b3f3da34be35e76ddeae4016_thumbnail_600x.webp", 1);

select * from produtos;



create table clientes (
 idcli int primary key auto_increment,  1
 login varchar(30) unique,  2
 senha varchar(255),  3
 nome varchar (100) not null, 4 
 fone varchar(20) not null,  5
 cpf varchar(15) not null unique, 6
email varchar(50) unique not null, 7
marketing char(3) not null, 8
datanascimento timestamp, 9
foto varchar(255) default "usuario.jpg", 10
cep varchar(9), 11
endereco varchar(60), 12
bairro varchar(50), 13
numero varchar(10), 14
complemento varchar(50), 15
cidade varchar(50), 16
uf char(2) 17
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
