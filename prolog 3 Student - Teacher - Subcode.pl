% Facts Representing the database with students, teachers, subjects, and subject codes
student(john, 101).
student(susan, 102).
student(mike, 103).

teacher(prof_smith, math, 201).
teacher(prof_doe, history, 202).
teacher(prof_jones, physics, 203).

% Query to get the subject code for a given student
student_subject_code(Student, SubjectCode) :-
    student(Student, SubjectCode).

% Query to get the subject taught by a given teacher
teacher_subject(Teacher, Subject) :-
    teacher(Teacher, Subject, _).

% Query to get the subject code taught by a given teacher
teacher_subject_code(Teacher, SubjectCode) :-
    teacher(Teacher,_, SubjectCode).
%student_subject_code(john, Code).
%teacher_subject(prof_doe, Subject).
%TeacherSubjectCode(ProfJones, Code).
