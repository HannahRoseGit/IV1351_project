create view AS
SELECT
    TO_CHAR(DATE_TRUNC('month', LessonDate), 'YYYY-MM') AS Month,
    COUNT(*) AS TotalLessons,
    SUM(CASE WHEN Type = 'individual' THEN 1 ELSE 0 END) AS IndividualLessons,
    SUM(CASE WHEN Type = 'group' THEN 1 ELSE 0 END) AS GroupLessons,
    SUM(CASE WHEN Type = 'ensemble' THEN 1 ELSE 0 END) AS EnsembleLessons
FROM Lesson
GROUP BY Month
ORDER BY Month;

-- 2
create view AS
SELECT
    SiblingCount,
    COUNT(*) AS StudentCount
FROM (
    SELECT
        s.StudentID,
        COALESCE(COUNT(sl.SiblingID), 0) AS SiblingCount
    FROM Student s
    LEFT JOIN Sibling sl ON s.PersonID = sl.PersonID1 OR s.PersonID = sl.PersonID2
    GROUP BY s.StudentID
) AS StudentSiblingCounts
GROUP BY SiblingCount
ORDER BY SiblingCount;


-- 3
create view AS
SELECT
    i.InstructorID,
    CONCAT(p.FirstName, ' ', p.LastName) AS InstructorName,
    COUNT(l.LessonID) AS LessonsGiven
FROM Instructor i
JOIN Person p ON i.PersonID = p.PersonID
JOIN Lesson l ON i.InstructorID = l.InstructorID
WHERE DATE_TRUNC('month', l.LessonDate) = DATE_TRUNC('month', CURRENT_DATE)
GROUP BY i.InstructorID, InstructorName
HAVING COUNT(l.LessonID) > 2
ORDER BY LessonsGiven DESC;
 
 --4
 
 create materialized view AS
 SELECT
    e.Genre,
    CASE
        WHEN e.MaxSeats - e.CurrentStudents = 0 THEN 'Full'
        WHEN e.MaxSeats - e.CurrentStudents >= 1 AND e.MaxSeats - e.CurrentStudents <= 2 THEN '1-2 seats left'
        ELSE 'More seats left'
    END AS Availability,
    e.DateOfClass AS EnsembleDate
FROM EnsembleLesson e
WHERE e.DateOfClass BETWEEN CURRENT_DATE + INTERVAL '1 day' AND CURRENT_DATE + INTERVAL '7 days'
ORDER BY e.Genre, e.DateOfClass, e.CurrentStudents;








