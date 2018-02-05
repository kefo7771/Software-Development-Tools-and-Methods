SELECT name, statecode
FROM states;

SELECT name, statecode, population_1950, population_2010 
FROM counties 
WHERE  name LIKE 'Prince%'
ORDER BY statecode;

SELECT population_2010 FROM states, senators
WHERE states.statecode = senators.statecode AND senators.name ='Richard Lugar';

SELECT count(*)
FROM counties,states
WHERE states.name = 'Maryland' AND counties.statecode = states.statecode;

SELECT name FROM states
WHERE admitted_to_union = (SELECT MAX(admitted_to_union)FROM states);

SELECT name FROM senators
WHERE name NOT IN (SELECT chairman FROM committees) AND affilation = 'D'
ORDER BY name;
