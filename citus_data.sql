Coordinator  Port:9992

CREATE EXTENSION Citus; 

SELECT * from master_add_node('localhost', 9990); // To connect coordinator node with worker1 node

SELECT * from master_add_node('localhost', 9991); // To connect coordinator node with worker2 node

select * from master_get_active_worker_nodes(); // To verify that both worker nodes are connected to coordinator node


CREATE TABLE test(id INT PRIMARY KEY,name TEXT,branch TEXT);

CREATE TABLE test2(id int primary KEY,name TEXT,mail TEXT,stream TEXT);


SET citus.replication_model = 'streaming';


SELECT create_distributed_table('test', 'id');

SELECT create_distributed_table('test2', 'id');


1.SELECT name,branch from test;

2.SELECT name,mail from test2;

3.insert into student values(501,'vinod','cse');

4.insert into teacher values(502,'sai','sample.com', 'ece');

5.update teacher set mail='sample2.com' where mail='sample3.com';

6.delete from student where branch='eee';


 CREATE EXTENSION citus;

\d //run this command to view the list of distributed tables


CREATE EXTENSION citus;

\d //run this command to view the list of distributed tables