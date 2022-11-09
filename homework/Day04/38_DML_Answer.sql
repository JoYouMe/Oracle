--1) 모든 학생의 성적을 4.5만점 기준으로 수정하세요
UPDATE STUDENT
    SET AVR = NVL(AVR, 0) * 4.5 / 4.0;

--2) 모든 교수의 부임일자를 100일 앞으로 수정하세요
UPDATE PROFESSOR
    SET HIREDATE = HIREDATE - 100;

--3) 화학과 2학년 학생의 정보를 삭제하세요
DELETE FROM STUDENT
    WHERE MAJOR = '화학'
      AND SYEAR = 2;

--4) 조교수의 정보를 삭제하세요
DELETE FROM PROFESSOR
    WHERE ORDERS = '조교수';