delimiter $$

create function generar_rfc(
    nombre varchar(50),
    ap_paterno varchar(50),
    ap_materno varchar(50),
    fecha_nac date
)
returns varchar(10)
deterministic
begin
    declare c_ap_pat varchar(2);
    declare c_ap_mat varchar(1);
    declare c_nombre varchar(1);
    declare fec_rfc varchar(6);
    declare rfc_generado varchar(10);

    set c_ap_pat = substring(ap_paterno, 1, 2);
    
    if ap_materno is null or ap_materno = '' then
        set c_ap_mat = 'X';
    else
        set c_ap_mat = substring(ap_materno, 1, 1);
    end if;

    set c_nombre = substring(nombre, 1, 1);
    set fec_rfc = date_format(fecha_nac, '%y%m%d');

    set rfc_generado = concat(c_ap_pat, c_ap_mat, c_nombre, fec_rfc);

    return rfc_generado;
end $$

delimiter ;