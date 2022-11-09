--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT MAJOR
     , ROUND(AVG(AVR), 2)
    FROM STUDENT
    GROUP BY MAJOR
    HAVING MAJOR != '화학';

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT MAJOR
     , ROUND(AVG(AVR), 2)
    FROM STUDENT
    WHERE MAJOR != '화학'
    GROUP BY MAJOR
    HAVING ROUND(AVG(AVR), 2) >= 2.0;

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT A.SNO
     , A.SNAME
     , B.RESULT
    FROM STUDENT A
       , (
            SELECT SNO
                 , ROUND(AVG(RESULT), 2) AS RESULT
                FROM SCORE
                GROUP BY SNO
         ) B
    WHERE A.SNO = B.SNO
      AND B.RESULT >= 60;

--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT A.PNO
     , A.PNAME
     , SUM(B.ST_NUM)
    FROM PROFESSOR A
       , COURSE B
    WHERE A.PNO = B.PNO
    GROUP BY A.PNO, A.PNAME
    HAVING SUM(B.ST_NUM) >= 3;

--5) 기말고사 평균 성적이 핵 화학과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요
SELECT A.CNO
     , A.CNAME
     , A.RESULT
     , B.PNO
     , B.PNAME
    FROM (
            SELECT C.CNO
                 , C.CNAME
                 , C.PNO
                 , ROUND(AVG(D.RESULT), 2) AS RESULT
                FROM COURSE C
                   , SCORE D
                WHERE C.CNO = D.CNO
                GROUP BY C.CNO, C.CNAME, C.PNO
         ) A
       , PROFESSOR B
    WHERE A.PNO = B.PNO
      AND A.RESULT > (
                        SELECT ROUND(AVG(D.RESULT), 2)
                            FROM COURSE C
                               , SCORE D
                            WHERE C.CNO = D.CNO
                            GROUP BY C.CNO, C.CNAME
                            HAVING C.CNAME = '핵화학'
                     );    

--6) 근무 중인 직원이 4명 이상인 부서를 검색하세요
SELECT A.DNO
     , A.DNAME
     , COUNT(*)
    FROM DEPT A
       , EMP B
    WHERE A.DNO = B.DNO
    GROUP BY A.DNO, A.DNAME
    HAVING COUNT(*) >= 4;

--7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT JOB
     , ROUND(AVG(SAL), 2)
    FROM EMP
    GROUP BY JOB
    HAVING AVG(SAL) >= 3000;

--8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT MAJOR
     , SYEAR
     , COUNT(*)
    FROM STUDENT
    GROUP BY MAJOR, SYEAR
    HAVING COUNT(*) >= 5
    ORDER BY MAJOR, SYEAR;