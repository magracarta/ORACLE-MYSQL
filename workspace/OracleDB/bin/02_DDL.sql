-- 02_DDL.sql
-- DDL(Data Definition Language) 데이터 정의어
-- 테이블의 생성 CREATE

-- 데이터 베이스의 명령어는 대소문자는 구분 x 

-- 명령 양식
--CREATE TABLE  테이블이름(
--							-- Default 값은 내가 굳이 안써도 들어가는 값 
--							-- ex) 게시판 조회 수 :  처음게시물 작성시 조회수 0으로
--							-- ex) 게시판 작성일 : 시스템데이터로 시간값을 가져와 작성 
--	필드명1 DATATYPE [DEFAULT 값 OR 제약조건 등],
--							-- 제약조건 
--							-- ex)나이를 200살 800살 등을 제약
--							--     80 넘어간 사람들은 입력 X
--	필드명2 DATATYPE [DEFAULT 값 OR 제약조건 등],
--	필드명3 DATATYPE [DEFAULT 값 OR 제약조건 등],
--	...
--	필드명4 DATATYPE [DEFAULT 값 OR 제약조건 등]
--);




-- 도서대여점의 도서목록 테이블의 생성
-- 필드 : booknum, subject, makeyear, inprice, outprice
-- 자료형 : booknum(문자 5자리) , subject(문자30), makeyaer(숫자4),
--			  inprice(숫자 6), outprice(숫자 6)
-- 제약조건 : booknum(Not null), subject(Not null), makeyaer(),
--			    inprice(), outprice()
-- 테이블명 : booklist

---- 실행 단축기 Alt + X
--CREATE TABLE booklist(
--	booknum varchar2(5) primary key,  -- primary key -> 제약사항
--	--오라클은 varchar이 아닌 varchar2(n)사용가능 
--	subject varchar2(30),
--	makeyear  number(4),
--	inprice number(6),
--	outprice number(6)
--);


CREATE TABLE booklist(
	booknum varchar2(5) , 
	subject varchar2(30) not null,
	makeyear  number(4) ,
	inprice number(6) not null,
	outprice number(6) not null,
	-- 필드명 옆에 현재 필드에만 적용하는 제약조건을 필드레벨의 제약이라고 합니다.
	-- 아래처럼 쓰는건 테이블레벨의 제약조건입니다.
	constraint booklist_pk primary key(booknum)
	-- constraint : 테이블 수준의 제약조건을 지정하는 키워드(명령)
	-- booklist_pk: 테이블 외부에서 현재 제약조건을 컨트롤 하기 위한 제약조건의 고유이름
	-- primary key (booknum) : 기본키로 booknum을 지정하겠다는 뜻이다.
);
SELECT * FROM booklist;
DROP TABLE booklist purge;
-- purge 휴지통을 거치지 않는 완전 삭제


--not null : null을 허용하지 않는 제약, 해당 필드가 빈칸채로는 레코드가 inser 되지 앟는다.

-- 기본키(Primary Key) : 테이블을 구성하는 필드들 중에서 갖는 값들이 빈칸(null)이 없고
-- 서로 다른 값(유일한 값)들을 갖고 있어 레코드들을 유일하게 구분해 낼 수 있는 필드
-- 테이블을 구성하는 필드들 중 자격이 되는 필주둥 하나에 부여하는 테이블의 대표값
-- 기본키를 지정함으로 써 키본키가 지정하지 않았을때 발생할 수 있는 오류들을 미연에 방지할 수 있다.
-- 기본키로 결함을 없에는 것, 그래서 결함없이 유지되는 것을 "개체 무결성"이라고 부른다.
 

-- create table 명령의 세부규칙
-- 1. 테이블의 이름은 객체를 의미할 수 있는 적합한 이름을 사용합니다.(자바의 변수이름과 비슷)
-- 2. 다른 테이블과 이름이 중복되지 않게 정합니다. (같은 아이디로 로그인했을때의 중복)
-- 3. 한 테이블 내에서 필드이름도 중복되지 않게 함.
-- 4. 각 필드들은 "," 로 구분하여 생성함
-- 5. create를 비록한 모든 sql명령은 ";"로 마칩니다.
-- 6. 필드명 뒤에 DATATYPE은 반드시 지정하고 []안에 내용은 해당 내용이 있을 때 작성하며 생략 가능
-- 7. 예약어 명령어 등을 테이블명과 필드명으로 쓸수 없음.
-- 8. 테이블 생성시 대 /소문자 구분은 하지 않음(기본적으로 테이블이나 컬럼명은 대문자로 만들어짐)
--  	create table
--     CREATE TABLE
--     Create Table
-- 9. 보통은 데이터형식과 용량(크기)를 지정하는데, DATE 데이터 형식은 유형을 별도로 크기를 지정하지않음.
-- 10. 문자 데이터의 DataType -> varchar2(10), number(4)
-- 11. 문자 데이터 유형은 반드시 가질 수 있는 최대 길이를 표시해야 함
-- 12. 숫자 데이터 형식은 byte 수로 표현하지 않고, 자리수로 표현 number(4) -> 숫자(0~9999)
-- 13. 컬럼(필드)과 컬럼(필드)의 구분은 콤마로 하되, 마지막 컬럼이나 constaint 를 작성 후엔 콤마를 찍지 않음.
 



-- 테이블 생성 2 
-- 테이블 이름 : MemberList(회원리스트)
-- 필드 : memberNum, memberName, phone, Birth, Bpoint
-- 데이터 형식 : memberNum : VARCHAR2(5), memberName : VARCHAR2(12),
--					Phone : VARCHAR2(13), Birth : DATE, Bpoint: NUMBER(6)
-- 제약조건 : memberNum : Primary Key - 테이블 레벨로 설정


CREATE TABLE MemberList(
	memberNum VARCHAR2(5), 
	memberName VARCHAR2(12),
	phone VARCHAR2(13),
	Bith DATE ,
	Bpoint NUMBER(6),
	constraint MemberList_pk primary key(memberNum)
);
SELECT * FROM MemlberList;
DROP TABLE MemberList purge;

CREATE TABLE memberList(
		memberNum VARCHAR2(5) Not Null,
		memberName VARCHAR2(12)  Not Null,
		Phone varchar2(13)  Not Null,
		Birth date,
		Bpoint number(6),
		constraint member_pk primary key(memberNum)
)
SELECT * from memberList;
DROP TABLE memberList purge;


-- 외래키(FOREIGN KEY) : 테이블 간의 필수 포함 관계에 있어
-- 상대 테이블의 특정 필드값을 참조하면서 없는 값을 사용할 수 없도록 하는 규칙.
-- 외래키로 유지되는 무경설을 "참조 무결성"이라고 부른다.
-- 예를 들면 booklist 에 존재 하지 않는 도서의 번호가 rentlist의 빌려간
-- 도서의 번호로 등록되지 못하게 하는 것을 말한다.


-- 테이블 생성 3 
-- 테이블 이름 : rentlist
-- 필드 : idx(NUMBER(3)) , rent_date(date), bnum(VARCHAR2(5)),
--			mnum(VARCAHR2(5)), discount(NUMBER(4))
-- 제약 조건 : bnum, mnum, : not null

CREATE TABLE rentlist(
	idx number(3) ,  -- 대여기록 번호
	rent_date date default sysdate,  -- 대여날짜 //오늘 날짜를 오라클 시스템에서 자동으로 넣어줌.
	--rent_seq number(3), -- 하나의 날짜안에 지정된 순번
	bnum VARCHAR2(5) not null, --대여해간 도서번호
	mnum VARCHAR2(5) not null, --대여해한 회원의 회원 번호
	discount NUMBER(4)  default 500, --할인금액

	--constraint rent_key primary key (rent_date, rent_seq) 
	-- idx를 쓸수없을때 조합하여 키를 만들어서 사용하기도 한다.
	constraint rent_pk primary key (idx),
	constraint fk1 foreign key(bnum) references booklist(booknum), --외래키
	-- 현재 테이블의 bnum 필드는 booklist테이블의 booknum 필드값을 참조합니다.
	constraint fk2 foreign key(mnum) references memberlist(membernum)
	-- 현재 테이블의 mnum필드는 memberlist 테이블의 membernum 필드값을 참조합니다.
);


select * from rentlist;

-- 외래키의 참조 대상이 되는 필드는 그쪽 테이블의 기본키어야 한다.



-- 제약조건 (CONSTRAINT)
-- PRIMARY KEY
-- - 테이블에 저장된 레코드를 고유하게 식별하기 위한 키, 하나의 테이블에 하나의 기본키만 정의 할 수 있다.
-- - 여러 필드가 조합된 기본키 생성 가능하다.
-- - 기본키는 중복된 값을 갖을수 없으며 빈칸도 있을 수 없다.
-- - PRIMARY KEY  = UNIQUE KEY + NOT NULL
-- UNIQUE KEY
--  - 테이블에 저장된 행 데이터를 고유하게 식별하기 위한 고유키를 정의 한다.
--  - 단 NULL 은 고유키 제약의 대상이 아니므로, NULL값을 가진 행이 여러개가 UNIQUE KEY
--   제약에 위반하지 않는다.
-- NOT NULL
-- - 비어있는 상태, 아무것도 없는 상태를 허용하지 않습니다. - 입력 필수
-- CHECK
-- - 입력할 수 있는 값의 범위를 제한한다. CHECK제약으로는 TRUE or FALSE로 평가할 수 있는 놀리식을 지정한다.
-- FOREIGN KEY
-- - 관계형 데이터 베이스에서 테이블간에 관계를 정의하기 위해 기본키를 다른 테이블의 외래키로 
--   복사하는 경우 외래키가 생성된다. - 참조 무결성 제약 옵션이 생성



















