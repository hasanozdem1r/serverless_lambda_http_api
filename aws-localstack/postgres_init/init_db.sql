/*Create schema and grant to public*/
CREATE SCHEMA serverless_schema;
GRANT ALL ON SCHEMA serverless_schema TO public;
/*List all schemas*/
SELECT * FROM information_schema.schemata;

CREATE SCHEMA serverless_schema;

CREATE TABLE serverless_schema.audit (
    id serial PRIMARY KEY,
    event_user name NOT NULL DEFAULT "session_user"(),
    event_time timestamp with time zone NOT NULL DEFAULT now(),
    event_type text NOT NULL CHECK (event_type = ANY (ARRAY['INSERT', 'UPDATE', 'DELETE'])),
    table_name name NOT NULL,
    object_id bigint NOT NULL,
    record_new json,
    record_old json
);

GRANT ALL ON TABLE serverless_schema.audit TO public;

SELECT * FROM serverless_schema.audit;

INSERT INTO serverless_schema.audit(event_user, event_time, event_type, table_name, object_id, record_new, record_old)
VALUES
       ('borewicz.p', '2016-10-11 12:13'::timestamptz, 'INSERT', 'person', 13,
        '{"id":13, "first_name":"Anna","last_name": "Kowalska", "bith": "1988-08-08", "pesel": null}'::json,
        '{}'::json
       )
;

INSERT INTO serverless_schema.audit(event_user, event_time, event_type, table_name, object_id, record_new, record_old)
VALUES
('borewicz.p', '2016-10-11 12:21'::timestamptz, 'INSERT', 'address', 13,
        '{"id":13, "person_id": 13, "city": "Warszawa", "street": null, "code": null}'::json,
        '{}'::json
       )
;

INSERT INTO serverless_schema.audit(event_user, event_time, event_type, table_name, object_id, record_new, record_old)
VALUES
       ('borewicz.p', '2016-10-11 12:33'::timestamptz, 'UPDATE', 'address', 13,
        '{"id":13, "person_id": 13, "city": "Warszawa", "street": "Kwiatowa 13 / 1", "code": "00-128"}'::json,
        '{"id":13, "person_id": 13, "city": "Warszawa", "street": null, "code": null}'::json
       )
;

INSERT INTO serverless_schema.audit(event_user, event_time, event_type, table_name, object_id, record_new, record_old)
VALUES
       ('adam.r', '2016-10-11 15:15'::timestamptz, 'UPDATE', 'person', 14,
        '{"id":14, "first_name": "", "last_name": "Kowalska", "bith": "1978-04-05", "pesel": "78191919191"}'::json,
        '{"id":14, "first_name": "Jan", "last_name": "Kowalski", "bith": "1978-04-04", "pesel": null}'::json
       )
;

INSERT INTO serverless_schema.audit(event_user, event_time, event_type, table_name, object_id, record_new, record_old)
VALUES
       ('klos.j', '2016-10-12 13:11'::timestamptz, 'UPDATE', 'person', 13,
        '{"id":13, "first_name": "Anna", "last_name": "Kowalska", "bith": "1988-08-08", "pesel": "88080804322"}'::json,
        '{"id":13, "first_name": "Anna", "last_name": "Kowalska", "bith": "1988-08-08", "pesel": null}'::json
       )
;

INSERT INTO serverless_schema.audit(event_user, event_time, event_type, table_name, object_id, record_new, record_old)
VALUES
       ('borewicz.p', '2017-05-29 14:32'::timestamptz, 'UPDATE', 'person', 13,
        '{"id":13, "first_name": "Anna", "last_name": "Skowron", "bith": "1988-08-08", "pesel": "88080804322"}'::json,
        '{"id":13, "first_name": "Anna", "last_name": "Kowalska", "bith": "1988-08-08", "pesel": "88080804322"}'::json
       )
;

INSERT INTO serverless_schema.audit(event_user, event_time, event_type, table_name, object_id, record_new, record_old)
VALUES
       ('borewicz.p', '2017-05-29 14:31'::timestamptz, 'DELETE', 'address', 13,
        '{}'::json,
        '{"id":13, "person_id": 13, "city": "Warszawa", "street": "Kwiatowa 13 / 1", "code": "00-128"}'::json
       )
;

INSERT INTO serverless_schema.audit(event_user, event_time, event_type, table_name, object_id, record_new, record_old)
VALUES
       ('borewicz.p', '2017-05-29 14:32'::timestamptz, 'DELETE', 'person', 13,
        '{}'::json,
        '{"id":13, "first_name": "Anna", "last_name": "Skowron", "bith": "1988-08-08", "pesel": "88080804322"}'::json
       )
;


SELECT * FROM serverless_schema.audit;