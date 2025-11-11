CREATE DEFINER=`root`@`localhost` TRIGGER `personas_BEFORE_INSERT` BEFORE INSERT ON `personas` FOR EACH ROW BEGIN
	declare cal_rfc varchar(10);
    set cal_rfc = generar_rfc(new.nombre, new.ap_paterno, new.ap_materno, new.fecha_nac);
    set new.rfc = cal_rfc;
END