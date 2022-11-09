--1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT A.CNO
     , A.CNAME
     , B.PNO
     , B.PNAME
    FROM COURSE A
       , PROFESSOR B
    WHERE A.PNO = B.PNO
    ORDER BY A.CNO;

--2) 화학과 학생의 기말고사 성적을 모두 검색하라
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
    ORDER BY A.SYEAR, A.SNO, B.CNO;

--3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT A.SNO
     , A.SNAME
     , A.SYEAR
     , B.CNO
     , C.CNAME
     , B.RESULT
    FROM STUDENT A
       , SCORE B
       , COURSE C
    WHERE A.SNO = B.SNO
      AND B.CNO = C.CNO
      AND C.CNAME = '유기화학'
    ORDER BY A.SYEAR, A.SNO;

--4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
SELECT A.SNO
     , A.SNAME
     , A.MAJOR
     , A.SYEAR
     , B.CNO
     , C.CNAME
     , D.PNO
     , D.PNAME
    FROM STUDENT A
       , SCORE B
       , COURSE C
       , PROFESSOR D
    WHERE A.SNO = B.SNO
      AND B.CNO = C.CNO
      AND C.PNO = D.PNO
      AND A.MAJOR = '화학'
    ORDER BY A.SYEAR, A.SNO;

--5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT A.PNO
     , A.PNAME
     , A.SECTION
     , B.CNO
     , B.CNAME
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO = B.PNO;

--6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)
SELECT A.PNO
     , A.PNAME
     , A.SECTION
     , B.CNO
     , B.CNAME
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO = B.PNO(+)
UNION
SELECT A.PNO
     , A.PNAME
     , A.SECTION
     , B.CNO
     , B.CNAME
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO(+) = B.PNO;
