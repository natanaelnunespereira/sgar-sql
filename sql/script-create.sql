create database refeitorio;

use refeitorio;

-- 1 (Visitante), 2 (Aluno Técnico), 3 (Aluno Técnico Integrado), 4 (Aluno Graduação), 5 (Aluno Bolsista), 6 (Servidores).
create table patente(
	id int auto_increment,
    nome varchar(30) not null unique,
    preco decimal(4,2) not null,
    primary key(id)
);

create table pais(
	id int(11),
    nome varchar(60) not null,
    nome_pt varchar(60),
    sigla varchar(2),
    bacen int(5) not null unique,
    primary key(id)
);

create table estado(
	id int(11),
    nome varchar(75) not null,
    uf varchar(2) unique,
    ibge int(2) unique,
    pais_id int(11) not null,
    ddd varchar(50),
	primary key(id),
	constraint foreign key(pais_id) references pais(id)
);

create table cidade(
	id int(11),
    nome varchar(120) not null,
    estado_id int not null,
    ibge int(7),
	primary key(id),
	constraint foreign key(estado_id) references estado(id)
);

-- 1 (Masculino), 2 (Feminino), ... , N (Outro).
create table sexo(
	id int auto_increment,
	sexualidade varchar(20) not null unique,
    primary key(id)
);

create table usuario(
	id int auto_increment,
    patente_id int not null,
    identificacaoEscolar bigint(16) unique,
    nome varchar(60) not null,
    cpf bigint(11) zerofill not null unique,
    rg varchar(30) not null,
    tituloEleitoral bigint(12) zerofill unique,
    dataNasc date not null,
    email varchar(40) not null unique,
    senha varchar(255) not null,
    cidade_id int not null,
    endereco varchar(60),
    telefone bigint(11),
    sexo_id int not null,
    nomePai varchar(60),
    nomeMae varchar(60),
    primary key(id),
    constraint foreign key(patente_id) references patente(id),
    constraint foreign key(cidade_id) references cidade(id),
    constraint foreign key(sexo_id) references sexo(id)
);

create table passe(
	id int auto_increment,
    dataCompra timestamp not null,
    validade datetime not null,
    primary key(id)
);

create table cartao(
	id int auto_increment,
    numeroCartao int zerofill unique not null,
    usuario_id int not null unique,
    valor decimal(10,2) not null,
    validade datetime not null,
    primary key(id),
    constraint foreign key(usuario_id) references usuario(id)
);

create table registro(
	id int auto_increment,
    passe_id int unique,
    cartao_id int,
    entrada timestamp not null,
    saida timestamp null,
    primary key(id),
    constraint foreign key(passe_id) references passe(id),
    constraint foreign key(cartao_id) references cartao(id)
);

create table usuarioLog(
	idAlteracao int auto_increment,
    userAlteracao varchar(50) not null,
    tipoAlteracao varchar(10) not null,
    dataHoraAlteracao timestamp not null,
    id_usuario int not null,
    campoAlterado varchar(20) not null,
    valorAnterior varchar(255),
    valorAtual varchar(255),
    primary key (idAlteracao)
);
