-- creating the tables 

CREATE TABLE Intrument (
 InstrumentID SERIAL PRIMARY KEY,
 Brand  CHAR(50),
 Type  CHAR(50),
 Availblity BOOLEAN,
 Price  FLOAT(10)
);



CREATE TABLE Lesson (
 LessonID SERIAL PRIMARY KEY,
 InstructorID SERIAL NOT NULL,
 Price FLOAT(10),
 Level VARCHAR(20),
 date date,
 type VARCHAR(20)
);



CREATE TABLE Person (
 ID SERIAL PRIMARY KEY,
 lastName VARCHAR(50),
 firstName VARCHAR(50),
 age INT
);



CREATE TABLE Phone (
 ID SERIAL PRIMARY KEY,
 phoneNum VARCHAR(20),
 FOREIGN KEY (ID) REFERENCES Person (ID)
);



CREATE TABLE Student (
 ID SERIAL PRIMARY KEY,
 level CHAR(20),
 FOREIGN KEY (ID) REFERENCES Person (ID)
);



CREATE TABLE student_payment (
 ID SERIAL PRIMARY KEY,
 lastPayment DATE,
 nextPayment DATE,
 FOREIGN KEY (ID) REFERENCES Student (ID)
);



CREATE TABLE StudentList (
 studentID SERIAL NOT NULL,
 LessonID SERIAL NOT NULL,
 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID)
);


CREATE TABLE StudentRent (
 ID SERIAL PRIMARY KEY,
 isRenting BOOLEAN,
 NumRenting INT,
 FOREIGN KEY (ID) REFERENCES Student (ID)
);



CREATE TABLE Address (
 ID SERIAL PRIMARY KEY,
 street  VARCHAR(50),
 zip VARCHAR(50),
 city VARCHAR(50),
 FOREIGN KEY (ID) REFERENCES Person (ID)
);



CREATE TABLE Contact_person (
 contact_ID VARCHAR(20) PRIMARY KEY,
 ID SERIAL NOT NULL,
 lastName VARCHAR(50),
 firstName VARCHAR(50),
 FOREIGN KEY (ID) REFERENCES Person (ID)
);



CREATE TABLE Email (
 ID SERIAL PRIMARY KEY,
 email VARCHAR(50),
 FOREIGN KEY (ID) REFERENCES Person (ID)
);



CREATE TABLE Ensemble (
 LessonID SERIAL PRIMARY KEY,
 minSeats INT,
 MaxSeats INT,
 Genre VARCHAR(20),
 current_students INT,
 dateOfClass date,
 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID)
);



CREATE TABLE group_lessons (
 LessonID SERIAL PRIMARY KEY,
 minSeats INT,
 MaxSeats INT,
 instrument character varying(20),
 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID)
);



CREATE TABLE Individual_lessons (
 LessonID SERIAL PRIMARY KEY,
 Instrument CHAR(50),
 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID)
);



CREATE TABLE Instructor (
 ID SERIAL PRIMARY KEY,
 payDate DATE,
 FOREIGN KEY (ID) REFERENCES Person (ID)
);



CREATE TABLE InstrumentList (
 LessonID SERIAL PRIMARY KEY,
 instrumentType VARCHAR(20),
 FOREIGN KEY (LessonID) REFERENCES Ensemble (LessonID)
);



CREATE TABLE Lesson_person (
 ID SERIAL NOT NULL,
 LessonID VARCHAR(20) NOT NULL,
 FOREIGN KEY (ID) REFERENCES Person (ID),
 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID)
);


CREATE TABLE lessonsList (
 lessonID SERIAL,
 ID SERIAL NOT NULL,
 FOREIGN KEY (ID) REFERENCES Person (ID)
);


CREATE TABLE relations (
 ID SERIAL,
 relation VARCHAR(50),
 contact_ID SERIAL,
 FOREIGN KEY (ID) REFERENCES Student (ID),
 FOREIGN KEY (contact_ID,ID) REFERENCES Contact_person (contact_ID,ID)
);


CREATE TABLE RentalIDList (
 rentalID SERIAL PRIMARY KEY,
 ID SERIAL NOT NULL,
 FOREIGN KEY (ID) REFERENCES StudentRent (ID)
);



CREATE TABLE Renting (
 rentalID SERIAL PRIMARY KEY,
 instrument CHAR(50),
 isBack BOOLEAN,
 timeRented DATE,
 lastPay DATE,
 InstrumentID SERIAL,
 FOREIGN KEY (rentalID) REFERENCES RentalIDList (rentalID),
 FOREIGN KEY (InstrumentID ) REFERENCES Intrument (InstrumentID)
);



CREATE TABLE Schedule (
 classDays VARCHAR(10),
 startTime TIME,
 endTime TIME,
 available  BOOLEAN,
 lessonID SERIAL,
 ID SERIAL,
 FOREIGN KEY (ID) REFERENCES Instructor (ID)
);


CREATE TABLE Sibling (
 ID SERIAL PRIMARY KEY,
 hasSibling BOOLEAN,
 FOREIGN KEY (ID) REFERENCES Student (ID)
);



CREATE TABLE SiblingList (
 siblingID SERIAL,
 ID SERIAL NOT NULL,
 FOREIGN KEY (ID) REFERENCES Sibling (ID)
);



