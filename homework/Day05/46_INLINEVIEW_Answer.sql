--1) 4.5 환산 평점이 가장 높은 3인의 학생을 검색하세요.
SELECT ROWNUM
     , SNO
     , SNAME
     , AVR
    FROM (
            SELECT SNO
                 , SNAME
                 , ROUND(AVR * 4.5 / 4.0, 2) AS AVR
                FROM STUDENT
                ORDER BY AVR DESC, SNO
         )
    WHERE ROWNUM <= 3;

--2) 기말고사 과목별 평균이 높은 3과목을 검색하세요.
SELECT ROWNUM
     , A.CNO
     , A.CNAME
     , B.RESULT
    FROM COURSE A
       , (
            SELECT CNO
                 , ROUND(AVG(RESULT), 2) AS RESULT
                FROM SCORE
                GROUP BY CNO
                ORDER BY RESULT DESC
         ) B
    WHERE A.CNO = B.CNO
      AND ROWNUM <= 3;

--3) 학과별, 학년별, 기말고사 평균이 순위 3까지를 검색하세요.(학과, 학년, 평균점수 검색)
SELECT ROWNUM
     , MAJOR
     , SYEAR
     , RESULT
    FROM (
            SELECT A.MAJOR
                 , A.SYEAR
                 , ROUND(AVG(B.RESULT), 2) AS RESULT
                FROM STUDENT A
                   , SCORE B
                WHERE A.SNO = B.SNO
                GROUP BY A.MAJOR, A.SYEAR
                ORDER BY RESULT DESC
         )
    WHERE ROWNUM <= 3;

--4) 기말고사 성적이 높은 과목을 담당하는 교수 3인을 검색하세요.(교수이름, 과목명, 평균점수 검색)
SELECT ROWNUM
     , A.PNAME
     , B.CNAME
     , B.RESULT
    FROM PROFESSOR A
       , (
            SELECT C.CNAME
                 , C.PNO
                 , ROUND(AVG(D.RESULT), 2) AS RESULT
                FROM COURSE C
                   , SCORE D
                WHERE C.CNO = D.CNO
                GROUP BY C.CNAME, C.PNO
                ORDER BY RESULT DESC
         ) B
    WHERE A.PNO = B.PNO
      AND ROWNUM <= 3;

--5) 교수별로 현재 수강중인 학생의 수를 검색하세요.
SELECT A.PNO
     , A.PNAME
     , B.CNT
    FROM PROFESSOR A
       , (
            SELECT C.PNO
                 , COUNT(D.SNO) AS CNT
                FROM COURSE C
                   , SCORE D
                WHERE C.CNO = D.CNO
                GROUP BY C.PNO
         ) B
    WHERE A.PNO = B.PNO;