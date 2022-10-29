/*
	View para localizar alunos bolsistas, apresentando nome, cpf (padronizado), patente, sexo, telefone, endereço e localização de onde reside (cidade, estado, país). 
*/

create view localizacaoBolsista as
select u.nome, concat(substring(u.cpf, 1, 3), '.', substring(u.cpf, 4, 3), '.', substring(u.cpf, 7, 3), '-', substring(u.cpf, 10, 2)) as cpf,
p.nome as patente, s.sexualidade as sexo, u.telefone, u.endereco, concat(c.nome, ", ", e.nome, ", ", pa.nome) as localReside 
from usuario as u
	inner join patente as p
	on u.patente_id = p.id
	inner join cidade as c
	on u.cidade_id = c.id
	inner join sexo as s
	on u.sexo_id = s.id
	inner join estado as e
	on c.estado_id = e.id
	inner join pais as pa
	on e.pais_id = pa.id
    where p.nome = 'Aluno Bolsista';

select *from localizacaoBolsista;
