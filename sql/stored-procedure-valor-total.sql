/*
	Pocedure para calcular o valor total que uma quantidde de indivíduos com uma determinada patente pagará;
    Primeiro é passado o id da patente e depois a quantidade. Logo, é mostrado o valor total.
*/

delimiter $$
create procedure valorTotal(in id int, in qnt int)
begin
	declare total decimal(10,2) default 0;
    if id = 1 or id = 6 then
		set total = qnt*5.00;
	else if id = 4 then
		set total = qnt*2;
	end if;
    end if;
	select total as 'Valor total';
end $$
delimiter ;

call valorTotal(4, 1543);
