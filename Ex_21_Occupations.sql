/* Pivot the Occupation column in OCCUPATIONS so that each Name is sorted
 alphabetically and displayed underneath its corresponding Occupation. The
  output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation. */

SET @d=0,@a=0,@p=0,@s=0;
SELECT MIN(Doctor),MIN(Professor),MIN(SINGER),MIN(Actor)
FROM
(SELECT IF(OCCUPATION='Actor',NAME,NULL) AS Actor,
        IF(OCCUPATION='Doctor',NAME,NULL) AS Doctor,
        IF(OCCUPATION='Professor',NAME,NULL) AS Professor,
        IF(OCCUPATION='Singer',NAME,NULL) AS SINGER,
    case OCCUPATION when 'ACTOR' THEN @a:=@a+1
                    when 'Doctor' THEN @d:=@d+1
                    when 'Professor' THEN @p:=@p+1
                    when 'Singer' THEN @s:=@s+1
    end
as idn FROM OCCUPATIONS ORDER BY NAME ) AS TMP GROUP BY TMP.idn ;