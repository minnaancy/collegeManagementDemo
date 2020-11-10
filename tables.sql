<----------Tables------------------->

CREATE TABLE public.usertype (
	usertypeid serial NOT NULL,
	usertype varchar(45) NULL,
	CONSTRAINT usertype_pkey PRIMARY KEY (usertypeid)
);


CREATE TABLE public.userreg (
	userregid serial NOT NULL,
	username varchar(45) NULL,
	"password" varchar(200) NULL,
	usertypeid int4 NULL,
	CONSTRAINT userreg_pkey PRIMARY KEY (userregid),
	CONSTRAINT userreg_user_type_id_fkey FOREIGN KEY (usertypeid) REFERENCES usertype(usertypeid)
);

CREATE TABLE public.department (
	deptid serial NOT NULL,
	deptname varchar(100) NULL,
	CONSTRAINT department_pkey PRIMARY KEY (deptid)
);

CREATE TABLE public.course (
	courseid serial NOT NULL,
	coursename varchar(50) NULL,
	duration int4 NULL,
	deptid int4 NULL,
	CONSTRAINT course_pkey PRIMARY KEY (courseid),
	CONSTRAINT course_fkey FOREIGN KEY (deptid) REFERENCES department(deptid)
);


CREATE TABLE public.student (
	studid serial NOT NULL,
	firstname varchar(50) NULL,
	address varchar(500) NULL,
	dob date NULL,
	mobile_no varchar(45) NULL,
	emailid varchar NULL,
	gender varchar(50) NULL,
	courseid int4 NULL,
	lastname varchar NULL,
	guardianname varchar NULL,
	guardiannumber varchar NULL,
	CONSTRAINT student_pkey PRIMARY KEY (studid),
	CONSTRAINT student_fkey FOREIGN KEY (courseid) REFERENCES course(courseid)
);