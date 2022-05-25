
use sakila;
SET SQL_SAFE_UPDATES=0;
update positions p
set p.name = concat(p.name, " Java")
where position_id in (select position_id from employee where concat (first_name,' ', last_name ) in ('PAUL TROUT','VLAD KOROLEV'));

update employee
set manager_id = 3
where concat (first_name,' ', last_name ) in ('PAUL TROUT','VLAD KOROLEV');

SET SQL_SAFE_UPDATES=0;
update positions p join employee e on p.position_id = e.position_id
set p.name = concat(p.name, " Java"), manager_id = 3
where position_id in (select position_id from employee where concat (first_name,' ', last_name ) in ('PAUL TROUT','VLAD KOROLEV'));
SET SQL_SAFE_UPDATES=1;

use sakila;
update payment_bak1 pb LEFT join customer_bak cb USING (customer_id)
set pb.last_update = CURRENT_TIMESTAMP, cb.last_update = now()
where pb.amount between 3 and 4.0;

select customer_id
from payment_bak1
where amount = (select max(amount) from payment_bak1);

update payment_bak1 pb join (select DISTINCT customer_id
from payment_bak1 P
where P.amount = (select max(amount) from payment_bak1)
) temp ON pb.customer_id = temp.customer_id
SET payment_date = now()








