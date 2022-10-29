-- REGISTRO DIÁRIO
create view registroDiario as select patente.nome as 'Patente', usuario.nome as 'Usuário', 
date_format(registro.entrada, '%d/%m/%Y') as 'Data de Entrada', date_format(registro.saida, '%d/%m/%Y') as 'Data de Saída'
from registro
inner join cartao on registro.cartao_id = cartao.id
left join usuario on cartao.usuario_id = usuario.id
left join patente on usuario.patente_id = patente.id
where day(registro.entrada) = day(curdate());

drop view registroDiario;
select * from registroDiario;


-- REGISTRO MENSAL
create view registroMensal as select patente.nome as 'Patente', usuario.nome as 'Usuário', 
date_format(registro.entrada, '%d/%m/%Y') as 'Data de Entrada', date_format(registro.saida, '%d/%m/%Y') as 'Data de Saída'
from registro
inner join cartao on registro.cartao_id = cartao.id
left join usuario on cartao.usuario_id = usuario.id
left join patente on usuario.patente_id = patente.id
where month(registro.entrada) = month(curdate());

drop view registroMensal;
select * from registroMensal;


-- REGISTRO MENSAL POR USUÁRIO
create view registroUserMensal as select usuario.nome as 'Usuário', 
date_format(registro.entrada, '%d/%m/%Y') as 'Data de Entrada', date_format(registro.saida, '%d/%m/%Y') as 'Data de Saída'
from registro
inner join cartao on registro.cartao_id = cartao.id
left join usuario on cartao.usuario_id = usuario.id where usuario.nome = 'Dinei';

drop view registroUserMensal;
select * from registroUserMensal;
