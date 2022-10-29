DELIMITER $
CREATE FUNCTION validarcpf (cpf bigint(11) zerofill)
RETURNS INT
BEGIN
	DECLARE soma INT;
	DECLARE i INT;
    DECLARE cont int;
	DECLARE digito_verificador1  int(1);
    DECLARE digito_verificador2  int(1);
    SET digito_verificador1 = substring(cpf,10,1);
    SET digito_verificador2 = substring(cpf,11,1);
    
	IF (cpf IN ('00000000000', '11111111111', '22222222222', '33333333333', '44444444444', '55555555555', '66666666666', '77777777777', '88888888888', '99999999999') or length(cpf) > 11) THEN
		RETURN FALSE;
	ELSE
		SET soma = 0;
		SET i=1;
		SET cont=10;
		WHILE i < 10 DO
			-- substring seleciona um caracter a partir de uma posiÃ§Ã£o  
			SET soma = soma+substring(cpf, i, 1)*cont;
			SET cont=cont-1;
			SET i=i+1;
		END WHILE;
		SET soma = MOD(soma*10, 11);
           IF soma = 10 THEN
			SET soma = 0;
		END IF;
		IF soma != digito_verificador1 THEN
			RETURN FALSE;
		ELSE
			SET soma = 0;
			SET i=1;
			SET cont=11;
			WHILE i < 11 DO
				-- substring seleciona um caracter a partir de uma posiÃ§Ã£o  
				SET soma = soma+substring(cpf, i, 1)*cont;
				SET cont=cont-1;
				SET i=i+1;
			END WHILE;
               SET soma = MOD(soma*10, 11);
			IF soma = 10 THEN
				SET soma = 0;
			END IF;
			IF soma != digito_verificador2 THEN
				RETURN FALSE;
			ELSE
				RETURN TRUE;
			END IF;
		END IF;
	END IF;
END$
DELIMITER ;
