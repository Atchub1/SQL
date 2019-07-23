-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/rfo8fl
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS "departments"  CASCADE;
CREATE TABLE "departments" (
    "dept_no" VARCHAR PRIMARY KEY ,
    "dept_name" VARCHAR   NOT NULL

);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no")
);

DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
	 FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);


CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	FOREIGN KEY("emp_no")REFERENCES "employees" ("emp_no")
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
	FOREIGN KEY("emp_no")REFERENCES "employees" ("emp_no")
);

SELECT * FROM titles







