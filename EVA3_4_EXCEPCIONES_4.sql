delimiter $$

create procedure insertar_prueba(clave int)
begin 
	
    declare exit handler for SQLSTATE "23000"
    begin
		select "Error: Clave Duplicada" as mensaje_error;
    end ;
    
	insert into prueba2 value(clave);
    select "Clave insertada correctamente" as mensaje;
end $$    
delimiter ;