--SELECT 구문
--지정한 컬럼의 데이터만 조회
SELECT ENO,
       ENAME
    FROM EMP;
--모든 컬럼의 데이터 조회
--* 키워드 이용
SELECT *
FROM EMP;

--조회하는 컬럼이나 테이블에 별칭 붙이기
SELECT ENO 사원번호,
       ENAME 사원이름
   FROM EMP; 
   
SELECT ENO,
       ENAME,
       (SAL / 12) MONTHPAY
    FROM EMP;
    
--NVL
SELECT ENO,
       ENAME,
       COMM
    FROM EMP;

SELECT ENO,
       ENAME,
       --comm컬럼의 데이터가 null인 경우 0으로 표출
       NVL(COMM, 0) AS COMM
    FROM EMP;
    
--연결연산자(||)
SELECT ENO || '-' || ENAME || '-' || SAL AS 사원급여정보
    FROM EMP;
SELECT ENO || '-' || ENAME || '-' || (NVL(SAL, 0) / 12) AS 사원월급정보
    FROM EMP;
    
--중복제거자(DISTINCT)
SELECT * FROM EMP;

SELECT JOB FROM EMP;

SELECT DISTINCT NVL(JOB, '-')
    FROM EMP;
    
SELECT DISTINCT *
    FROM EMP;
    
--정렬할 때 사용하는 ORDER BY 구문
SELECT * FROM EMP
    ORDER BY SAL ASC;

SELECT * FROM EMP
    ORDER BY SAL DESC;
    
SELECT * FROM EMP
    ORDER BY HDATE;
    
--ORDER BY를 통한 묶음 검색
SELECT ENO,
       ENAME,
       JOB
    FROM EMP
    ORDER BY JOB;
    
--ORDER BY 복수 컬럼 정렬
SELECT ENO,
       ENAME,
       JOB
    FROM EMP
    ORDER BY JOB, ENAME;
    
--정렬 기준 컬럼 각각의 정렬 순서 지정
--부서번호는 내림차순, 연봉은 오름차순 정렬
SELECT DNO,
       ENAME,
       SAL
    FROM EMP
    ORDER BY DNO ASC, SAL DESC;
    
--조회하는 컬럼에 별칭을 부여한 경우는 별칭으로 정렬기준 잡아야됨
SELECT DNO AS 부서번호,
       ENAME AS 사원이름,
       SAL AS 연봉
    FROM EMP
    ORDER BY 부서번호 ASC, 연봉 DESC;
    
--조건검색 WHERE 구문
--ENO 9999인 사원 검색
--WHERE 조건 구문은 자료형 맞춰서 비교
SELECT * FROM EMP
    WHERE ENO = '9999';
    
--SELECT * FROM TABLE
--    WHERE DATE = TO_DATE('20000000');
    
--SAL이 3000이상인 사원의 사원번호, 사원이름, 연봉 검색
--ORDER BY는 WHERE 구문 뒤에 사용
--WHERE 구문은 별칭 붙기전에 동작하므로 별칭으로 사용 불가능
SELECT ENO AS 사원번호,
       ENAME AS 사원이름,
       SAL AS 연봉
    FROM EMP
    WHERE SAL >= 3000
    ORDER BY SAL DESC;
    
--SAL이 3000이상이면서 DNO 30인 사원번호, 사원이름, 연봉, 부서번호 조회
SELECT ENO,
       ENAME,
       SAL,
       DNO
    FROM EMP
    WHERE SAL >= 3000
      AND DNO = '30';
SELECT ENO,
       ENAME,
       SAL,
       DNO
    FROM EMP
    WHERE SAL >= 3000
      AND DNO = TO_CHAR(30);
      
--IS NULL
--부서번호가 null사원의 사원번호, 이름, 부서번호 검색
SELECT DISTINCT ENO,
       ENAME,
       DNO
    FROM EMP
    WHERE DNO IS NULL;
    
--IS NOT NULL
SELECT DISTINCT ENO,
       ENAME,
       DNO
    FROM EMP
    WHERE DNO IS NOT NULL;
    
--OR 조건
--DNO이 30이거나 SAL 3000이상인 사원의 사원번호, 이름, 연봉, 부서번호 조회
SELECT ENO,
       ENAME,
       SAL,
       DNO,
       COMM
    FROM EMP
    WHERE DNO = '10'
       OR SAL >= 1600;
       
--DNO이 10이거나 SAL이 1600이상인 사원 중 COMM이 600이상인 사원의 
--사원번호, 사원이름, 연봉, 보너스, 부서번호 검색
--AND가 우선순위가 높아서 OR를 ()묶어서 사용
SELECT ENO,
       ENAME,
       SAL,
       COMM,
       DNO
    FROM EMP
    WHERE (DNO = '10' OR SAL >= 1600)
      AND COMM >= 600;
      
--문자열검색 LIKE
--EMP테이블에서 김씨성을 가진 사원의 데이터 모두 출력
SELECT *
    FROM EMP
    WHERE ENAME LIKE '김%';

--사원이름이 하늘로 끝나는 사원 데이터 모두 출력
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%하늘';
    
--사원이름이 4글자인 사원의 데이터 모두 출력
SELECT *
    FROM EMP
    WHERE ENAME LIKE '____';
    
--SAL이 2000이상 3000미만인 사원의 데이터 모두 출력
SELECT * 
    FROM EMP
    WHERE SAL >= 2000
      AND SAL < 3000;
      
--BETWEEN AND 구문
--SAL이 2000이상 3000이하인 사원의 데이터 모두 출력
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;

--입사입일이 92~96년인 사원 검색
--날짜데이터를 문자열로 비교
SELECT *
    FROM EMP
    WHERE HDATE BETWEEN '1992/01/01' AND '1996/12/31'
    ORDER BY HDATE;

--현재 커넥션된 세션의 날짜포맷 변경
--세션이 바뀔 때마다 실행해야됨
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD:HH24:MI:SS';

--입사입일이 92~96년인 사원 검색(시분초까지 비교)
--날짜데이터를 문자열로 비교
SELECT *
    FROM EMP
    WHERE HDATE BETWEEN '1992/01/01:00:00:00' AND '1996/04/29:23:59:59'
    ORDER BY HDATE;
    
--DNO이 10이거나 20인 사원 데이터 모두 표출
SELECT *
    FROM EMP
    WHERE DNO = '10'
       OR DNO = '20';

--IN 구문
--DNO이 10이거나 20인 사원 데이터 모두 표출
SELECT *
    FROM EMP
    WHERE DNO IN ('10', '20', '30');
    
--업무가 개발이거나 경영인 사원의 데이터 모두 표출
SELECT *
    FROM EMP
    WHERE JOB IN ('개발', '경영');