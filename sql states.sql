/*
SELECT c.id id_country_origen, c.code code_pais, c.name_english name_pais,  c.phone_code
FROM intermediary_db.t074t_countries C
WHERE ID NOT IN (  SELECT ID_COUNTRY FROM intermediary_db.t075t_division_types )
;

SELECT * FROM intermediary_db.t074t_countries
WHERE ID NOT IN (  SELECT ID_COUNTRY FROM intermediary_db.t075t_division_types )
*/
SELECT c.id id_country_origen, c.code code_pais, c.name_english name_pais,  
c.phone_code, dt.id id_division_type_origen,  dt.name_english name_division_type, COUNT(s.id)
FROM t074t_countries c
INNER JOIN t075t_division_types dt ON c.id = dt.id_country
LEFT JOIN t076t_states s ON c.id = s.id_country
WHERE c.id NOT IN ( 13 , 185, 31, 49, 56, 48 , 247, 72, 85, 97 , 33, 189
)
GROUP BY c.id, c.code, c.name_english, c.phone_code, dt.id,  dt.name_english
HAVING COUNT(s.id) = 0
ORDER BY c.code;

/*
 SELECT concat(c.code, ' - ', c.name_english) cd1,  concat(c.code, '_', c.name_english, '_ADM1')  cd2,
(SELECT COUNT(*) FROM intermediary_db.t076t_states s WHERE s.id_country = c.ID) AS cantidad_estados, c.* 
FROM intermediary_db.t074t_countries c HAVING cantidad_estados > 0 ORDER BY c.code desc;

SELECT id, code,d name_english,  (SELECT COUNT(*) FROM intermediary_db.t076t_states s WHERE s.id_country = c.ID) AS cant,  c.*
  FROM intermediary_db.t074t_countries c
 WHERE c.ID  not IN (SELECT DISTINCT id_country FROM intermediary_db.t076t_states)
 and c.id not in (
 181, 186, 201, 231, 79, 200, 214, 225, 218, 239, 34, 246, 141, 243, 233,  190, 175, 
 178, 169,  78,  160, 161, 155, 148, 138, 164, 130, 189, 115, 43,  113, 9, 13, 2, 185, 
 31, 49, 56, 48, 247, 72, 73, 85, 87, 89, 207, 90, 97, 99 , 107, 33, 102 )
 ORDER BY c.code;
 */