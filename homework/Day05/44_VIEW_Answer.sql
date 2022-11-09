--1) 학생의 학점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW ST_AVR (
    SNO,
    SNAME,
    MAJOR,
    AVR
) AS (
    SELECT SNO
         , SNAME
         , MAJOR
         , ROUND(AVR * 4.5 / 4.0, 2)
        FROM STUDENT
);

SELECT * FROM ST_AVR;

--2) 각 과목별 평균 점수를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW CO_RESULT (
    CNO,
    CNAME,
    RESULT_AVG
) AS (
    SELECT A.CNO
         , A.CNAME
         , ROUND(AVG(B.RESULT), 2)
        FROM COURSE A
           , SCORE B
        WHERE A.CNO = B.CNO
        GROUP BY A.CNO, A.CNAME
);

SELECT * FROM CO_RESULT;

--3) 각 사원과 관리자의 이름을 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW EMP_MGR (
    ENO,
    ENAME,
    MGR,
    MGR_NAME
) AS (
    SELECT A.ENO
         , A.ENAME
         , B.ENO
         , B.ENAME
        FROM EMP A
           , EMP B
        WHERE A.MGR = B.ENO
);

SELECT * FROM EMP_MGR;

--4) 각 과목별 기말고사 평가 등급(A~F)까지와 해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW ST_SCORE (
    SNO,
    SNAME,
    CNO,
    CNAME,
    RESULT,
    GRADE
) AS (
    SELECT A.SNO
         , A.SNAME
         , B.CNO
         , B.CNAME
         , C.RESULT
         , D.GRADE
        FROM STUDENT A
           , COURSE B
           , SCORE C
           , SCGRADE D
        WHERE A.SNO = C.SNO
          AND B.CNO = C.CNO
          AND C.RESULT BETWEEN D.LOSCORE AND D.HISCORE
);

SELECT * FROM ST_SCORE
ORDER BY SNO, CNO;

--5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.
CREATE OR REPLACE VIEW PRO_ST (
    CNO,
    CNAME,
    PNO,
    PNAME,
    SNO,
    SNAME
) AS (
    SELECT A.CNO
         , A.CNAME
         , A.PNO
         , B.PNAME
         , C.SNO
         , D.SNAME
        FROM COURSE A
           , PROFESSOR B
           , SCORE C
           , STUDENT D
        WHERE A.PNO = B.PNO
          AND A.CNO = C.CNO
          AND C.SNO = D.SNO
);

SELECT * FROM PRO_ST
ORDER BY CNO, PNO, SNO;