-- General Lesson Information
CREATE TABLE Lesson (
    LessonID SERIAL PRIMARY KEY,
    Price DECIMAL(10, 2),
    LessonDate DATE,
    StartTime TIME,
    EndTime TIME,
    InstructorID INT REFERENCES Instructor(InstructorID),
    Level VARCHAR(20),
    Type VARCHAR(20)

);

-- Ensemble Lessons
CREATE TABLE EnsembleLesson (
    LessonID INT PRIMARY KEY REFERENCES Lesson(LessonID),
    MinSeats INT,
    MaxSeats INT,
    Genre VARCHAR(20),
    CurrentStudents INT,
    DateOfClass DATE,
    Level VARCHAR(20) -- Add level attribute
);

-- Group Lessons
CREATE TABLE GroupLesson (
    LessonID INT PRIMARY KEY REFERENCES Lesson(LessonID),
    MinSeats INT,
    MaxSeats INT,
    Instrument VARCHAR(20),
    Level VARCHAR(20) -- Add level attribute
);

-- Individual Lessons
CREATE TABLE IndividualLesson (
    LessonID INT PRIMARY KEY REFERENCES Lesson(LessonID),
    Instrument CHAR(50),
    Level VARCHAR(20) -- Add level attribute
);

CREATE TABLE Instrument (
    InstrumentID SERIAL PRIMARY KEY,
    Brand VARCHAR(50),
    Type VARCHAR(50),
    Availability BOOLEAN,
    Price DECIMAL(10, 2)
);

CREATE TABLE Person (
    PersonID SERIAL PRIMARY KEY,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    Age INT
);

CREATE TABLE ContactInfo (
    ContactID SERIAL PRIMARY KEY,
    PersonID INT REFERENCES Person(PersonID),
    PhoneNumber VARCHAR(20),
    EmailAddress VARCHAR(50),
    Street VARCHAR(50),
    Zip VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Student (
    StudentID SERIAL PRIMARY KEY,
    PersonID INT REFERENCES Person(PersonID),
    Level VARCHAR(20)
);

CREATE TABLE Instructor (
    InstructorID SERIAL PRIMARY KEY,
    PersonID INT REFERENCES Person(PersonID),
    PayDate DATE
);

CREATE TABLE Enrollment (
    EnrollmentID SERIAL PRIMARY KEY,
    StudentID INT REFERENCES Student(StudentID),
    LessonID INT REFERENCES Lesson(LessonID)
);

CREATE TABLE Rental (
    RentalID SERIAL PRIMARY KEY,
    StudentID INT REFERENCES Student(StudentID),
    InstrumentID INT REFERENCES Instrument(InstrumentID),
    RentalDate DATE,
    ReturnDate DATE
);

CREATE TABLE Sibling (
    SiblingID SERIAL PRIMARY KEY,
    PersonID1 INT REFERENCES Person(PersonID),
    PersonID2 INT REFERENCES Person(PersonID)
);

CREATE TABLE StudentPayment (
    PaymentID SERIAL PRIMARY KEY,
    StudentID INT REFERENCES Student(StudentID),
    PaymentDate DATE,
    Amount DECIMAL(10, 2)
);


