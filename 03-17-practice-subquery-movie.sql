SELECT name
FROM MOVIESTAR
WHERE name IN (SELECT name
               from MOVIEEXEC
               where networth > 10000000)
  and gender = 'F';

select name, NETWORTH
from MOVIEEXEC;

select name
from MOVIEstar
where name NOT IN (
    select name from MOVIEEXEC
    );


select title
from MOVIE
where length > (select length
                from MOVIE
                where title = 'Gone With the Wind'
    );

select * from movie;


select name
from MOVIEEXEC
where NETWORTH > (
    select NETWORTH
    from MOVIEEXEC
    where name = 'Merv Griffin'
    );

select m1.TITLE, m1.length, m1.STUDIONAME
from MOVIE m1
where m1.length >= ALL (select m2.length
                    from movie m2
                    where m1.studioname = m2.studioname
          );


