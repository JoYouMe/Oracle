--1) 송강 교수가 강의하는 과목을 검색한다
SELECT A.PNO
     , A.PNAME
     , B.CNO
     , B.CNAME
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO = B.PNO
    AND A.PNAME = '송강';

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT A.PNO
     , A.PNAME
     , B.CNO
     , B.CNAME
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO = B.PNO
      AND B.CNAME LIKE '%화학%';

--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT A.PNO
     , A.PNAME
     , B.CNO
     , B.CNAME
     , B.ST_NUM
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO = B.PNO
      AND B.ST_NUM = 2;

--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT A.PNO
     , A.PNAME
     , A.SECTION
     , B.CNO
     , B.CNAME
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO = B.PNO
      AND A.SECTION = '화학';

--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT A.SNO
     , A.SNAME
     , A.MAJOR
     , A.SYEAR
     , B.CNO
     , C.CNAME
     , B.RESULT
    FROM STUDENT A
       , SCORE B
       , COURSE C
    WHERE A.SNO = B.SNO
      AND B.CNO = C.CNO
      AND A.MAJOR = '화학'
      AND A.SYEAR = 1
    ORDER BY A.SNO, B.CNO;

--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT A.SNO
     , A.SNAME
     , A.MAJOR
     , A.SYEAR
     , B.CNO
     , C.CNAME
     , B.RESULT
    FROM STUDENT A
       , SCORE B
       , COURSE C
    WHERE A.SNO = B.SNO
      AND B.CNO = C.CNO
      AND C.CNAME = '일반화학'
    ORDER BY A.SYEAR, A.SNO;

--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT A.SNO
     , A.SNAME
     , A.MAJOR
     , A.SYEAR
     , B.CNO
     , C.CNAME
     , B.RESULT
    FROM STUDENT A
       , SCORE B
       , COURSE C
    WHERE A.SNO = B.SNO
      AND B.CNO = C.CNO
      AND A.MAJOR = '화학'
      AND A.SYEAR = 1
      AND C.CNAME = '일반화학'
    ORDER BY A.SNO;

--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT A.SNO
     , A.SNAME
     , A.MAJOR
     , A.SYEAR
     , B.CNO
     , C.CNAME
    FROM STUDENT A
       , SCORE B
       , COURSE C
    WHERE A.SNO = B.SNO
      AND B.CNO = C.CNO
      AND A.SYEAR = 1
      AND A.MAJOR = '화학'
    ORDER BY A.SNO, B.CNO;