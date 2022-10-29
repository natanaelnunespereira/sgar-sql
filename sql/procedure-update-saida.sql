delimiter //
create procedure updateSaida(in registroId int)
    begin 
        update registro set saida = current_timestamp() where saida is null and registro.id = registroId and date(entrada) = curdate();
    end//
delimiter ;

drop procedure saidaUser;
call saidaUser(1);