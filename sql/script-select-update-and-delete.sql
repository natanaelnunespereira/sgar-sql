use refeitorio;

-- select
select * from registro;

select id, numeroCartao from cartao order by id desc;

select distinct cartao_id from registro;

select * from usuario where nome like '%v%a%' limit 2;

select * from registro where cartao_id is null;

select id,nome,email from usuario where id in(34,13,3,8,9,22) order by id desc; 

select id,nome from cidade where id between 2 and 8;

select max(id),min(id) from estado;

select * from estado where id = 20;

select count(*) from pais;

-- insert into sexo values(null, 'Ninguém');

select usuario.id,usuario.nome,sexo.sexualidade from usuario left join sexo on usuario.sexo_id = sexo.id order by usuario.id;

select usuario.id,usuario.nome,sexo.sexualidade from usuario right join sexo on usuario.sexo_id = sexo.id order by usuario.id;

select registro.entrada, registro.saida, cartao.id, usuario.nome from cartao inner join registro on registro.cartao_id = cartao.id left join usuario on cartao.usuario_id = usuario.id;

select usuario.id, usuario.nome, cidade.nome, estado.nome from
usuario left join cidade on usuario.cidade_id = cidade.id
inner join estado on cidade.estado_id = estado.id;

select usuario.id, usuario.nome, cidade.nome, estado.nome from
usuario left join cidade on usuario.cidade_id = cidade.id
inner join estado on cidade.estado_id = estado.id and estado.nome = 'Goiás';

select registro.entrada, registro.saida, cartao.id, usuario.nome from
cartao inner join registro on registro.cartao_id = cartao.id
left join usuario on cartao.usuario_id = usuario.id;

-- insert into patente values(null, 'Ninguém', 20.00);
-- select * from patente;
select patente.nome, usuario.nome from usuario right join patente on usuario.patente_id = patente.id;

-- insert into patente values(null,'Ninguem',20.00);

-- select * from patente;

select patente.nome,usuario.nome from usuario right join patente on usuario.patente_id=patente.id;

-- update

update usuario set nome='João Cleber Paraaaa' where id = 5;

update usuario set nome='João Cleber' where nome like '%João Cleber%';

update passe set validade='2019-11-16 13:21:07' where id = 3;

update registro set id =101 where id =6;

update cartao set valor=5.5 where id =8;

-- delete

delete from registro where id = 4;

delete from registro where cartao_id=2;

delete from cartao where id=2;

delete from registro where passe_id=4;

delete from passe where id=4;

