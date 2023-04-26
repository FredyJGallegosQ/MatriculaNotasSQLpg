-- Database to registration exams and scores

BEGIN;


CREATE TABLE IF NOT EXISTS public."Student"
(
    "IdStudent" serial PRIMARY KEY,
    "Name" character(20) NOT NULL,
    "LastName" character(20) NOT NULL,
    "Age" integer NOT NULL,
    "Email" character varying(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Course"
(
    "IdCourse" serial PRIMARY KEY,
    "Name" character(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS public."TeacherCourse"
(
    "IdTeacherCourse" serial PRIMARY KEY,
    "IdTeacher" integer NOT NULL,
    "IdCourse" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Teacher"
(
    "IdTeacher" serial PRIMARY KEY,
    "Name" character(20) NOT NULL,
    "LastName" character(20) NOT NULL,
    "Email" character varying(20)
);

CREATE TABLE IF NOT EXISTS public."Semester"
(
    "IdSemester" serial PRIMARY KEY,
    "IdEP" integer NOT NULL,
    "IdCourse" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."PS"
(
    "IdPS" serial PRIMARY KEY,
    "Name" character(20) NOT NULL,
    "IdFacultad" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Facultad"
(
    "IdFacultad" serial PRIMARY KEY,
    "Name" character(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Registration"
(
    "IdRegistration" serial PRIMARY KEY,
    "IdStudent" integer NOT NULL,
    "IdSemester" integer NOT NULL,
    "IdPS" integer NOT NULL,
    "IdCourse" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."CourseRegistration"
(
	"IdCourseRegistration" serial PRIMARY KEY,
    "IdRegistration" integer NOT NULL,
    "IdCourse" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Chapter"
(
    "IdChapter" serial PRIMARY KEY,
    "Name" character(20) NOT NULL,
    "IdCourse" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Exam"
(
    "IdExam" serial PRIMARY KEY,
    "Date" date NOT NULL,
    "Score" numeric(2) NOT NULL,
    "IdChapter" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Question"
(
    "IdQuestion" serial PRIMARY KEY,
    "Question" character(100) NOT NULL,
    "IdExam" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Alternatives"
(
	"IdAlternatives" serial PRIMARY KEY,
    "Alternative1" character(20) NOT NULL,
    "Alternative2" character(20) NOT NULL,
    "Alternative3" character(20) NOT NULL,
    "Alternative4" character(20) NOT NULL,
    "Alternative5" character(20) NOT NULL,
    "Answer" character(20) NOT NULL,
    "IdQuestion" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Answer"
(
	"IdAnswer" serial PRIMARY KEY,
    "IdQuestion" integer NOT NULL,
    "Answer" character(20) NOT NULL
);

ALTER TABLE IF EXISTS public."TeacherCourse"
    ADD FOREIGN KEY ("IdCourse")
    REFERENCES public."Course" ("IdCourse") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TeacherCourse"
    ADD FOREIGN KEY ("IdTeacher")
    REFERENCES public."Teacher" ("IdTeacher") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PS"
    ADD FOREIGN KEY ("IdFacultad")
    REFERENCES public."Facultad" ("IdFacultad") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Registration"
    ADD FOREIGN KEY ("IdStudent")
    REFERENCES public."Student" ("IdStudent") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Registration"
    ADD FOREIGN KEY ("IdSemester")
    REFERENCES public."Semester" ("IdSemester") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Registration"
    ADD FOREIGN KEY ("IdPS")
    REFERENCES public."PS" ("IdPS") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."CourseRegistration"
    ADD FOREIGN KEY ("IdRegistration")
    REFERENCES public."Registration" ("IdRegistration") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."CourseRegistration"
    ADD FOREIGN KEY ("IdCourse")
    REFERENCES public."Course" ("IdCourse") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Chapter"
    ADD FOREIGN KEY ("IdCourse")
    REFERENCES public."Course" ("IdCourse") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Exam"
    ADD FOREIGN KEY ("IdChapter")
    REFERENCES public."Chapter" ("IdChapter") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Question"
    ADD FOREIGN KEY ("IdExam")
    REFERENCES public."Exam" ("IdExam") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Alternatives"
    ADD FOREIGN KEY ("IdQuestion")
    REFERENCES public."Question" ("IdQuestion") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Answer"
    ADD FOREIGN KEY ("IdQuestion")
    REFERENCES public."Question" ("IdQuestion") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;