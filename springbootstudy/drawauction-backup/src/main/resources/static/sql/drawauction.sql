-- 시퀀스 삭제
DROP SEQUENCE USER_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE INQUIRY_SEQ;
DROP SEQUENCE AUCTION_SEQ;
DROP SEQUENCE DRAW_SEQ;
DROP SEQUENCE EMONEY_SEQ;
DROP SEQUENCE INACTIVE_USER_SEQ;
DROP SEQUENCE INQUIRY_ATTACH_SEQ;
DROP SEQUENCE AUCTION_IMAGE_SEQ;
DROP SEQUENCE DRAW_IMAGE_SEQ;
DROP SEQUENCE AUCTION_WISHLIST_SEQ;
DROP SEQUENCE CHAT_SEQ;
DROP SEQUENCE BID_SEQ;
DROP SEQUENCE DRAW_ORDER_SEQ;
DROP SEQUENCE CATEGORY_SEQ;
DROP SEQUENCE ALARM_SEQ;
DROP SEQUENCE DRAW_WISHLIST_SEQ;
DROP SEQUENCE ART_SEQ;
DROP SEQUENCE DRAW_REVIEW_SEQ;

-- 시퀀스 생성
CREATE SEQUENCE USER_SEQ;
CREATE SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE INQUIRY_SEQ;
CREATE SEQUENCE AUCTION_SEQ;
CREATE SEQUENCE DRAW_SEQ;
CREATE SEQUENCE EMONEY_SEQ;
CREATE SEQUENCE INACTIVE_USER_SEQ;
CREATE SEQUENCE INQUIRY_ATTACH_SEQ;
CREATE SEQUENCE AUCTION_IMAGE_SEQ;
CREATE SEQUENCE DRAW_IMAGE_SEQ;
CREATE SEQUENCE AUCTION_WISHLIST_SEQ;
CREATE SEQUENCE CHAT_SEQ;
CREATE SEQUENCE BID_SEQ;
CREATE SEQUENCE DRAW_ORDER_SEQ;
CREATE SEQUENCE CATEGORY_SEQ;
CREATE SEQUENCE ALARM_SEQ;
CREATE SEQUENCE DRAW_WISHLIST_SEQ;
CREATE SEQUENCE ART_SEQ;
CREATE SEQUENCE DRAW_REVIEW_SEQ;

-- 테이블 삭제
DROP TABLE ALARM_T;
DROP TABLE ACCESS_T;
DROP TABLE LEAVE_USER_T;
DROP TABLE INACTIVE_USER_T;
DROP TABLE ANSWER_T;
DROP TABLE INQUIRY_ATTACH_T;
DROP TABLE INQUIRY_T;
DROP TABLE NOTICE_T;
DROP TABLE MESSAGE_T;
DROP TABLE CHAT_T;
DROP TABLE EMONEY_T;
DROP TABLE DRAW_REVIEW_T;
DROP TABLE DRAW_WISHLIST_T;
DROP TABLE DRAW_ORDER_T;
DROP TABLE DRAW_IMAGE_T;
DROP TABLE DRAW_T;
DROP TABLE AUCTION_WISHLIST_T;
DROP TABLE BID_T;
DROP TABLE AUCTION_IMAGE_T;
DROP TABLE AUCTION_T;
DROP TABLE ART_T;
DROP TABLE CATEGORY_T;
DROP TABLE USER_T;

-- 회원 테이블
CREATE TABLE USER_T (
	USER_NO	        NUMBER		               NOT NULL,
	EMAIL	        VARCHAR2(100 BYTE) UNIQUE  NOT NULL,
	PW	            VARCHAR2(64 BYTE)		   NULL,
	NAME	        VARCHAR2(50 BYTE)		   NOT NULL,
	MOBILE	        VARCHAR2(15 BYTE)		   NOT NULL,
	GENDER	        VARCHAR2(2 BYTE)		   NULL,
	AGREE	        NUMBER		               NULL,
	STATE	        NUMBER		               NULL,
	JOINED_AT	    DATE		               NULL,
	POSTCODE	    VARCHAR2(5  BYTE)		   NULL,
	ROAD_ADDRESS	VARCHAR2(100 BYTE)		   NULL,
	JIBUN_ADDRESS	VARCHAR2(100 BYTE)		   NULL,
	DETAIL_ADDRESS  VARCHAR2(100 BYTE)		   NULL,
	NICKNAME	    VARCHAR2(50 BYTE)		   NOT NULL,
	INTRODUCTION	VARCHAR2(200 BYTE)		   NULL,
    MY_PRICE        NUMBER         DEFAULT 0   NULL
);

-- 카테고리 테이블
CREATE TABLE CATEGORY_T (
	CATEGORY_NO	    NUMBER		       NOT NULL,
	CATEGORY_NAME	VARCHAR2(100 BYTE) NOT NULL
);

-- 작품(경매) 테이블
CREATE TABLE ART_T (
	ART_NO	    NUMBER		        NOT NULL,
	SELLER_NO	NUMBER		        NOT NULL,
	CATEGORY_NO	NUMBER		        NOT NULL,
	TITLE   	VARCHAR2(100 BYTE)	NOT NULL,
	CONTENTS	VARCHAR2(4000 BYTE)	NULL,
	ART_TYPE	NUMBER	        	NOT NULL,
	WIDTH	    NUMBER		        NULL,
	HEIGHT	    NUMBER		        NULL
);

-- 경매 테이블
CREATE TABLE AUCTION_T (
	AUCTION_NO	NUMBER		      NOT NULL,
	ART_NO	    NUMBER		      NOT NULL,
	START_PRICE	NUMBER		      NOT NULL,
    BUY_PRICE	NUMBER		      NULL,
	START_AT	DATE		      NOT NULL,
	END_AT	    DATE		      NULL,
	STATUS	    NUMBER	DEFAULT 0 NOT NULL
);

-- 경매 이미지 테이블
CREATE TABLE AUCTION_IMAGE_T (
	AUCTION_IMAGE_NO	NUMBER		       NOT NULL,
	AUCTION_NO	        NUMBER		       NOT NULL,
	PATH	            VARCHAR2(100 BYTE) NULL,
	FILESYSTEM_NAME	    VARCHAR2(300 BYTE) NULL,
	IMAGE_ORIGINAL_NAME	VARCHAR2(300 BYTE) NULL,
	HAS_THUMBNAIL	    NUMBER		       NULL
);

-- 입찰내역 테이블
CREATE TABLE BID_T (
	BID_NO	        NUMBER		       NOT NULL,
	AUCTION_NO	    NUMBER		       NOT NULL,
	BIDDER_NO	    NUMBER		       NULL,
	PRICE	        NUMBER		       NOT NULL,
	BID_AT	        DATE		       NULL,
	POSTCODE	    VARCHAR2(5  BYTE)  NULL,
	ROAD_ADDRESS	VARCHAR2(100 BYTE) NULL,
	JIBUN_ADDRESS	VARCHAR2(100 BYTE) NULL,
	DETAIL_ADDRESS	VARCHAR2(100 BYTE) NULL,
    RECEIVE_EMAIL   VARCHAR2(100 BYTE) NULL
);

-- 경매 찜목록 테이블
CREATE TABLE AUCTION_WISHLIST_T (
	AUCTION_WISH_NO	NUMBER		NOT NULL,
	AUCTION_NO	    NUMBER		NOT NULL,
	USER_NO	        NUMBER		NOT NULL,
	WISHED_AT	    DATE		NULL
);

-- 그려드림 테이블
CREATE TABLE DRAW_T (
	DRAW_NO	    NUMBER		       NOT NULL,
	SELLER_NO	NUMBER		       NULL,
	CATEGORY_NO	NUMBER		       NOT NULL,
	TITLE	    VARCHAR2(200 BYTE) NOT NULL,
    PRICE       NUMBER             NULL,
	CONTENTS	VARCHAR2(4000 BYTE) NULL,
	WIDTH	    NUMBER		       NULL,
	HEIGHT	    NUMBER		       NULL,
    WORK_TERM   NUMBER             NULL,
    DRAW_CREATED_AT DATE           NULL
);

-- 그려드림 이미지 테이블
CREATE TABLE DRAW_IMAGE_T (
	DRAW_IMAGE_NO	    NUMBER		       NOT NULL,
	DRAW_NO	            NUMBER		       NOT NULL,
	PATH	            VARCHAR2(100 BYTE) NULL,
	FILESYSTEM_NAME	    VARCHAR2(300 BYTE) NULL,
	IMAGE_ORIGINAL_NAME	VARCHAR2(300 BYTE) NULL,
	HAS_THUMBNAIL	    NUMBER		       NULL
);

-- 그려드림 주문내역 테이블
CREATE TABLE DRAW_ORDER_T (
	ORDER_NO	   NUMBER		      NOT NULL,
	DRAW_NO	       NUMBER		      NOT NULL,
	BUYER_NO	   NUMBER		      NULL,
	ORDER_DATE	   DATE		          NULL,
	PRICE	       NUMBER		      NULL,
	RECEIVE_EMAIL  VARCHAR2(100 BYTE) NULL,
    DRAW_REQUEST   VARCHAR2(300 BYTE) NULL
);

-- 그려드림 찜목록 테이블
CREATE TABLE DRAW_WISHLIST_T (
	DRAW_WISH_NO  NUMBER  NOT NULL,
	DRAW_NO	      NUMBER  NOT NULL,
	USER_NO	      NUMBER  NOT NULL,
	WISHED_AT	  DATE	  NULL
);

-- 그려드림 리뷰 테이블
CREATE TABLE DRAW_REVIEW_T (
	DRAW_NO	        NUMBER		       NOT NULL,
	BUYER_NO	    NUMBER		       NULL,
	REVIEW_CONTENTS	VARCHAR2(200 BYTE) NULL,
	RATING	        NUMBER		       NOT NULL,
	CREATED_AT	    DATE		       NOT NULL
);

-- E-MONEY입출금내역 테이블
CREATE TABLE EMONEY_T (
	EMONEY_NO	    NUMBER             NOT NULL,
	USER_NO	        NUMBER		       NOT NULL,
	EMONEY_HISTORY  NUMBER		       NULL,
	EMONEY_DATE 	DATE               NULL
);

-- 채팅방 테이블
CREATE TABLE CHAT_T (
	ROOM_ID	 NUMBER		NOT NULL,
	USER_NO	 NUMBER		NULL,
	USER_NO2 NUMBER		NULL
);

-- 채팅 메세지 테이블
CREATE TABLE MESSAGE_T (
	ROOM_ID	   NUMBER             NOT NULL,
	CONTENTS   VARCHAR2(200 BYTE) NULL,
	CHAT_DATE  DATE		          NULL
);

-- 공지사항 테이블
CREATE TABLE NOTICE_T (
	NOTICE_NO	NUMBER		        NOT NULL,
	TITLE	    VARCHAR2(100 BYTE)	NOT NULL,
	CONTENTS	VARCHAR2(4000 BYTE)	NULL,
	CREATED_AT	DATE		        NULL
);

-- 1:1문의 테이블
CREATE TABLE INQUIRY_T (
	INQUIRY_NO	        NUMBER		        NOT NULL,
    USER_NO	            NUMBER		        NOT NULL,
	TITLE	            VARCHAR2(100 BYTE)	NOT NULL,
	CONTENT	            VARCHAR2(4000 BYTE)	NOT NULL,
	INQUIRY_CREATED_AT	DATE		        NULL,
	INQUIRY_TYPE	    VARCHAR2(100 BYTE)  NOT NULL
);

-- 1:1문의 첨부 테이블
CREATE TABLE INQUIRY_ATTACH_T (
	INQUIRY_ATTACH_NO  NUMBER		      NOT NULL,
	INQUIRY_NO	       NUMBER		      NOT NULL,
	PATH	           VARCHAR2(100 BYTE) NULL,
	ORIGINAL_FILENAME  VARCHAR2(300 BYTE) NULL,
	FILESYSTEM_NAME	   VARCHAR2(300 BYTE) NULL,
    HAS_THUMBNAIL	   NUMBER		      NULL
);

--1:1문의 댓글(답변) 테이블
CREATE TABLE ANSWER_T (
	INQUIRY_NO	NUMBER		       NOT NULL,
    USER_NO     NUMBER             NOT NULL,
	CONTENTS	VARCHAR2(500 BYTE) NULL,
	CREATED_AT	DATE		       NULL,
	STATUS  	NUMBER		       NULL
);

-- 휴면회원 테이블
CREATE TABLE INACTIVE_USER_T (
	USER_NO	        NUMBER  		   NOT NULL,
	EMAIL	        VARCHAR2(100 BYTE) NOT NULL,
	PW	            VARCHAR2(64 BYTE)  NOT NULL,
	NAME	        VARCHAR2(50 BYTE)  NOT NULL,
	MOBILE	        VARCHAR2(15 BYTE)  NOT NULL,
	GENDER	        VARCHAR2(2 BYTE)   NULL,
	AGREE	        NUMBER		       NULL,
	STATE	        NUMBER		       NULL,
	JOINED_AT	    DATE		       NULL,
	POSTCODE	    VARCHAR2(5   BYTE)  NULL,
	ROAD_ADDRESS	VARCHAR2(100 BYTE) NULL,
	JIBUN_ADDRESS	VARCHAR2(100 BYTE) NULL,
	DETAIL_ADDRESS  VARCHAR2(100 BYTE) NULL,
	NICKNAME	    VARCHAR2(50  BYTE)  NULL,
	INTRODUCTION	VARCHAR2(200 BYTE)  NULL,
    MY_PRICE        NUMBER  DEFAULT 0   NULL,
	INACTIVED_AT	DATE		       NULL
);

-- 탈퇴회원 테이블
CREATE TABLE LEAVE_USER_T (
	EMAIL	    VARCHAR2(50 BYTE) NULL,
	JOINED_AT	DATE		      NULL,
	LEAVED_AT	DATE		      NULL
);

-- 접속기록 테이블
CREATE TABLE ACCESS_T (
	EMAIL	  VARCHAR2(100 BYTE) NOT NULL,
	LOGIN_AT  DATE		         NOT NULL
);

-- 알림 테이블
CREATE TABLE ALARM_T (
	ALARM_NO    	NUMBER		       NOT NULL,
    USER_NO         NUMBER             NOT NULL,
	AUCTION_NO	    NUMBER		       NULL,
    DRAW_NO	        NUMBER		       NULL,
    NOTICE_NO       NUMBER             NULL,
	INQUIRY_NO	    NUMBER		       NULL,
	ALARM_CONTENTS	VARCHAR2(300 BYTE) NULL,
	ALARM_TYPE	    VARCHAR2(20 BYTE)  NULL,
	CREATED_AT	    DATE		       NULL,
    STATUS          NUMBER  DEFAULT 0  NULL
);



-- PK,FK 관계 맺기
ALTER TABLE USER_T ADD CONSTRAINT PK_USER_T PRIMARY KEY (USER_NO);

ALTER TABLE NOTICE_T ADD CONSTRAINT PK_NOTICE_T PRIMARY KEY (NOTICE_NO);

ALTER TABLE INQUIRY_T ADD CONSTRAINT PK_INQUIRY_T PRIMARY KEY (INQUIRY_NO);

ALTER TABLE AUCTION_T ADD CONSTRAINT PK_AUCTION_T PRIMARY KEY (AUCTION_NO);

ALTER TABLE DRAW_T ADD CONSTRAINT PK_DRAW_T PRIMARY KEY (DRAW_NO);

ALTER TABLE EMONEY_T ADD CONSTRAINT PK_EMONEY_T PRIMARY KEY (EMONEY_NO);

ALTER TABLE INACTIVE_USER_T ADD CONSTRAINT PK_INACTIVE_USER_T PRIMARY KEY (USER_NO);

ALTER TABLE INQUIRY_ATTACH_T ADD CONSTRAINT PK_INQUIRY_ATTACH_T PRIMARY KEY (INQUIRY_ATTACH_NO);

ALTER TABLE AUCTION_IMAGE_T ADD CONSTRAINT PK_AUCTION_IMAGE_T PRIMARY KEY (AUCTION_IMAGE_NO);

ALTER TABLE DRAW_IMAGE_T ADD CONSTRAINT PK_DRAW_IMAGE_T PRIMARY KEY (DRAW_IMAGE_NO);

ALTER TABLE AUCTION_WISHLIST_T ADD CONSTRAINT PK_AUCTION_WISHLIST_T PRIMARY KEY (AUCTION_WISH_NO);

ALTER TABLE CHAT_T ADD CONSTRAINT PK_CHAT_T PRIMARY KEY (ROOM_ID);

ALTER TABLE BID_T ADD CONSTRAINT PK_BID_T PRIMARY KEY (BID_NO);

ALTER TABLE DRAW_ORDER_T ADD CONSTRAINT PK_DRAW_ORDER_T PRIMARY KEY (ORDER_NO);

ALTER TABLE CATEGORY_T ADD CONSTRAINT PK_CATEGORY_T PRIMARY KEY (CATEGORY_NO);

ALTER TABLE ALARM_T ADD CONSTRAINT PK_ALARM_T PRIMARY KEY (ALARM_NO);

ALTER TABLE DRAW_WISHLIST_T ADD CONSTRAINT PK_DRAW_WISHLIST_T PRIMARY KEY (DRAW_WISH_NO);

ALTER TABLE ART_T ADD CONSTRAINT PK_ART_T PRIMARY KEY (ART_NO);

ALTER TABLE INQUIRY_T ADD CONSTRAINT FK_USER_T_TO_INQUIRY_T_1 FOREIGN KEY (USER_NO) REFERENCES USER_T (USER_NO) ON DELETE CASCADE;

ALTER TABLE AUCTION_T ADD CONSTRAINT FK_ART_T_TO_AUCTION_T_1 FOREIGN KEY (ART_NO) REFERENCES ART_T (ART_NO) ON DELETE CASCADE;

ALTER TABLE DRAW_T ADD CONSTRAINT FK_USER_T_TO_DRAW_T_1 FOREIGN KEY (SELLER_NO) REFERENCES USER_T (USER_NO) ON DELETE SET NULL;

ALTER TABLE DRAW_T ADD CONSTRAINT FK_CATEGORY_T_TO_DRAW_T_1 FOREIGN KEY (CATEGORY_NO) REFERENCES CATEGORY_T (CATEGORY_NO) ON DELETE CASCADE;

ALTER TABLE EMONEY_T ADD CONSTRAINT FK_USER_T_TO_EMONEY_T_1 FOREIGN KEY (USER_NO) REFERENCES USER_T (USER_NO) ON DELETE CASCADE;

ALTER TABLE INQUIRY_ATTACH_T ADD CONSTRAINT FK_INQUIRY_T_TO_INQUIRY_ATTACH_T_1 FOREIGN KEY (INQUIRY_NO) REFERENCES INQUIRY_T (INQUIRY_NO) ON DELETE CASCADE;

ALTER TABLE AUCTION_IMAGE_T ADD CONSTRAINT FK_AUCTION_T_TO_AUCTION_IMAGE_T_1 FOREIGN KEY (AUCTION_NO) REFERENCES AUCTION_T (AUCTION_NO) ON DELETE CASCADE;

ALTER TABLE DRAW_IMAGE_T ADD CONSTRAINT FK_DRAW_T_TO_DRAW_IMAGE_T_1 FOREIGN KEY (DRAW_NO) REFERENCES DRAW_T (DRAW_NO) ON DELETE CASCADE;

ALTER TABLE AUCTION_WISHLIST_T ADD CONSTRAINT FK_AUCTION_T_TO_AUCTION_WISHLIST_T_1 FOREIGN KEY (AUCTION_NO) REFERENCES AUCTION_T (AUCTION_NO) ON DELETE CASCADE;

ALTER TABLE AUCTION_WISHLIST_T ADD CONSTRAINT FK_USER_T_TO_AUCTION_WISHLIST_T_1 FOREIGN KEY (USER_NO) REFERENCES USER_T (USER_NO) ON DELETE CASCADE;

ALTER TABLE CHAT_T ADD CONSTRAINT FK_USER_T_TO_CHAT_T_1 FOREIGN KEY (USER_NO) REFERENCES USER_T (USER_NO) ON DELETE SET NULL;

ALTER TABLE CHAT_T ADD CONSTRAINT FK_USER_T_TO_CHAT_T_2 FOREIGN KEY (USER_NO2) REFERENCES USER_T (USER_NO) ON DELETE SET NULL;

ALTER TABLE MESSAGE_T ADD CONSTRAINT FK_CHAT_T_TO_MESSAGE_T_1 FOREIGN KEY (ROOM_ID) REFERENCES CHAT_T (ROOM_ID) ON DELETE CASCADE;

ALTER TABLE BID_T ADD CONSTRAINT FK_AUCTION_T_TO_BID_T_1 FOREIGN KEY (AUCTION_NO) REFERENCES AUCTION_T (AUCTION_NO) ON DELETE CASCADE;

ALTER TABLE BID_T ADD CONSTRAINT FK_USER_T_TO_BID_T_1 FOREIGN KEY (BIDDER_NO) REFERENCES USER_T (USER_NO) ON DELETE SET NULL;

ALTER TABLE DRAW_ORDER_T ADD CONSTRAINT FK_DRAW_T_TO_DRAW_ORDER_T_1 FOREIGN KEY (DRAW_NO) REFERENCES DRAW_T (DRAW_NO) ON DELETE CASCADE;

ALTER TABLE DRAW_ORDER_T ADD CONSTRAINT FK_USER_T_TO_DRAW_ORDER_T_1 FOREIGN KEY (BUYER_NO) REFERENCES USER_T (USER_NO) ON DELETE SET NULL;

ALTER TABLE ALARM_T ADD CONSTRAINT FK_USER_T_TO_ALARM_T_1 FOREIGN KEY (USER_NO) REFERENCES USER_T (USER_NO) ON DELETE CASCADE;

ALTER TABLE ALARM_T ADD CONSTRAINT FK_AUCTION_T_TO_ALARM_T_1 FOREIGN KEY (AUCTION_NO) REFERENCES AUCTION_T (AUCTION_NO) ON DELETE SET NULL;

ALTER TABLE ALARM_T ADD CONSTRAINT FK_INQUIRY_T_TO_ALARM_T_1 FOREIGN KEY (INQUIRY_NO) REFERENCES INQUIRY_T (INQUIRY_NO) ON DELETE SET NULL;

ALTER TABLE ALARM_T ADD CONSTRAINT FK_DRAW_T_TO_ALARM_T_1 FOREIGN KEY (DRAW_NO) REFERENCES DRAW_T (DRAW_NO) ON DELETE SET NULL;

ALTER TABLE DRAW_WISHLIST_T ADD CONSTRAINT FK_DRAW_T_TO_DRAW_WISHLIST_T_1 FOREIGN KEY (DRAW_NO) REFERENCES DRAW_T (DRAW_NO) ON DELETE CASCADE;

ALTER TABLE DRAW_WISHLIST_T ADD CONSTRAINT FK_USER_T_TO_DRAW_WISHLIST_T_1 FOREIGN KEY (USER_NO) REFERENCES USER_T (USER_NO) ON DELETE CASCADE;

ALTER TABLE ART_T ADD CONSTRAINT FK_USER_T_TO_ART_T_1 FOREIGN KEY (SELLER_NO) REFERENCES USER_T (USER_NO) ON DELETE CASCADE;

ALTER TABLE ART_T ADD CONSTRAINT FK_CATEGORY_T_TO_ART_T_1 FOREIGN KEY (CATEGORY_NO) REFERENCES CATEGORY_T (CATEGORY_NO) ON DELETE CASCADE;

ALTER TABLE ANSWER_T ADD CONSTRAINT FK_INQUIRY_T_TO_ANSWER_T_1 FOREIGN KEY (INQUIRY_NO) REFERENCES INQUIRY_T (INQUIRY_NO) ON DELETE CASCADE;

ALTER TABLE ANSWER_T ADD CONSTRAINT FK_USER_T_TO_ANSWER_T_2 FOREIGN KEY (USER_NO) REFERENCES USER_T (USER_NO) ON DELETE CASCADE;

ALTER TABLE DRAW_REVIEW_T ADD CONSTRAINT FK_DRAW_T_TO_DRAW_REVIEW_T_1 FOREIGN KEY (DRAW_NO) REFERENCES DRAW_T (DRAW_NO) ON DELETE CASCADE;

ALTER TABLE DRAW_REVIEW_T ADD CONSTRAINT FK_USER_T_TO_DRAW_REVIEW_T_2 FOREIGN KEY (BUYER_NO) REFERENCES USER_T (USER_NO) ON DELETE SET NULL;

-------------INSERT---------------
-- 관리자
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'admin01@naver.com',STANDARD_HASH('1111', 'SHA256'), '관리자', '010-0000-0000', 'F', '0', '0', SYSDATE, '00000', 'DORO', 'JIBUN', 'SANGSE', '관리자', '관리자입니다.', DEFAULT);

-- 회원
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user01@naver.com', STANDARD_HASH('1111', 'SHA256'), '사용자1', '01011111111', 'M', 0, 0, TO_DATE('220111', 'YYMMDD'), '1111','서울', '가산동', 'KM타워', '용사1', '용사입니다', DEFAULT);
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user02@naver.com', STANDARD_HASH('2222', 'SHA256'), '사용자2', '01022222222', 'M', 0, 0, TO_DATE('220110', 'YYMMDD'), '2222','서울', '가산동', 'KM타워', '용사2', '용사입니다', DEFAULT);
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user03@naver.com', STANDARD_HASH('3333', 'SHA256'), '사용자3', '01033333333', 'M', 0, 0, TO_DATE('220109', 'YYMMDD'), '3333','서울', '가산동', 'KM타워', '용사3', '용사입니다', DEFAULT);
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user04@naver.com', STANDARD_HASH('4444', 'SHA256'), '사용자4', '01044444444', 'M', 0, 0, TO_DATE('220108', 'YYMMDD'), '4444','서울', '가산동', 'KM타워', '용사4', '용사입니다', DEFAULT);
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user05@naver.com', STANDARD_HASH('5555', 'SHA256'), '사용자5', '01055555555', 'M', 0, 0, TO_DATE('230109', 'YYMMDD'), '5555','서울', '가산동', 'KM타워', '용사5', '용사입니다', DEFAULT);
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user06@naver.com', STANDARD_HASH('6666', 'SHA256'), '사용자6', '01066666666', 'M', 0, 0, TO_DATE('230110', 'YYMMDD'), '6666','서울', '가산동', 'KM타워', '용사6', '용사입니다', DEFAULT);
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user07@naver.com', STANDARD_HASH('7777', 'SHA256'), '사용자7', '01077777777', 'M', 0, 0, TO_DATE('230111', 'YYMMDD'), '7777','서울', '가산동', 'KM타워', '용사7', '용사입니다', DEFAULT);
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user08@naver.com', STANDARD_HASH('8888', 'SHA256'), '사용자8', '01088888888', 'M', 0, 0, TO_DATE('230111', 'YYMMDD'), '7777','서울', '가산동', 'KM타워', '용사8', '용사입니다', DEFAULT);
INSERT INTO USER_T VALUES(USER_SEQ.NEXTVAL, 'user09@naver.com', STANDARD_HASH('9999', 'SHA256'), '사용자9', '01099999999', 'M', 0, 0, TO_DATE('230111', 'YYMMDD'), '7777','서울', '가산동', 'KM타워', '용사9', '용사입니다', DEFAULT);




-- 카테고리
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '포토그래픽');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '원화');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '드로잉');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '판화');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '서예');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '회화');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '동양화');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '공예');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '디지털아트');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '조각품');
INSERT INTO CATEGORY_T VALUES(CATEGORY_SEQ.NEXTVAL, '기타');

------

-- E-MONEY 
INSERT INTO EMONEY_T VALUES(EMONEY_SEQ.NEXTVAL, 2, 500000, TO_DATE('2023-11-11 04:20:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMONEY_T VALUES(EMONEY_SEQ.NEXTVAL, 3, 10000000, TO_DATE('2023-11-11 04:20:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMONEY_T VALUES(EMONEY_SEQ.NEXTVAL, 4, 3000000, TO_DATE('2023-11-11 04:20:00','YYYY-MM-DD HH24:MI:SS'));

-- 접속기록
INSERT INTO ACCESS_T VALUES('user01@naver.com', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCESS_T VALUES('user02@naver.com', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCESS_T VALUES('user03@naver.com', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));


-- 공지사항
INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, '공지사항1번', '공지사항내용1', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, '공지사항2번', '공지사항내용2', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, '공지사항3번', '공지사항내용3', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO NOTICE_T VALUES(NOTICE_SEQ.NEXTVAL, '공지사항4번', '공지사항내용4', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));

-- 1:1문의
INSERT INTO INQUIRY_T VALUES(INQUIRY_SEQ.NEXTVAL, 2, '경매신고입니다.', '경매신고합니다!', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'),'경매신고');
INSERT INTO INQUIRY_T VALUES(INQUIRY_SEQ.NEXTVAL, 3, '그려드림신고입니다.', '그림이상함', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'),'그려드림 신고');
INSERT INTO INQUIRY_T VALUES(INQUIRY_SEQ.NEXTVAL, 4, '부적절한게시글이다', '욕설기재', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'),'부적절한 게시글');
INSERT INTO INQUIRY_T VALUES(INQUIRY_SEQ.NEXTVAL, 2, '광고성홍보.', '신고합니다.', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'),'광고성 홍보');
INSERT INTO INQUIRY_T VALUES(INQUIRY_SEQ.NEXTVAL, 3, '사칭,해킹문의드립니다.', '계정해킹당했다', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'),'사칭ㆍ해킹문의');
INSERT INTO INQUIRY_T VALUES(INQUIRY_SEQ.NEXTVAL, 3, '버그문의', '메인페이지오류', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'),'버그문의');
INSERT INTO INQUIRY_T VALUES(INQUIRY_SEQ.NEXTVAL, 5, '기타문의사항', '관리자님', TO_DATE('2023-11-21 15:22:16', 'YYYY-MM-DD HH24:MI:SS'),'기타');

-- 1:1문의 첨부파일
INSERT INTO INQUIRY_ATTACH_T VALUES(INQUIRY_ATTACH_SEQ.NEXTVAL, 1, '경로쓰1', '원본이름쓰', '파일파일', 1);
INSERT INTO INQUIRY_ATTACH_T VALUES(INQUIRY_ATTACH_SEQ.NEXTVAL, 2, '경로쓰2', '원본이름쓰', '파일파일', 1);
INSERT INTO INQUIRY_ATTACH_T VALUES(INQUIRY_ATTACH_SEQ.NEXTVAL, 3, '경로쓰3', '원본이름쓰', '파일파일', 1);
INSERT INTO INQUIRY_ATTACH_T VALUES(INQUIRY_ATTACH_SEQ.NEXTVAL, 4, '경로쓰4', '원본이름쓰', '파일파일', 1);
INSERT INTO INQUIRY_ATTACH_T VALUES(INQUIRY_ATTACH_SEQ.NEXTVAL, 5, '경로쓰5', '원본이름쓰', '파일파일', 1);
INSERT INTO INQUIRY_ATTACH_T VALUES(INQUIRY_ATTACH_SEQ.NEXTVAL, 6, '경로쓰6', '원본이름쓰', '파일파일', 1);
INSERT INTO INQUIRY_ATTACH_T VALUES(INQUIRY_ATTACH_SEQ.NEXTVAL, 7, '경로쓰7', '원본이름쓰', '파일파일', 1);

-- 1:1문의 답변
INSERT INTO ANSWER_T VALUES(1, 2, '안녕하세요 ! 관리자입니다. 무슨 경매신고인지 내용을 상세히 말해주시기 바랍니다. 감사합니다.',TO_DATE('2023-11-21 17:22:16', 'YYYY-MM-DD HH24:MI:SS'),1);
INSERT INTO ANSWER_T VALUES(2, 2, '안녕하세요 ! 관리자입니다. drawaction은 개인의 독창성을 존중하는 사이트 입니다. 그림이 조금 이상하더라도 감안해주시길 바랍니다. 감사합니다.',TO_DATE('2023-11-21 17:22:16', 'YYYY-MM-DD HH24:MI:SS'),0);
INSERT INTO ANSWER_T VALUES(3, 3, '안녕하세요 ! 관리자입니다. 문의해주신 글은 정상적으로 처리되었습니다. 감사합니다.',TO_DATE('2023-11-21 17:22:16', 'YYYY-MM-DD HH24:MI:SS'),1);
INSERT INTO ANSWER_T VALUES(4, 3, '안녕하세요 ! 관리자입니다. 더 깨끗한 drawaction만들기에 참여해 주셔서 감사합니다.',TO_DATE('2023-11-21 17:22:16', 'YYYY-MM-DD HH24:MI:SS'),1);
INSERT INTO ANSWER_T VALUES(5, 4, '안녕하세요 ! 관리자입니다. 회원가입시 입력했던 이메일로 임시 비밀번호를 발송하였으니 확인해주시길 바랍니다. 감사합니다.',TO_DATE('2023-11-21 17:22:16', 'YYYY-MM-DD HH24:MI:SS'),1);


--알림
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 3, 2, NULL, NULL, NULL, '상회 입찰되었습니다.', '경매', TO_DATE('2023-11-10 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 4, 4, NULL, NULL, NULL, '응찰이 종료되었습니다.', '경매', TO_DATE('2023-11-11 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 5, 5, NULL, NULL, NULL, '작품이 낙찰되었습니다.', '경매', TO_DATE('2023-11-13 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 6, 3, NULL, NULL, NULL, '작품이 입찰되었습니다.', '경매', TO_DATE('2023-11-14 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 7, 4, NULL, NULL, NULL, '작품이 낙찰되었습니다.', '경매', TO_DATE('2023-11-14 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 6, 2, NULL, NULL, NULL, '응찰이 종료되었습니다.', '경매', TO_DATE('2023-11-15 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 5, NULL, 2, NULL, NULL, '주문이 접수되었습니다.', '그려드림', TO_DATE('2023-11-17 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 5, NULL, 4, NULL, NULL, '새로운 채팅이 있습니다.', '그려드림', TO_DATE('2023-11-18 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 4, NULL, 2, NULL, NULL, '배송이 시작되었습니다.', '그려드림', TO_DATE('2023-11-19 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 3, NULL,  2, NULL, NULL,'리뷰가 달렸습니다.', '그려드림', TO_DATE('2023-11-20 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 2, NULL, NULL, 1, NULL, '새로운 공지가 있습니다.', '공지사항', TO_DATE('2023-11-22 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ALARM_T VALUES(ALARM_SEQ.NEXTVAL, 4, NULL, NULL, NULL, 1, '1:1문의 답변이 달렸습니다.', '1:1문의', TO_DATE('2023-11-23 15:22:16', 'YYYY-MM-DD HH24:MI:SS'));

-- 휴면
INSERT INTO INACTIVE_USER_T VALUES(7, 'user06@naver.com', STANDARD_HASH('6666', 'SHA256'), '사용자6', '01066666666', 'M', 0, 0, TO_DATE('230110', 'YYMMDD'), '6666','서울', '가산동', 'KM타워', '용사6', '용사입니다', TO_DATE('231110', 'YYMMDD'));
INSERT INTO INACTIVE_USER_T VALUES(8, 'user07@naver.com', STANDARD_HASH('7777', 'SHA256'), '사용자7', '01077777777', 'M', 0, 0, TO_DATE('230111', 'YYMMDD'), '7777','서울', '가산동', 'KM타워', '용사7', '용사입니다', TO_DATE('231111', 'YYMMDD'));

-- 탈퇴
INSERT INTO LEAVE_USER_T VALUES('user08@naver.com', TO_DATE('230111', 'YYMMDD'), TO_DATE('230911', 'YYMMDD'));
INSERT INTO LEAVE_USER_T VALUES('user09@naver.com', TO_DATE('230111', 'YYMMDD'), TO_DATE('230911', 'YYMMDD'));

COMMIT;