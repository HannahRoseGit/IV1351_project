CREATE TABLE Contact_person (
 contact_ID VARCHAR(20) NOT NULL,
 relation VARCHAR(50),
 lastName VARCHAR(50),
 firstName VARCHAR(50)
);

ALTER TABLE Contact_person ADD CONSTRAINT PK_Contact_person PRIMARY KEY (contact_ID);


CREATE TABLE Intrument (
 InstrumentID  VARCHAR(20) NOT NULL,
 Brand  CHAR(50),
 Type  CHAR(50),
 Availblity BOOLEAN,
 Price  FLOAT(10)
);

ALTER TABLE Intrument ADD CONSTRAINT PK_Intrument PRIMARY KEY (InstrumentID );


CREATE TABLE Lesson (
 LessonID VARCHAR(20) NOT NULL,
 InstructorID VARCHAR(20) NOT NULL,
 Price FLOAT(10),
 Level VARCHAR(20)
);

ALTER TABLE Lesson ADD CONSTRAINT PK_Lesson PRIMARY KEY (LessonID);


CREATE TABLE Person (
 ID VARCHAR(20) NOT NULL,
 lastName VARCHAR(50),
 firstName VARCHAR(50),
 age INT
);

ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (ID);


CREATE TABLE Phone (
 ID VARCHAR(20) NOT NULL,
 phoneNum VARCHAR(20)
);

ALTER TABLE Phone ADD CONSTRAINT PK_Phone PRIMARY KEY (ID);


CREATE TABLE Student (
 ID VARCHAR(20) NOT NULL,
 level CHAR(20)
);

ALTER TABLE Student ADD CONSTRAINT PK_Student PRIMARY KEY (ID);


CREATE TABLE student_payment (
 ID VARCHAR(20) NOT NULL,
 lastPayment DATE,
 nextPayment DATE
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (ID);


CREATE TABLE StudentList (
 studentID VARCHAR(20) NOT NULL,
 LessonID VARCHAR(20) NOT NULL
);


CREATE TABLE StudentRent (
 ID VARCHAR(20) NOT NULL,
 isRenting BOOLEAN,
 NumRenting INT
);

ALTER TABLE StudentRent ADD CONSTRAINT PK_StudentRent PRIMARY KEY (ID);


CREATE TABLE Address (
 ID VARCHAR(20) NOT NULL,
 street  VARCHAR(50),
 zip VARCHAR(50),
 city VARCHAR(50)
);

ALTER TABLE Address ADD CONSTRAINT PK_Address PRIMARY KEY (ID);


CREATE TABLE Email (
 ID VARCHAR(20) NOT NULL,
 email VARCHAR(50)
);

ALTER TABLE Email ADD CONSTRAINT PK_Email PRIMARY KEY (ID);


CREATE TABLE Ensemble (
 LessonID VARCHAR(20) NOT NULL,
 minSeats INT,
 MaxSeats INT,
 Genre VARCHAR(20)
);

ALTER TABLE Ensemble ADD CONSTRAINT PK_Ensemble PRIMARY KEY (LessonID);


CREATE TABLE group_lessons (
 LessonID VARCHAR(20) NOT NULL,
 minSeats INT,
 MaxSeats INT
);

ALTER TABLE group_lessons ADD CONSTRAINT PK_group_lessons PRIMARY KEY (LessonID);


CREATE TABLE Individual_lessons (
 LessonID VARCHAR(20) NOT NULL,
 Instrument CHAR(50)
);

ALTER TABLE Individual_lessons ADD CONSTRAINT PK_Individual_lessons PRIMARY KEY (LessonID);


CREATE TABLE Instructor (
 ID VARCHAR(20) NOT NULL,
 payDate DATE
);

ALTER TABLE Instructor ADD CONSTRAINT PK_Instructor PRIMARY KEY (ID);


CREATE TABLE InstrumentList (
 LessonID VARCHAR(20) NOT NULL,
 instrumentType VARCHAR(20)
);

ALTER TABLE InstrumentList ADD CONSTRAINT PK_InstrumentList PRIMARY KEY (LessonID);


CREATE TABLE Lesson_person (
 ID VARCHAR(20) NOT NULL,
 LessonID VARCHAR(20) NOT NULL
);


CREATE TABLE lessonsList (
 lessonID CHAR(10),
 ID VARCHAR(20) NOT NULL
);


CREATE TABLE relations (
 ID VARCHAR(20),
 contact_ID VARCHAR(20)
);


CREATE TABLE RentalIDList (
 rentalID VARCHAR(20) NOT NULL,
 ID VARCHAR(20) NOT NULL
);

ALTER TABLE RentalIDList ADD CONSTRAINT PK_RentalIDList PRIMARY KEY (rentalID);


CREATE TABLE Renting (
 rentalID VARCHAR(20) NOT NULL,
 instrument CHAR(50),
 isBack BOOLEAN,
 timeRented DATE,
 lastPay DATE,
 InstrumentID  VARCHAR(20)
);

ALTER TABLE Renting ADD CONSTRAINT PK_Renting PRIMARY KEY (rentalID);


CREATE TABLE Schedule  (
 weekday VARCHAR(10),
 start_time TIME(6),
 end_time TIME(6),
 available  BOOLEAN,
 lessonID VARCHAR(20),
 ID VARCHAR(20)
);


CREATE TABLE Sibling (
 ID VARCHAR(20) NOT NULL,
 hasSibling BOOLEAN
);

ALTER TABLE Sibling ADD CONSTRAINT PK_Sibling PRIMARY KEY (ID);


CREATE TABLE SiblingList (
 siblingID CHAR(10),
 ID VARCHAR(20) NOT NULL
);


ALTER TABLE Phone ADD CONSTRAINT FK_Phone_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE Student ADD CONSTRAINT FK_Student_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (ID) REFERENCES Student (ID);


ALTER TABLE StudentList ADD CONSTRAINT FK_StudentList_0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE StudentRent ADD CONSTRAINT FK_StudentRent_0 FOREIGN KEY (ID) REFERENCES Student (ID);


ALTER TABLE Address ADD CONSTRAINT FK_Address_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE Email ADD CONSTRAINT FK_Email_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE Ensemble ADD CONSTRAINT FK_Ensemble_0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE group_lessons ADD CONSTRAINT FK_group_lessons_0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE Individual_lessons ADD CONSTRAINT FK_Individual_lessons_0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE Instructor ADD CONSTRAINT FK_Instructor_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE InstrumentList ADD CONSTRAINT FK_InstrumentList_0 FOREIGN KEY (LessonID) REFERENCES Ensemble (LessonID);


ALTER TABLE Lesson_person ADD CONSTRAINT FK_Lesson_person_0 FOREIGN KEY (ID) REFERENCES Person (ID);
ALTER TABLE Lesson_person ADD CONSTRAINT FK_Lesson_person_1 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE lessonsList ADD CONSTRAINT FK_lessonsList_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE relations ADD CONSTRAINT FK_relations_0 FOREIGN KEY (ID) REFERENCES Student (ID);
ALTER TABLE relations ADD CONSTRAINT FK_relations_1 FOREIGN KEY (contact_ID) REFERENCES Contact_person (contact_ID);


ALTER TABLE RentalIDList ADD CONSTRAINT FK_RentalIDList_0 FOREIGN KEY (ID) REFERENCES StudentRent (ID);


ALTER TABLE Renting ADD CONSTRAINT FK_Renting_0 FOREIGN KEY (rentalID) REFERENCES RentalIDList (rentalID);
ALTER TABLE Renting ADD CONSTRAINT FK_Renting_1 FOREIGN KEY (InstrumentID ) REFERENCES Intrument (InstrumentID );


ALTER TABLE Schedule  ADD CONSTRAINT FK_Schedule_0 FOREIGN KEY (ID) REFERENCES Instructor (ID);


ALTER TABLE Sibling ADD CONSTRAINT FK_Sibling_0 FOREIGN KEY (ID) REFERENCES Student (ID);


ALTER TABLE SiblingList ADD CONSTRAINT FK_SiblingList_0 FOREIGN KEY (ID) REFERENCES Sibling (ID);

INSERT INTO person(id, lastname, firstname, age) VALUES (654498, 'Danvers', 'Carol', 63);

INSERT INTO person(id, lastname, firstname, age) VALUES (358204, 'Stark', 'Tony', 53),(402372, 'Banner', 'Bruce', 39),(573249,'Odinson', 'Thor', 1500),
(304320, 'Odinson', 'Loki', 1054), (120418, 'Odinsdottir', 'Hela', 3000),(520314, 'Romanoff', 'Natasha', 33), (923834, 'Lang', 'Scott', 46);
INSERT INTO person(id, lastname, firstname, age) VALUES (482033, 'Parker', 'Peter', 17),(302929,'Rogers','Steve',99),(201239,'Fury','Nick',66);
INSERT INTO person(id, lastname, firstname, age) VALUES (530323, 'Strange', 'Stephan',42), (839813, 'Maximoff', 'Wanda', 26),
(195739, 'Maximoff', 'Pietro', 26), (450329, 'Brunnhilde' ,'Valkyrie',5000),(420319, 'Wakanda','Shuri', 24), (492385, 'Wakanda', 'TChalla',35),
(342025, 'Barton', 'Clint', 53), (640393, 'Barnes', 'Bucky',106),(680349,'Wilson','Sam',40),(385042,'Wong','Benedict',51),
(486022, 'Quill', 'Peter', 38), (759238,'Carter','Peggy',95),(580319,'Belova','Yelena', 27),(303484,'Bishop','Kate','22'); 

INSERT INTO person(id, lastname, firstname, age) VALUES (902382,'Knutsson Mendoza','Ludvig',26),(111144,'Asadi','Hannah',20),
(497734,'Molavi','Hosna',19),(762303,'Asghari','Yas',22),(942039,'Samadder','Pranto',18),(673920,'Jogell','Fredrick', 26),(793022,'Julio Cosentino','Dante',24),
(950239,'Ande','Fanuel',24), (832219,'Stenman','Nellie',24),(923858,'Lin lu', 'Silvia',20),(583923,'Ekström','Arthur',21),(679302,'Persson','Oscar',24),
(592402,'Belmar de Costa','Tomas',20), (850221,'Någon Draken','Albin',20), (340457,'Hocker','Simon',24),(734298,'ko','E-joon',25),
(740218,'Jälmefors','Elin',22),(692820,'Verner-Clarsson','Tove',30),(820230,'Asp','Pontus',25),(923843,'Helmfrid','Rickard',31),
(503201,'Frosterud','Edvin',20), (683020,'gamer','Kristofer',18),(903492,'Origami','Vlad',20);

INSERT INTO Instructor(id, payDate) VALUES (358204, null),(402372,null),(520314,null),(302929,null),(759238,null),(530323,null),(201239,null),(385042,null);

ALTER TABLE Lesson ADD date date;

insert into Lesson(LessonID,InstructorID,Price,Level,date) values (18543,402372,1000,'beginner','2022-10-23'),(13928,358204,1000,'beginner','2022-10-17'),
(17453,358204,1000,'beginner','2022-11-11'),(19536,302929,1000,'intermediate','2022-11-22'),(18157,402372,1000,'advaned','2022-10-23'),
(19346,358204,1000,'intermediate','2022-10-01'),(12387,385042,1000,'advanced','2022-10-20');

insert into Lesson(LessonID,InstructorID,Price,Level,date) values (27433,59238,600,'beginner','2022-10-04'),(28303,402372,600,'beginner','2022-10-21'),
(29031,759238,600,'beginner','2022-11-19'),(25701,358204,600,'intermediate','2022-11-08'),(25869,402372,600,'advaned','2022-10-25'),
(28943,201239,600,'intermediate','2022-10-06'),(26840,302929,600,'advanced','2022-10-13'),(27604,2530323,600,'intermediate','2022-11-17'),
(28437,201239,600,'advanced','2022-11-13'),(26024,759238,600,'beginner','2022-10-05');

insert into Lesson(LessonID,InstructorID,Price,Level,date) values (31974,402372,800,'beginner','2022-10-28'),(39567,385042,800,'beginner','2022-11-21'),
(33076,759238,800,'beginner','2022-11-23'),(39643,530323,800,'intermediate','2022-11-27'),(36492,201239,800,'advaned','2022-11-07'),
(36584,201239,800,'intermediate','2022-10-16');

-- adding lessons 
-- individual lessons
insert into StudentList(studentID,LessonID) values (902382,18543),(111144,19346),(486022,13928),(482033,17453),(573249,18157),(923834,12387);
-- group lessons, each line is a different class
insert into StudentList(studentID,LessonID) values (923843,27433),(692820,27433),(673920,27433),(497734,27433), 
(492385,28303),(340457,28303),(793022,28303),(640393,28303),
(903492,25701),(850221,25701),(793022,25701),(503201,25701),
(820230,25869),(120418,258690),(820230,25869),(592402,25869),(679302,25869);
-- ensemble lessons
insert into StudentList(studentID,LessonID) values (832219,31974),(762303,31974),(850221,31974),(111144,31974),(82033,31974),(303484,31974),
(734298,39567),(195739,39567),(942039,39567),(420319,39567),(580319,39567),(923858,39567),(450329,39567);

-- now inside individual lessons:
insert into Individual_lessons (LessonID,Instrument) values (18543,'chello'),(19346,'violin'),(13928,'piano'),(17453,'guitar'),(18157,'harp'),(12387,'drums');

ALTER TABLE group_lessons ADD Instrument VARCHAR(50);
-- inside group lessons
insert into group_lessons (LessonID,minSeats,MaxSeats,Instrument) values (27433,2,5,'piano'),(28303,2,6,'harp'),(25701,2,4,'violin'),(25869,2,5,'guitar');

-- inside ensemble lessons
insert into Ensemble (LessonID,minSeats,MaxSeats,Genre) values (31974,3,10,'pop'),(39567,4,20,'classic');

-- insert into student
insert into Student (ID, level) values (573249, 'intermediate'),(304320,'intermediate'),(120418,'advanced'),(923834,'beginner'),
(482033,'beginner'),(839813,'advanced'),(195739,'intermediate'),(450329,'intermediate'),(420319,'beginner'),(492385,'beginner'),
(342025,'intermediate'),(640393,'advanced'),(680349,'intermediate'),(486022,'beginner'),(580319,'intermediate'),(303484,'intermediate'),
(902382,'beginner'),(111144,'beginnner'),(497734,'beginner'),(762303,'intermediate'),(942039,'beginnner'),(673920,'advanced'),
(793022,'intermediate'),(950239,'beginner'),(832219,'intermediate'),(923858,'advanced'),(583923,'beginner'),(679302,'intermediate'),
(592402,'beginner'),(850221,'beginner'),(340457,'intermediate'),(734298,'intermediate'),(740218,'advanced'),(692820,'advanced'),
(820230,'advanced'),(923843,'intermediate'),(503201,'beginner'),(683020,'intermediate'),(903492,'beginnner');


-- sibling
insert into Sibling (ID, hasSibling) values (573249, TRUE),(304320,TRUE),(120418,TRUE),(923834,FALSE),
(482033,FALSE),(839813,TRUE),(195739,TRUE),(450329,FALSE),(420319,TRUE),(492385,TRUE),
(342025,FALSE),(640393,FALSE),(680349,FALSE),(486022,FALSE),(580319,FALSE),(303484,FALSE),
(902382,FALSE),(111144,FALSE),(497734,FALSE),(762303,FALSE),(942039,FALSE),(673920,FALSE),
(793022,FALSE),(950239,FALSE),(832219,FALSE),(923858,FALSE),(583923,FALSE),(679302,FALSE),
(592402,FALSE),(850221,FALSE),(340457,FALSE),(734298,FALSE),(740218,FALSE),(692820,FALSE),
(820230,FALSE),(923843,FALSE),(503201,FALSE),(683020,FALSE),(903492,FALSE);

-- sibling list 
insert into SiblingList (ID, siblingID) values (573249, 304320),(573249, 120418),(304320,573249),(304320,573249),(120418,573249),
(120418,304320),(839813,195739),(195739,839813),(420319,420319),(492385,420319);

-- first view 
-- part one
create view counting_lessons_per_month as select extract(month from date)as month, count(*) from Lesson where extract(year from date)='2022'
 group by extract(month from date) order by extract(month from date) ASC;
 -- part two
 ALTER TABLE lesson ADD type VARCHAR(20);
 -- p2
create view counting_lessons_per_month_type as select type,count(*) as number, extract(month from date) as month from lesson
 where extract(year from date)='2022' group by month,type;

 
 -- second view
 create view student_sibling_info as select sibling.id as id, hassibling,siblingid from sibling full outer join siblinglist 
 on sibling.id=siblinglist.id;
 
 create view sibling_count as select id, case
 when hassibling=FALSE then 0
 when (count(id)=1 and hassibling=TRUE) then 1
 when (count(id)=2 and hassibling=TRUE) then 2 end
 as sibling_count from student_sibling_info group by id,hassibling;
 
 -- third view
 create view instructors_at_risk as select instructorid, 
 count(instructorid) as number_of_classes from lesson 
 group by instructorid having count(instructorid)>2;
 
 -- fourth view
 create materialized view ensemble_weekly_schedule as select lessonid, genre, 
 to_char(date,'Day') as weekday, date,case when current_students=maxseats 
 then 'the ensemble is full' when current_students=maxseats-1 then '1 seat left' 
 when current_students=maxseats-2 then '2 seats left' else 'more than 2 seats left' 
 end as empty_seats from ensemble where date_trunc('week',date)=date_trunc('week',now()) + interval '1 week' 
 order by genre,weekday;

