CREATE EXTENSION pglogical;

SELECT pglogical.create_node(
    node_name := 'provider1',
    dsn := 'host=localhost port=9990 dbname=krishna'
);

CREATE TABLE test(id INT PRIMARY KEY,name TEXT,branch TEXT);

SELECT pglogical.replication_set_add_all_tables('default', ARRAY['public']);

SELECT * FROM pglogical.replication_set_table ;

\q

CREATE EXTENSION pglogical;

SELECT pglogical.create_node(
    node_name := 'subscriber1',
    dsn := 'host=localhost port=9991 dbname=db'
);

SELECT pglogical.create_subscription(
    subscription_name := 'subscription1',
    provider_dsn := 'host=localhost port=9990 dbname=db'
);


INSERT INTO test VALUES (501, 'vinod', 'cse');

SELECT * FROM test;


SELECT * FROM test;


INSERT INTO test VALUES (502, 'sai', 'ece');

SELECT * FROM test;


SELECT * FROM test;