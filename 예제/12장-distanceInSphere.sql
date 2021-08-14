DELIMITER ;;

CREATE DEFINER='root'@'localhost'
    FUNCTION distanceInSphere(p1_3857 POINT, p2_3857 POINT) RETURNS DOUBLE
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
    DECLARE p1_4326 POINT;
    DECLARE p2_4326 POINT;

    SET p1_4326 = convert3857To4326(p1_3857);
    SET p2_4326 = convert3857To4326(p2_3857);

    RETURN ST_Distance_Sphere(p1_4326, p2_4326, 6370986 /* Default Radius meters in MySQL server */);
END ;;

DELIMITER ;
