CREATE OR REPLACE FUNCTION RecordLocatorEncode(par_number BIGINT)
RETURNS VARCHAR(10)
AS
$$
DECLARE
  li_number BIGINT;
  li_curr BIGINT;
  ls_char CHAR(1);
  ls_result VARCHAR(10) = '';
BEGIN

  li_number := par_number;

  WHILE li_number > 0 LOOP
    li_curr := li_number % 32;
    li_number := ROUND(li_number/32, 0);

    SELECT (CASE li_curr
      WHEN 0 THEN '2'
      WHEN 1 THEN '3'
      WHEN 2 THEN '4'
      WHEN 3 THEN '5'
      WHEN 4 THEN '6'
      WHEN 5 THEN '7'
      WHEN 6 THEN '8'
      WHEN 7 THEN '9'
      WHEN 8 THEN 'A'
      WHEN 9 THEN 'C'
      WHEN 10 THEN 'D'
      WHEN 11 THEN 'E'
      WHEN 12 THEN 'F'
      WHEN 13 THEN 'G'
      WHEN 14 THEN 'H'
      WHEN 15 THEN 'I'
      WHEN 16 THEN 'J'
      WHEN 17 THEN 'K'
      WHEN 18 THEN 'L'
      WHEN 19 THEN 'M'
      WHEN 20 THEN 'N'
      WHEN 21 THEN 'O'
      WHEN 22 THEN 'P'
      WHEN 23 THEN 'Q'
      WHEN 24 THEN 'R'
      WHEN 25 THEN 'T'
      WHEN 26 THEN 'U'
      WHEN 27 THEN 'V'
      WHEN 28 THEN 'W'
      WHEN 29 THEN 'X'
      WHEN 30 THEN 'Y'
      WHEN 31 THEN 'Z'
    END) INTO ls_char;

    ls_result := ls_char || ls_result;

  END LOOP;

  RETURN ls_result;

END;
$$ LANGUAGE PLPGSQL;
