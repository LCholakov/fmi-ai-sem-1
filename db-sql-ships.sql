-- Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръжия.
select distinct country, NUMGUNS
from classes c1
where NUMGUNS >= ALL(
    select numguns
    from classes c2
    );

-- Напишете заявка, която извежда класовете, за които поне един от корабите им е потънал в битка.
select class
from classes
where class = any(
        select class
        from ships s1
        where name = any(
            select ship
            from OUTCOMES
            where RESULT = 'sunk'
            )
      );


-- Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore).
select name, class
from ships
where class = any(
    select class
    from CLASSES
    where bore = 16
    );

-- Напишете заявка, която извежда имената на битките, в които са участвали кораби от клас ‘Kongo’.
select name
from BATTLES
where name = any(
    select battle
    from OUTCOMES
    where ship = any (
        select name
        from ships
        where class = 'Kongo'
        )
    );

-- Напишете заявка, която извежда иманата на корабите, чиито брой оръдия е най-голям в сравнение с корабите със същия калибър оръдия (bore).
select name, class
from SHIPS
where class = any (
    select class
    from CLASSES c1
    where NUMGUNS >= ALL(
        select NUMGUNS
        from classes c2
        where c1.BORE = c2.BORE
        )
    );