delimiter $$
create procedure division (in val1 int, in val2 int)
begin

	declare resu decimal(10,2);
	declare continue handler for SQLSTATE "22012"
    begin
		select "Error: Division entre 0 no permitida" as mensaje;
        set resu = null;
    end ;
    
    set resu = val1/val2;
    select resu as resu_fin;
end$$

delimiter ;