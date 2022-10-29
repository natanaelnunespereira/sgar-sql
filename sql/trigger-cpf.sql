use refeitorio;

DELIMITER $
create trigger triggervalidacpf
before insert on usuario for each row
begin
	IF validarcpf(new.cpf)=0 THEN
    SIGNAL SQLSTATE VALUE '45000'
			    SET MESSAGE_TEXT = '[TABELA: USUÁRIO] - O Cpf é inválido';
    END IF;
END$
DELIMITER ;
