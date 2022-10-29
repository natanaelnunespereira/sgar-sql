DELIMITER $

create function returnSexualidades()
returns varchar(255)
begin
	declare finalText varchar(255);
    declare count int;
    declare max int;
    set finalText = "Sexualidades cadastradas: ";
    set count = 1;
    set max = (select count(id) from sexo);
    
    while count <= max do
		set finalText = concat(finalText, (select sexualidade from sexo where id = count));
        if count < max then
			set finalText = concat(finalText, ", ");
        end if;
        set count = count + 1;
    end while;
    
    return finalText;
end$

DELIMITER ;

select returnSexualidades();
drop function returnSexualidades;
