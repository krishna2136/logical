CREATE EXTENSION pglogical;

CREATE TABLE test2 (id INT PRIMARY KEY,name TEXT,branch TEXT);

SELECT pglogical.create_node (
    node_name := 'provider',
    dns := 'host=localhost port=9990 dbname=k'
);

SELECT pglogical.replication_set_add_table (
    set_name := 'default', relation := 'test2', synchronize_data := true
);


CREATE EXTENSION pglogical;

CREATE TABLE tbl (id INT PRIMARY KEY,name TEXT,branch TEXT);

SELECT pglogical.create_node (
    node_name := 'subscriber1',
    dsn := 'host=localhost port=9991 dbname=k1'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription1',
    provider_dsn := 'host=localhost port=9990 dbname=k'
);


CREATE EXTENSION pglogical;

CREATE TABLE test2 (id INT PRIMARY KEY,name TEXT,branch TEXT);

SELECT pglogical.create_node (
    node_name := 'subscriber2',
    dsn := 'host=localhost port=9991 dbname=k2'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscribtion2',
    provider_dsn := 'host=localhost port=9990 dbname=k'
);


INSERT INTO test2 VALUES (501, 'vinod', 'cse');
INSERT INTO test2 VALUES (502, 'sai', 'ece');

SELECT * FROM test2;


SELECT * FROM test2;


SELECT * FROM test2;