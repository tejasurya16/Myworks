drop table children;

CREATE TABLE children(
 student_id INT PRIMARY KEY auto_increment ,
 name VARCHAR(20) not null ,
 subject VARCHAR(20)unique
 );
 
 



select children;

 
 INSERT INTO children values (1,'teja','maths');
 INSERT  INTO children values (2,'gopi','physics');
 INSERT INTO children(student_id,name) values(7,'pradeep');
 INSERT  INTO children values (4,'venkat','biology');
 INSERT  INTO children values (5,'gopi','chemistry');
 
 
 
  
 
 
 