drop user LOTTERYFIRM;
create user LOTTERYFIRM-- username
IDENTIFIED BY lotteryfirmadmin-- password;

grant 
create session, alter session, alter user, create database link, create materialized view, create procedure, create public synonym, create role, create sequence, create synonym, create table, create trigger, create type, create view, create any index, unlimited tablespace
to LOTTERYFIRM;