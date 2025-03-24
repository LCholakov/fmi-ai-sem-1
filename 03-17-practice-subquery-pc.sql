select MAKER
from PRODUCT
where MODEL in (select model
                from PC
                where speed > 500);


select model
from pc
where speed > 500;

select model, type
from PRINTER p1
where price >= ALL (select price
                    from printer p2
                    where p1.TYPE = p2.TYPE);

select model
from LAPTOP
where speed < all (select speed
                   from PC);


select MAKER
from PRODUCT
where MODEL = (select model
               from PRINTER
               where color = 'y'
                 and price <= ALL (select price
                                   from PRINTER
                                   where color = 'y'));

select model
from PRINTER
where color = 'y'
  and price <= ALL (select price
                    from PRINTER
                    where color = 'y'
                    );


select maker
from PRODUCT
where model in (
    select model
    from pc p1
    where ram <= ALL (select ram
                      from PC)
    and speed >= ALL (select speed
                      from pc p2
                      where p1.ram = p2.ram)
    );

-- check if results are as expected -> nested query replace with * for all
-- and alt+enter -> arrow down to select only the nested query
--
-- select maker
-- from PRODUCT
-- where model in (
--     select *
--     from pc p1
--     where ram <= ALL (select ram
--                       from PC)
--     and speed >= ALL (select speed
--                       from pc p2
--                       where p1.ram = p2.ram)
--     );


