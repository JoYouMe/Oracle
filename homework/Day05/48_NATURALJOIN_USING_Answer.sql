--<NATURAL JOIN과 USING 구문을 이용한 쿼리를 두 개 생성하세요.>
--1) 송강 교수가 강의하는 과목을 검색하세요.
SELECT PNO
     , PNAME
     , CNO
     , CNAME
    FROM PROFESSOR
    NATURAL JOIN COURSE
    WHERE PNAME = '송강';

SELECT PNO
     , PNAME
     , CNO
     , CNAME
    FROM PROFESSOR
    JOIN COURSE USING (PNO)
    WHERE PNAME = '송강';    

--2) 학점이 2학점인 과목과 이를 강의하는 교수를 검색하세요.
SELECT PNO
     , PNAME
     , CNO
     , CNAME
     , ST_NUM
    FROM PROFESSOR
    NATURAL JOIN COURSE
    WHERE ST_NUM = 2;
    
SELECT PNO
     , PNAME
     , CNO
     , CNAME
     , ST_NUM
    FROM PROFESSOR
    NATURAL JOIN COURSE
    WHERE ST_NUM = 2;

--3) 화학과 1학년 학생의 기말고사 성적을 검색하세요.
SELECT SNO
     , SNAME
     , MAJOR
     , SYEAR
     , RESULT
    FROM STUDENT
    NATURAL JOIN SCORE
    WHERE MAJOR = '화학'
      AND SYEAR = 1;
      
SELECT SNO
     , SNAME
     , MAJOR
     , SYEAR
     , RESULT
    FROM STUDENT
    JOIN SCORE USING(SNO)
    WHERE MAJOR = '화학'
      AND SYEAR = 1;

--4) 일반화학 과목의 기말고사 점수를 검색하세요.
SELECT CNO
     , CNAME
     , SNO
     , RESULT
    FROM COURSE
    NATURAL JOIN SCORE
    WHERE CNAME = '일반화학1';
    
SELECT CNO
     , CNAME
     , SNO
     , RESULT
    FROM COURSE
    JOIN SCORE USING(CNO)
    WHERE CNAME = '일반화학1';