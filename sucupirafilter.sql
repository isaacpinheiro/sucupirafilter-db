create database sucupirafilter;
use sucupirafilter;

create table area_avaliacao(
    id serial,
    nome varchar(255),
    codigo varchar(255),
    primary key(id)
);

create table area_conhecimento(
    id serial,
    nome varchar(255),
    codigo varchar(255),
    area_avaliacao_id bigint unsigned,
    constraint fk_area_conhecimento_area_avaliacao_id foreign key (area_avaliacao_id) references area_avaliacao(id),
    primary key(id)
);

create table instituicao(
    id serial,
    nome varchar(255),
    codigo varchar(255),
    acronimo varchar(255) unique,
    endereco text,
    distrito varchar(255),
    cidade varchar(255),
    estado varchar(255),
    tipo varchar(255),
    cep varchar(255),
    caixa_postal varchar(255),
    url varchar(255),
    coordenandas varchar(255),
    primary key(id)
);

create table programa(
    id serial,
    nome varchar(255),
    codigo varchar(255),
    uf varchar(255),
    area_conhecimento_id bigint unsigned,
    constraint fk_programa_area_conhecimento_id foreign key (area_conhecimento_id) references area_conhecimento(id),
    instituicao_id bigint unsigned,
    constraint fk_programa_instituicao_id foreign key (instituicao_id) references instituicao(id),
    primary key(id)
);

create table curso(
    id serial,
    nome varchar(255),
    situacao varchar(255),
    nivel varchar(255),
    nota_curso varchar(255),
    data_recomendacao varchar(255),
    data_inicio varchar(255),
    programa_id bigint unsigned,
    constraint fk_curso_programa_id foreign key (programa_id) references programa(id),
    primary key(id)
);

