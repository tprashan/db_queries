# ****************** connecting dba   ******************;
conn /as sysdba;

# ****************** create new user  ******************;
create user prashant identified by tripathi quota unlimited on users;

# ****************** select table space for user_table ******************;
select tablespace_name from usertablespaces; 

# ****************** for dicconnect   ******************;
disconnect;

# ****************** for deleting an user   *************;
drop user prashant;

# ****************** for select table data *****************;
select * from student;

# ****************** for select all table_name that a user have ***********************;
select table_name from user_tables;
