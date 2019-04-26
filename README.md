# RecordLocator for PostgreSQL

**Two functions for PostgreSQL to encode (and decode) integers into a short and easy to read string**

This is the equivalent to [php-recordlocator](https://github.com/jakoubek/php-recordlocator) for PostgreSQL.

A RecordLocator is an alphanumerical string that represents an integer. This library encodes integers to RecordLocators and decodes RecordLocators back to integers.

A RecordLocator is shorter than the corresponding integer and easier to read and memorize. You can use it to encode autoincrement primary keys from an database into an human-readable representation for your users.

## Examples

- The integer 5,325 encodes to the RecordLocator 78G.
- The integer 3,512,345 encodes to the RecordLocator 5E82T.

Both RecordLocators are shorter than their integer equivalent. You can encode more than 33.5 million integers in an 5-char RecordLocator: the largest 5-char RecordLocator, ZZZZZ, represents the integer 33,554,431.

With 6 chars you can encode integers up to more than 1 billion.

## Usage


Encoding integers to recordlocators:

```sql
SELECT RecordLocatorEncode(5325); -- returns '78G'

SELECT RecordLocatorEncode(3512345); -- returns '5E82T'
```

Decoding recordlocators back into the integer values:

```sql
SELECT RecordLocatorDecode('78G'); -- returns 5325

SELECT RecordLocatorDecode('5E82T'); -- returns 3512345
```


