--1) 학생중에 동명이인을 검색한다
SELECT DISTINCT A.SNO
     , A.SNAME
    FROM STUDENT A
       , STUDENT B
    WHERE A.SNAME = B.SNAME
      AND A.SNO != B.SNO
    ORDER BY A.SNAME, A.SNO;

--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
SELECT A.PNO
     , A.PNAME
     , A.SECTION
     , B.CNO
     , B.CNAME
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO = B.PNO(+)
    ORDER BY A.SECTION;

--3) 이번 학기 등록된 모드 과목과 담당 교수의 학점 순으로 검색한다
SELECT A.CNO
     , A.CNAME
     , A.ST_NUM
     , B.PNO
     , B.PNAME
    FROM COURSE A
       , PROFESSOR B
    WHERE A.PNO = B.PNO(+)
    ORDER BY A.ST_NUM, A.CNO;