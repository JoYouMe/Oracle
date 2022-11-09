--<단일 행 함수를 이용하세요>
--1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
SELECT PNO
     , PNAME
     , TRUNC(LAST_DAY(HIREDATE)) - TRUNC(HIREDATE)
    FROM PROFESSOR;

--2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
SELECT PNO
     , PNAME
     , TRUNC((SYSDATE - HIREDATE) / 7)
    FROM PROFESSOR;

--3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT PNO
     , PNAME
     , HIREDATE
    FROM PROFESSOR
    WHERE TRUNC(HIREDATE, 'YYYY') BETWEEN TO_DATE('1991', 'YYYY') AND TO_DATE('1995', 'YYYY');

--4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT SNO
     , SNAME
     , ROUND(AVR * 4.5 / 4.0, 2)
    FROM STUDENT
    ORDER BY SNO;

--5) 사원들의 오늘까지 근무 기간이 몇 년 몇 개월 며칠인지 검색하세요
SELECT ENO
     , ENAME
     , TRUNC(MONTHS_BETWEEN(SYSDATE, HDATE) / 12) || '년 ' ||
       MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, HDATE)), 12) || '개월 ' ||
       TRUNC(SYSDATE - ADD_MONTHS(HDATE, MONTHS_BETWEEN(SYSDATE, HDATE))) || '일'
    FROM EMP;