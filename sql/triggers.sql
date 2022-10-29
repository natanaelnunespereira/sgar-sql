DELIMITER $

create procedure insertDadosUsuarioLog(userAlteracao varchar(50), tipoAlteracao varchar(10),
	idUsuario int,
	oldPatente_id int, newPatente_id int,
    oldIdentificacaoEscolar bigint(16), newIdentificacaoEscolar bigint(16),
    oldNome varchar(60), newNome varchar(60),
    oldCpf bigint(11) zerofill, newCpf bigint(11) zerofill,
    oldRg varchar(30), newRg varchar(30),
    oldTituloEleitoral bigint(12) zerofill, newTituloEleitoral bigint(12) zerofill,
    oldDataNasc date, newDataNasc date,
    oldEmail varchar(40), newEmail varchar(40),
    oldSenha varchar(255), newSenha varchar(255),
    oldCidade_id int, newCidade_id int,
    oldEndereco varchar(60), newEndereco varchar(60),
    oldTelefone bigint(11), newTelefone bigint(11),
    oldSexo_id int, newSexo_id int,
    oldNomePai varchar(60), newNomePai varchar(60),
    oldNomeMae varchar(60), newNomeMae varchar(60))
begin
	declare dataHora datetime;
    set dataHora = current_timestamp();
    
	if(oldPatente_id != newPatente_id or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "patente_id", oldPatente_id, newPatente_id);
    end if;
    if(oldIdentificacaoEscolar != newIdentificacaoEscolar or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "identificacaoEscolar", oldIdentificacaoEscolar, newIdentificacaoEscolar);
    end if;
    if(oldNome != newNome or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "nome", oldNome, newNome);
    end if;
    if(oldCpf != newCpf or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "cpf", oldCpf, newCpf);
    end if;
    if(oldRg != newRg or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "rg", oldRg, newRg);
    end if;
    if(oldTituloEleitoral != newTituloEleitoral or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "tituloEleitoral", oldTituloEleitoral, newTituloEleitoral);
    end if;
    if(oldDataNasc != newDataNasc or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "dataNasc", oldDataNasc, newDataNasc);
    end if;
    if(oldEmail != newEmail or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "email", oldEmail, newEmail);
    end if;
    if(oldSenha != newSenha or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "senha", oldSenha, newSenha);
    end if;
    if(oldCidade_id != newCidade_id or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "cidade_id", oldCidade_id, newCidade_id);
    end if;
    if(oldEndereco != newEndereco or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "endereco", oldEndereco, newEndereco);
    end if;
    if(oldTelefone != newTelefone or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "telefone", oldTelefone, newTelefone);
    end if;
    if(oldSexo_id != newSexo_id or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "sexo_id", oldSexo_id, newSexo_id);
    end if;
    if(oldNomePai != newNomePai or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "nomePai", oldNomePai, newNomePai);
    end if;
    if(oldNomeMae != newNomeMae or tipoAlteracao = "Insert" or tipoAlteracao = "Delete") then
		insert into usuarioLog values(null, userAlteracao, tipoAlteracao, dataHora, idUsuario, "nomeMae", oldNomeMae, newNomeMae);
    end if;
end$

create trigger triggerInsertUsuarioLog
after insert on usuario for each row
begin
	call insertDadosUsuarioLog(session_user(), "Insert",
		new.id,
		null, new.patente_id,
        null, new.identificacaoEscolar,
        null, new.nome,
        null, new.cpf,
        null, new.rg,
        null, new.tituloEleitoral,
        null, new.dataNasc,
        null, new.email,
        null, new.senha,
        null, new.cidade_id,
        null, new.endereco,
        null, new.telefone,
        null, new.sexo_id,
        null, new.nomePai,
        null, new.nomeMae
    );
end$

create trigger triggerUpdateUsuarioLog
after update on usuario for each row
begin
	call insertDadosUsuarioLog(session_user(), "Update",
		old.id,
		old.patente_id, new.patente_id,
        old.identificacaoEscolar, new.identificacaoEscolar,
        old.nome, new.nome,
        old.cpf, new.cpf,
        old.rg, new.rg,
        old.tituloEleitoral, new.tituloEleitoral,
        old.dataNasc, new.dataNasc,
        old.email, new.email,
        old.senha, new.senha,
        old.cidade_id, new.cidade_id,
        old.endereco, new.endereco,
        old.telefone, new.telefone,
        old.sexo_id, new.sexo_id,
        old.nomePai, new.nomePai,
        old.nomeMae, new.nomeMae
    );
end$

create trigger triggerDeleteUsuarioLog
after delete on usuario for each row
begin
	call insertDadosUsuarioLog(session_user(), "Delete",
		old.id,
		old.patente_id, null,
        old.identificacaoEscolar, null,
        old.nome, null,
        old.cpf, null,
        old.rg, null,
        old.tituloEleitoral, null,
        old.dataNasc, null,
        old.email, null,
        old.senha, null,
        old.cidade_id, null,
        old.endereco, null,
        old.telefone, null,
        old.sexo_id, null,
        old.nomePai, null,
        old.nomeMae, null
    );
end$

DELIMITER ;
