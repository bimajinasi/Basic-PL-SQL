--select ID EVEN with DISTINT
select DISTINCT CITY from STATION where MOD(ID, 2) = 0;

--count DIFFERENCE 2 FIELD with DISTINCT (distinct group)
select 
SUM(count(CITY) - count(DISTINCT CITY)) AS "Diff" from Station
GROUP BY CITY;


--count LENGTH with asc and descending
SELECT * FROM(
select CITY, LENGTH(CITY) AS top_ln from STATION
where LENGTH(CITY) in 
(
select min(LENGTH(CITY)) from STATION 
UNION
select max(LENGTH(CITY)) from STATION
)
ORDER BY LENGTH(CITY) desc, CITY asc 
)WHERE ROWNUM <=2
;


--started with LIKE list character A,I,U,E,O
select CITY from STATION where 
CITY LIKE 'A%' OR 
CITY LIKE 'I%' OR
CITY LIKE 'U%' OR
CITY LIKE 'E%' OR
CITY LIKE 'O%';

select CITY from STATION where REGEXP_LIKE 
(CITY, '^(A|I|U|E|O)');

--end with LIKE list char , i = insensitive search
select DISTINCT CITY from STATION where REGEXP_LIKE 
(CITY, '(A$|I$|U$|E$|O$)', 'i');

--started and end with LIKE list char
select CITY from STATION where REGEXP_LIKE 
(CITY, '^(A|I|U|E|O)')
AND 
REGEXP_LIKE 
(CITY, '(A$|I$|U$|E$|O$)', 'i');

--not started with LIKE list vowel alphabet
select DISTINCT CITY from STATION where NOT REGEXP_LIKE 
(CITY, '^(A|I|U|E|O)');

--not end with LIKE list vowel alphabet
select DISTINCT CITY from STATION where NOT REGEXP_LIKE 
(CITY, '(A$|I$|U$|E$|O$)', 'i');

--not start and e nd with LIKE vowel aplhabet
select DISTINCT CITY from STATION where  
NOT REGEXP_LIKE (CITY, '^(A|I|U|E|O)')
AND 
NOT REGEXP_LIKE (CITY, '(A$|I$|U$|E$|O$)', 'i');


--order by with substr asc, and order id
select Name from STUDENTS WHERE Marks > 75
order by SUBSTR(Name,-3) ASC, ID ASC;


--case with matching sum 2 values
SELECT 
    CASE 
        WHEN A >= (B + C) OR B >= (A + C) OR C >= (A + B) THEN 'Not A Triangle'
        WHEN A = B AND A = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM TRIANGLES;


--substring 1 char, with calculate count occupation
select Name||'('||SUBSTR(OCCUPATION, 1, 1)||')' 
from OCCUPATIONS
order by name;

SELECT 'There are a total of ' || Count(Occupation) || ' ' || LOWER(Occupation) || 's.'
FROM Occupations
GROUP BY Occupation
ORDER BY Count(Name), Occupation;

--pivot table with value row name
select
    DOCTOR, PROFESSOR, SINGER, ACTOR  
from
(
    select name, occupation, (ROW_NUMBER() OVER (partition by occupation order by name)) as rownumber from occupations 
)
pivot
(
    max(name) 
    for occupation 
    in ('Doctor' as DOCTOR, 'Professor' as PROFESSOR, 'Singer' as SINGER, 'Actor' as ACTOR) 
) 
order by rownumber;

--binary tree with Root, Inner, Leaf
select N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (SELECT P FROM BST) THEN 'Inner'
        ELSE 'Leaf'
    END
FROM BST
ORDER BY N;

--join select
select 
e.company_code, 
c.founder, 
count(distinct lead_manager_code), 
count(distinct senior_manager_code), 
count(distinct manager_code), 
count(distinct employee_code)
from 
employee e join company c
on e.company_code = c.company_code
group by e.company_code, c.founder 
order by e.company_code
;

--simple join
SELECT CITY.NAME
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT = 'Africa';