CREATE EXTENSION pglogical;

CREATE TABLE test2 (id INT PRIMARY KEY,name TEXT,branch TEXT);

CREATE SEQUENCE seq_tbl_id INCREMENT BY 2 START WITH 1;

SELECT pglogical.create_node (
    node_name := 'provider1',
    dsn := 'host=localhost port=9992 dbname=provider1'
);

SELECT pglogical.replication_set_add_table ( 
    set_name := 'default', relation := 'test2', synchronize_data := true
);


CREATE EXTENSION pglogical;

CREATE TABLE test2 (id INT PRIMARY KEY,name TEXT,branch TEXT);

CREATE SEQUENCE seq_tbl_id INCREMENT BY 2 START WITH 2;

SELECT pglogical.create_node (
    node_name := 'provider2',
    dsn := 'host=localhost port=9992 dbname=provider2'
);

SELECT pglogical.replication_set_add_table (
    set_name := 'default', relation := 'test2', synchronize_data := true
);


CREATE EXTENSION pglogical;

CREATE TABLE test2 (id INT PRIMARY KEY,name TEXT,branch TEXT);

SELECT pglogical.create_node (
    node_name := 'subscriber', dsn := 'host=localhost port=9990 dbname=subscriber'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription1', 
    provider_dsn := 'host=localhost port=9992 dbname=provider1'
);

SELECT pglogical.create_subscription (
    subscription_name := 'subscription2', 
    provider_dsn := 'host=localhost port=9992 dbname=provider2'
);


insert into test2 select nextval ('seq_tbl_id'),'user' || generate_series(1,10,2);


insert into test2 select nextval ('seq_tbl_id'),'user' || generate_series(1,10,2);


SELECT * FROM test2 ;

INSERT INTO test2 VALUES (555, 'vinod', 'mech');

SELECT * FROM test2 ;


SELECT * FROM test2 ;


SELECT * FROM test2 ;