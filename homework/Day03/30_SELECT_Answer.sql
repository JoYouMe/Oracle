--1) 각 학과별 학생 수를 검색하세요
SELECT MAJOR
     , COUNT(*)
    FROM STUDENT
    GROUP BY MAJOR;

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요
SELECT MAJOR
     , ROUND(AVG(AVR), 2)
    FROM STUDENT
    GROUP BY MAJOR
    HAVING MAJOR IN ('화학', '생물');

--3) 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 검색하세요
SELECT ORDERS
     , COUNT(*)
    FROM PROFESSOR
    WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) >= 120
    GROUP BY ORDERS;

--4) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%';

--5) 과목명에 화학이 포함된 과목의 학점 총합을 검색하세요
SELECT SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%';

--6) 학과별 기말고사 평균을 성적순으로 검색하세요
SELECT A.SNO
     , B.SNAME
     , ROUND(AVG(RESULT), 2)
    FROM SCORE A
       , STUDENT B
    WHERE A.SNO = B.SNO
    GROUP BY A.SNO, B.SNAME
    ORDER BY ROUND(AVG(RESULT), 2) DESC;

--7) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)
SELECT JOB
     , ROUND(AVG(SAL), 2)
    FROM EMP
    WHERE DNO = '30'
    GROUP BY JOB;

--8) 물리학과 학생 중에 학년별로 성적이 가장 우수한 학생의 평점을 검색하세요
SELECT A.MAJOR
     , A.SYEAR
     , A.SNO
     , A.SNAME
     , B.AVR
    FROM STUDENT A
       , (
            SELECT SYEAR
                 , MAX(AVR) AS AVR
                FROM STUDENT
                WHERE MAJOR = '물리'
                GROUP BY SYEAR
         ) B
    WHERE A.AVR = B.AVR
      AND A.SYEAR = B.SYEAR
      AND MAJOR = '물리';