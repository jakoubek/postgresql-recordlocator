CREATE OR REPLACE FUNCTION RecordLocatorDecode(par_recordlocator VARCHAR(10))
RETURNS BIGINT
AS
$$
DECLARE
  li_i INTEGER = 0;
  ls_char CHAR(1);
  number_value INTEGER;
  numbers INTEGER[];
  number_elem INTEGER;
  li_number BIGINT = 0;
BEGIN

  WHILE li_i < LENGTH(par_recordlocator) LOOP
    li_i := li_i + 1;
    ls_char := SUBSTRING(par_recordlocator, li_i, 1);

    SELECT (CASE ls_char
        WHEN '0' THEN 21
        WHEN '1' THEN 15
        WHEN 'S' THEN 12
        WHEN 'B' THEN 22
        WHEN '2' THEN 0
        WHEN '3' THEN 1
        WHEN '4' THEN 2
        WHEN '5' THEN 3
        WHEN '6' THEN 4
        WHEN '7' THEN 5
        WHEN '8' THEN 6
        WHEN '9' THEN 7
        WHEN 'A' THEN 8
        WHEN 'C' THEN 9
        WHEN 'D' THEN 10
        WHEN 'E' THEN 11
        WHEN 'F' THEN 12
        WHEN 'G' THEN 13
        WHEN 'H' THEN 14
        WHEN 'I' THEN 15
        WHEN 'J' THEN 16
        WHEN 'K' THEN 17
        WHEN 'L' THEN 18
        WHEN 'M' THEN 19
        WHEN 'N' THEN 20
        WHEN 'O' THEN 21
        WHEN 'P' THEN 22
        WHEN 'Q' THEN 23
        WHEN 'R' THEN 24
        WHEN 'T' THEN 25
        WHEN 'U' THEN 26
        WHEN 'V' THEN 27
        WHEN 'W' THEN 28
        WHEN 'X' THEN 29
        WHEN 'Y' THEN 30
        WHEN 'Z' THEN 31
        END)
    INTO number_value;
    numbers := array_append(numbers, number_value);

  END LOOP;

  FOREACH number_elem IN ARRAY numbers
  LOOP
    li_number := (li_number * 32) + number_elem;
  END LOOP;

  RETURN li_number;

END;
$$ LANGUAGE PLPGSQL;
