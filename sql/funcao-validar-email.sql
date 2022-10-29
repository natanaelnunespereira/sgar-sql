
DELIMITER $$
CREATE FUNCTION validaremail (email VARCHAR(40))
RETURNS int
BEGIN
    if email LIKE '%_@_%_.__%'
    AND email NOT LIKE '%_@@_%_.__%' then
    return true;
    else
    return false;
	end if;
END;
