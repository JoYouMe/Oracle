1) 다음 구조를 갖는 테이블을 생성하세요.
FACTORY 테이블 - FNO NUMBER PK          : 공장번호
                FNMAE VARCHAR2(50)      : 공장이름
                LOC VARCHAR2(10)        : 공장위치
GOODS 테이블 - GNO NUMBER PK            : 제품번호
              GNAME VARCHAR2(50)        : 제품이름
              PRI NUMBER                : 제품단가
              FNO NUMBER FK             : 공장번호
PROD 테이블 - PNO NUMBER PK             : 상품번호
              GNO NUMBER FK             : 제품번호
              PRICE NUMBER              : 출고단가
              PDATE DATE                : 생산일자

2) 다음 구조를 갖는 테이블을 생성하세요.
PRODUCT 테이블 - PNO NUMBER PK              : 제품번호
                PNMAE VARCHAR2(50)          : 제품이름
                PRI NUMBER                  : 제품단가
PAYMENT 테이블 - MNO NUMBER PK              : 전표번호
                PDATE DATE NOT NULL         : 판매일자
                CNAME VARCHAR2(50) NOT NULL : 고객명
                TOTAL NUMBER TOTAL > 0      : 총액
PAYMENT_DETAIL - MNO NUMBER PK FK           : 전표번호
                PNO NUMBER PK FK            : 제품번호
                AMOUNT NUMBER NOT NULL      : 수량
                PRICE NUMBER NOT NULL       : 단가
                TOTAL_PRICE NUMBER NOT NULL TOTAL_PRICE > 0 : 금액