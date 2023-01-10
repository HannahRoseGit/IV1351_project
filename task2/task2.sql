-- creating the tables 

CREATE TABLE Intrument (
 InstrumentID SERIAL NOT NULL,
 Brand  CHAR(50),
 Type  CHAR(50),
 Availblity BOOLEAN,
 Price  FLOAT(10)
);

ALTER TABLE Intrument ADD CONSTRAINT PK_Intrument PRIMARY KEY (InstrumentID );


CREATE TABLE Lesson (
 LessonID SERIAL NOT NULL,
 InstructorID SERIAL NOT NULL,
 Price FLOAT(10),
 Level VARCHAR(20),
 date date,
 type VARCHAR(20)
);

ALTER TABLE Lesson ADD CONSTRAINT PK_Lesson PRIMARY KEY (LessonID);


CREATE TABLE Person (
 ID SERIAL NOT NULL,
 lastName VARCHAR(50),
 firstName VARCHAR(50),
 age INT
);

ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (ID);


CREATE TABLE Phone (
 ID SERIAL NOT NULL,
 phoneNum VARCHAR(20)
);

ALTER TABLE Phone ADD CONSTRAINT PK_Phone PRIMARY KEY (ID);


CREATE TABLE Student (
 ID SERIAL NOT NULL,
 level CHAR(20)
);

ALTER TABLE Student ADD CONSTRAINT PK_Student PRIMARY KEY (ID);


CREATE TABLE student_payment (
 ID SERIAL NOT NULL,
 lastPayment DATE,
 nextPayment DATE
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (ID);


CREATE TABLE StudentList (
 studentID SERIAL NOT NULL,
 LessonID SERIAL NOT NULL
);


CREATE TABLE StudentRent (
 ID SERIAL NOT NULL,
 isRenting BOOLEAN,
 NumRenting INT
);

ALTER TABLE StudentRent ADD CONSTRAINT PK_StudentRent PRIMARY KEY (ID);


CREATE TABLE Address (
 ID SERIAL NOT NULL,
 street  VARCHAR(50),
 zip VARCHAR(50),
 city VARCHAR(50)
);

ALTER TABLE Address ADD CONSTRAINT PK_Address PRIMARY KEY (ID);


CREATE TABLE Contact_person (
 contact_ID VARCHAR(20) NOT NULL,
 ID SERIAL NOT NULL,
 lastName VARCHAR(50),
 firstName VARCHAR(50)
);

ALTER TABLE Contact_person ADD CONSTRAINT PK_Contact_person PRIMARY KEY (contact_ID,ID);


CREATE TABLE Email (
 ID SERIAL NOT NULL,
 email VARCHAR(50)
);

ALTER TABLE Email ADD CONSTRAINT PK_Email PRIMARY KEY (ID);


CREATE TABLE Ensemble (
 LessonID SERIAL NOT NULL,
 minSeats INT,
 MaxSeats INT,
 Genre VARCHAR(20),
 current_students INT,
 date date
);

ALTER TABLE Ensemble ADD CONSTRAINT PK_Ensemble PRIMARY KEY (LessonID);


CREATE TABLE group_lessons (
 LessonID SERIAL NOT NULL,
 minSeats INT,
 MaxSeats INT,
 instrument character varying(20)
);

ALTER TABLE group_lessons ADD CONSTRAINT PK_group_lessons PRIMARY KEY (LessonID);


CREATE TABLE Individual_lessons (
 LessonID SERIAL NOT NULL,
 Instrument CHAR(50)
);

ALTER TABLE Individual_lessons ADD CONSTRAINT PK_Individual_lessons PRIMARY KEY (LessonID);


CREATE TABLE Instructor (
 ID SERIAL NOT NULL,
 payDate DATE
);

ALTER TABLE Instructor ADD CONSTRAINT PK_Instructor PRIMARY KEY (ID);


CREATE TABLE InstrumentList (
 LessonID SERIAL NOT NULL,
 instrumentType VARCHAR(20)
);

ALTER TABLE InstrumentList ADD CONSTRAINT PK_InstrumentList PRIMARY KEY (LessonID);


CREATE TABLE Lesson_person (
 ID SERIAL NOT NULL,
 LessonID VARCHAR(20) NOT NULL
);


CREATE TABLE lessonsList (
 lessonID SERIAL,
 ID SERIAL NOT NULL
);


CREATE TABLE relations (
 ID SERIAL,
 relation VARCHAR(50),
 contact_ID SERIAL
);


CREATE TABLE RentalIDList (
 rentalID SERIAL NOT NULL,
 ID SERIAL NOT NULL
);

ALTER TABLE RentalIDList ADD CONSTRAINT PK_RentalIDList PRIMARY KEY (rentalID);


CREATE TABLE Renting (
 rentalID SERIAL NOT NULL,
 instrument CHAR(50),
 isBack BOOLEAN,
 timeRented DATE,
 lastPay DATE,
 InstrumentID SERIAL
);

ALTER TABLE Renting ADD CONSTRAINT PK_Renting PRIMARY KEY (rentalID);


CREATE TABLE Schedule  (
 weekday VARCHAR(10),
 start TIME(10),
 end TIME(10),
 available  BOOLEAN,
 lessonID SERIAL,
 ID SERIAL
);


CREATE TABLE Sibling (
 ID SERIAL NOT NULL,
 hasSibling BOOLEAN
);

ALTER TABLE Sibling ADD CONSTRAINT PK_Sibling PRIMARY KEY (ID);


CREATE TABLE SiblingList (
 siblingID SERIAL,
 ID SERIAL NOT NULL
);


ALTER TABLE Phone ADD CONSTRAINT FK_Phone_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE Student ADD CONSTRAINT FK_Student_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (ID) REFERENCES Student (ID);


ALTER TABLE StudentList ADD CONSTRAINT FK_StudentList_0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE StudentRent ADD CONSTRAINT FK_StudentRent_0 FOREIGN KEY (ID) REFERENCES Student (ID);


ALTER TABLE Address ADD CONSTRAINT FK_Address_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE Contact_person ADD CONSTRAINT FK_Contact_person_0 FOREIGN KEY (ID) REFERENCES Person (ID);


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
ALTER TABLE relations ADD CONSTRAINT FK_relations_1 FOREIGN KEY (contact_ID,ID) REFERENCES Contact_person (contact_ID,ID);


ALTER TABLE RentalIDList ADD CONSTRAINT FK_RentalIDList_0 FOREIGN KEY (ID) REFERENCES StudentRent (ID);


ALTER TABLE Renting ADD CONSTRAINT FK_Renting_0 FOREIGN KEY (rentalID) REFERENCES RentalIDList (rentalID);
ALTER TABLE Renting ADD CONSTRAINT FK_Renting_1 FOREIGN KEY (InstrumentID ) REFERENCES Intrument (InstrumentID );


ALTER TABLE Schedule  ADD CONSTRAINT FK_Schedule_0 FOREIGN KEY (ID) REFERENCES Instructor (ID);


ALTER TABLE Sibling ADD CONSTRAINT FK_Sibling_0 FOREIGN KEY (ID) REFERENCES Student (ID);


ALTER TABLE SiblingList ADD CONSTRAINT FK_SiblingList_0 FOREIGN KEY (ID) REFERENCES Sibling (ID);


