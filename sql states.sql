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