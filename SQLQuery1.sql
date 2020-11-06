create database db_app03102020
use db_app03102020
 create table tbl_course
 (
 course_id int primary key identity,
 course_name varchar(20)
 )

 insert into tbl_course (course_name) values ('BCA')
 insert into tbl_course (course_name) values ('MCA')
 insert into tbl_course (course_name) values ('BBA')
 insert into tbl_course (course_name) values ('MBA')
 insert into tbl_course (course_name) values ('B.Tech')
 insert into tbl_course (course_name) values ('M.Tech')
 insert into tbl_course (course_name) values ('B.Sc')
 insert into tbl_course (course_name) values ('M.Sc')

 create proc sp_get_course
 as
 begin
 select * from tbl_course
 end

 create table tbl_registration
 (
 RId int primary key identity,
 Name varchar(50),
 Gender int,
 BloodGroup int,
 Course int
 )
 create proc sp_tbl_registration_insert
 @Name varchar(50),
 @Gender int,
 @BloodGroup int,
 @Course int
 as
 begin
 insert into tbl_registration (Name,Gender,BloodGroup,Course) values(@Name,@Gender,@BloodGroup,@Course)
 end

 create proc sp_tbl_registration_select
 as 
 begin
 select * from tbl_registration  join tbl_course on tbl_registration.Course=tbl_course.course_id
 end

 create proc sp_tbl_registration_edit
 @id int
 as
 begin
 select * from tbl_registration where RId=@id
 end

 create proc sp_tbl_registration_delete
 @id int
 as
 begin
 delete from tbl_registration where RId=@id
 end

 create proc sp_tbl_registration_update
 @id int,
 @Name varchar(50),
 @Gender int,
 @BloodGroup int,
 @Course int
 as
 begin
 update tbl_registration set Name=@Name,Gender=@Gender,BloodGroup=@BloodGroup,Course=@Course where RId=@id
 end

 select * from tbl_registration

 delete from tbl_registration where Gender=0