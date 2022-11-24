CREATE TABLE Lesson (
 LessonID CHAR(10) NOT NULL,
 InstructorID CHAR(10) NOT NULL,
 Price CHAR(10),
 Level CHAR(10)
);

INSERT INTO lesson(lessonID,InstuctorID, Price, Level) values(100001, 807654, 500, Beginner);
INSERT INTO lesson(lessonID,InstuctorID, Price, Level) values(100002, 582003, 600, Intermediate);
INSERT INTO lesson(lessonID,InstuctorID, Price, Level) values(100003, 402234, 700, Advance);

ALTER TABLE Lesson ADD CONSTRAINT PK_Lesson PRIMARY KEY (LessonID);


CREATE TABLE Person (
 ID CHAR(10) NOT NULL,
 lastName CHAR(50),
 firstName CHAR(50),
 age INT
);

INSERT INTO Person(ID,lastName, firstName, age) values(48594, Holloway, Derek, 13);
INSERT INTO Person(ID,lastName, firstName, age) values(95820, Rudd, Makenzie, 45);

ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (ID);


CREATE TABLE Phone (
 ID CHAR(10) NOT NULL,
 phoneNum CHAR(10)
);

ALTER TABLE Phone ADD CONSTRAINT PK_Phone PRIMARY KEY (ID);


CREATE TABLE Student  (
 ID CHAR(10) NOT NULL,
 studentID CHAR(10) NOT NULL,
 level CHAR(10)
);

ALTER TABLE Student  ADD CONSTRAINT PK_Student  PRIMARY KEY (ID);


CREATE TABLE student_payment (
 ID CHAR(10) NOT NULL,
 lastPayment DATE,
 nextPayment DATE
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (ID);


CREATE TABLE StudentApplications (
 ID CHAR(10) NOT NULL,
 hasAppli CHAR(10)
);

ALTER TABLE StudentApplications ADD CONSTRAINT PK_StudentApplications PRIMARY KEY (ID);


CREATE TABLE StudentList (
 LessonID CHAR(10) NOT NULL,
 studentID CHAR(10) NOT NULL
);

ALTER TABLE StudentList ADD CONSTRAINT PK_StudentList PRIMARY KEY (LessonID);


CREATE TABLE StudentRent (
 ID CHAR(10) NOT NULL,
 isRenting CHAR(10),
 NumRenting INT
);

ALTER TABLE StudentRent ADD CONSTRAINT PK_StudentRent PRIMARY KEY (ID);


CREATE TABLE 	Address (
 ID CHAR(10) NOT NULL,
 street  CHAR(10),
 zip CHAR(10),
 city CHAR(10)
);

ALTER TABLE 	Address ADD CONSTRAINT PK_	Address PRIMARY KEY (ID);


CREATE TABLE AppliList (
 appliID CHAR(10) NOT NULL,
 ID CHAR(10) NOT NULL
);

ALTER TABLE AppliList ADD CONSTRAINT PK_AppliList PRIMARY KEY (appliID,ID);


CREATE TABLE ContactPerson (
 ID CHAR(10) NOT NULL,
 relation CHAR(50)
);

ALTER TABLE ContactPerson ADD CONSTRAINT PK_ContactPerson PRIMARY KEY (ID);


CREATE TABLE Email (
 ID CHAR(10) NOT NULL,
 email CHAR(10)
);

ALTER TABLE Email ADD CONSTRAINT PK_Email PRIMARY KEY (ID);


CREATE TABLE Ensemble (
 LessonID CHAR(10) NOT NULL,
 minSeats INT,
 MaxSeats INT,
 Genre CHAR(50)
);

ALTER TABLE Ensemble ADD CONSTRAINT PK_Ensemble PRIMARY KEY (LessonID);


CREATE TABLE groupLessons (
 LessonID CHAR(10) NOT NULL,
 minSeats INT,
 MaxSeats INT
);

ALTER TABLE groupLessons ADD CONSTRAINT PK_groupLessons PRIMARY KEY (LessonID);


CREATE TABLE Individual lessons  (
 LessonID CHAR(10) NOT NULL,
 Instrument CHAR(50)
);

ALTER TABLE Individual lessons  ADD CONSTRAINT PK_Individual lessons  PRIMARY KEY (LessonID);


CREATE TABLE Instructor  (
 ID CHAR(10) NOT NULL,
 payDate DATE
);

ALTER TABLE Instructor  ADD CONSTRAINT PK_Instructor  PRIMARY KEY (ID);


CREATE TABLE InstrumentList (
 LessonID CHAR(10) NOT NULL,
 instrumentType CHAR(50)
);

ALTER TABLE InstrumentList ADD CONSTRAINT PK_InstrumentList PRIMARY KEY (LessonID);


CREATE TABLE Lesson-person (
 ID CHAR(10) NOT NULL,
 LessonID CHAR(10) NOT NULL
);

ALTER TABLE Lesson-person ADD CONSTRAINT PK_Lesson-person PRIMARY KEY (ID,LessonID);


CREATE TABLE lessonsList (
 ID CHAR(10) NOT NULL,
 lessonID CHAR(10)
);

ALTER TABLE lessonsList ADD CONSTRAINT PK_lessonsList PRIMARY KEY (ID);


CREATE TABLE RentalIDList (
 rentalID CHAR(10) NOT NULL,
 ID CHAR(10) NOT NULL
);

ALTER TABLE RentalIDList ADD CONSTRAINT PK_RentalIDList PRIMARY KEY (rentalID,ID);


CREATE TABLE Renting (
 rentalID CHAR(10) NOT NULL,
 ID CHAR(10) NOT NULL,
 instrument CHAR(50),
 isBack CHAR(10),
 instrumentID CHAR(10) NOT NULL,
 timeRented DATE,
 lastPay DATE
);

ALTER TABLE Renting ADD CONSTRAINT PK_Renting PRIMARY KEY (rentalID,ID);


CREATE TABLE Sibling (
 ID CHAR(10) NOT NULL,
 hasSibling CHAR(10)
);

ALTER TABLE Sibling ADD CONSTRAINT PK_Sibling PRIMARY KEY (ID);


CREATE TABLE SiblingList (
 ID CHAR(10) NOT NULL,
 siblingID CHAR(10)
);

ALTER TABLE SiblingList ADD CONSTRAINT PK_SiblingList PRIMARY KEY (ID);


CREATE TABLE Application (
 appliID CHAR(10) NOT NULL,
 ID CHAR(10) NOT NULL,
 LessonID CHAR(10) NOT NULL,
 status CHAR(50),
 applicationTime DATE
);

ALTER TABLE Application ADD CONSTRAINT PK_Application PRIMARY KEY (appliID,ID,LessonID);


CREATE TABLE Intrument (
 rentalID CHAR(10) NOT NULL,
 ID CHAR(10) NOT NULL,
 Brand  CHAR(50),
 Type  CHAR(50),
 Availblity CHAR(10),
 InstrumentID  CHAR(10) NOT NULL,
 Price  DOUBLE PRECISION
);

ALTER TABLE Intrument ADD CONSTRAINT PK_Intrument PRIMARY KEY (rentalID,ID);


ALTER TABLE Phone ADD CONSTRAINT FK_Phone_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE Student  ADD CONSTRAINT FK_Student _0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (ID) REFERENCES Student  (ID);


ALTER TABLE StudentApplications ADD CONSTRAINT FK_StudentApplications_0 FOREIGN KEY (ID) REFERENCES Student  (ID);


ALTER TABLE StudentList ADD CONSTRAINT FK_StudentList_0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE StudentRent ADD CONSTRAINT FK_StudentRent_0 FOREIGN KEY (ID) REFERENCES Student  (ID);


ALTER TABLE 	Address ADD CONSTRAINT FK_	Address_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE AppliList ADD CONSTRAINT FK_AppliList_0 FOREIGN KEY (ID) REFERENCES StudentApplications (ID);


ALTER TABLE ContactPerson ADD CONSTRAINT FK_ContactPerson_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE Email ADD CONSTRAINT FK_Email_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE Ensemble ADD CONSTRAINT FK_Ensemble_0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE groupLessons ADD CONSTRAINT FK_groupLessons_0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE Individual lessons  ADD CONSTRAINT FK_Individual lessons _0 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE Instructor  ADD CONSTRAINT FK_Instructor _0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE InstrumentList ADD CONSTRAINT FK_InstrumentList_0 FOREIGN KEY (LessonID) REFERENCES Ensemble (LessonID);


ALTER TABLE Lesson-person ADD CONSTRAINT FK_Lesson-person_0 FOREIGN KEY (ID) REFERENCES Person (ID);
ALTER TABLE Lesson-person ADD CONSTRAINT FK_Lesson-person_1 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE lessonsList ADD CONSTRAINT FK_lessonsList_0 FOREIGN KEY (ID) REFERENCES Person (ID);


ALTER TABLE RentalIDList ADD CONSTRAINT FK_RentalIDList_0 FOREIGN KEY (ID) REFERENCES StudentRent (ID);


ALTER TABLE Renting ADD CONSTRAINT FK_Renting_0 FOREIGN KEY (rentalID,ID) REFERENCES RentalIDList (rentalID,ID);


ALTER TABLE Sibling ADD CONSTRAINT FK_Sibling_0 FOREIGN KEY (ID) REFERENCES Student  (ID);


ALTER TABLE SiblingList ADD CONSTRAINT FK_SiblingList_0 FOREIGN KEY (ID) REFERENCES Sibling (ID);


ALTER TABLE Application ADD CONSTRAINT FK_Application_0 FOREIGN KEY (appliID,ID) REFERENCES AppliList (appliID,ID);
ALTER TABLE Application ADD CONSTRAINT FK_Application_1 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID);


ALTER TABLE Intrument ADD CONSTRAINT FK_Intrument_0 FOREIGN KEY (rentalID,ID) REFERENCES RentalIDList (rentalID,ID);



