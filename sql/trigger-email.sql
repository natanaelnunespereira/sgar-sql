use refeitorio;

DELIMITER $$
create trigger triggervalidaemail
before insert on usuario for each row
begin
	IF validaremail(new.email)=0 THEN
    SIGNAL SQLSTATE VALUE '45001'
			    SET MESSAGE_TEXT = '[TABELA: USUÁRIO] - O e-mail é inválido';
    END IF;
    
END;
