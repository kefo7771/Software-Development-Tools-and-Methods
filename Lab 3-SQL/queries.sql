Ken Ford
CSCI 3308

1) mysql> SELECT name
    -> FROM store
    -> ORDER BY name;
+--------+
| name   |
+--------+
| apple  |
| banana |
| lemon  |
| orange |
| pear   |
+--------+

2) mysql> SELECT name from store
    -> ORDER BY name limit 3;
+--------+
| name   |
+--------+
| apple  |
| banana |
| lemon  |
+--------+


3) mysql> SELECT name from store
    -> ORDER BY name desc limit 3;
+--------+
| name   |
+--------+
| pear   |
| orange |
| lemon  |
+--------+


4) mysql> SELECT name from store
    -> WHERE price > 1;
+--------+
| name   |
+--------+
| pear   |
| banana |
+--------+


5) mysql> SELECT name, qty*price AS 'Extended Price' from store;
+--------+--------------------+
| name   | Extended Price     |
+--------+--------------------+
| apple  |                 10 |
| pear   |                 10 |
| banana |                 15 |
| lemon  | 10.000000149011612 |
| orange | 10.000000149011612 |
+--------+--------------------+


6) mysql> SELECT SUM(price) from store; 
+-------------------+
| SUM(price)        |
+-------------------+
| 4.800000004470348 |
+-------------------+


7) mysql> SELECT SUM(qty) from store;
+----------+
| SUM(qty) |
+----------+
|      175 |
+----------+

8) mysql> SELECT name from course where department_id = 1;
+------+
| name |
+------+
| 111  |
| 112  |
| 250  |
| 231  |
+------+

9) mysql> SELECT SUM(count) from enrollment;
+------------+
| SUM(count) |
+------------+
|        351 |
+------------+

10) mysql> SELECT MAX(id) from enrollment;
+---------+
| MAX(id) |
+---------+
|       7 |
+---------+

11) mysql> SELECT MAX(id) from department;
+---------+
| MAX(id) |
+---------+
|       4 |
+---------+

12) SELECT department.name as depart_name, course.name
-> FROM course
-> JOIN department
-> ON department_id = department.id;
+-------------+------+
| depart_name | name |
+-------------+------+
| CSC         | 111  |
| CSC         | 112  |
| CSC         | 250  |
| CSC         | 231  |
| MTH         | 111  |
| EGR         | 250  |
| CHM         | 111  |
+-------------+------+

13) mysql> SELECT CONCAT(department.name, course.name) as course_name
    -> FROM course
    -> JOIN department
    -> ON department_id = department.id
    -> WHERE department.name = "CSC";
+-------------+
| course_name |
+-------------+
| CSC111      |
| CSC112      |
| CSC250      |
| CSC231      |
+-------------+

14) mysql> SELECT *, course.name                                                   -> FROM course
    -> JOIN (department, enrollment)
    -> ON (course.department_id = department.id AND course.id = enrollment.id);   +----+------+---------------+----+------+----+-------+------+
| id | name | department_id | id | name | id | count | name |
+----+------+---------------+----+------+----+-------+------+
|  1 | 111  |             1 |  1 | CSC  |  1 |    40 | 111  |
|  2 | 112  |             1 |  1 | CSC  |  2 |    15 | 112  |
|  3 | 250  |             1 |  1 | CSC  |  3 |    10 | 250  |
|  4 | 231  |             1 |  1 | CSC  |  4 |    12 | 231  |
|  5 | 111  |             2 |  2 | MTH  |  5 |    60 | 111  |
|  6 | 250  |             3 |  3 | EGR  |  6 |    14 | 250  |
|  7 | 111  |             4 |  4 | CHM  |  7 |   200 | 111  |
+----+------+---------------+----+------+----+-------+------+




