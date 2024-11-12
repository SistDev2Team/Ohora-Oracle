--회원 추가사항 (o_user)

-- 리뷰 테이블에 제품번호 컬럼 추가
ALTER TABLE o_review
ADD pdt_id INT;

ALTER TABLE o_review
MODIFY pdt_id NUMBER;

COMMENT ON COLUMN o_review.pdt_id IS '제품ID';

-- 리뷰에 제품번호 FK로 주기
ALTER TABLE o_review
ADD CONSTRAINT fk_o_product
FOREIGN KEY (pdt_id)
REFERENCES o_product(pdt_id);

-- 리뷰URL 테이블 수정 (포토 영상 구분 없애고 파일로서 관리)
ALTER TABLE o_revurl DROP COLUMN rurl_photo;
ALTER TABLE o_revurl DROP COLUMN rurl_record;

ALTER TABLE o_revurl ADD filesystemname VARCHAR2(100);
COMMENT ON COLUMN o_revurl.filesystemname IS '파일명';

ALTER TABLE o_revurl ADD fileoriginalname VARCHAR2(100);
COMMENT ON COLUMN o_revurl.filesystemname IS '오리지널파일명';

ALTER TABLE o_revurl ADD filelength NUMBER;
COMMENT ON COLUMN o_revurl.filesystemname IS '파일용량';

--더미 (선택 - 리뷰할 때 쓰려고 급조)
select *
from o_user;

select *
from o_product;

select *
from o_order;

select *
from o_review;

-- 리뷰 더미
INSERT INTO o_review 
VALUES
( 1 , 1001 , 1 , '' , '이번에 처음 사봤는데 좋네요' , '2024-10-18', 5 , 8, 1, 1 , 'Y','N','','', 1);

INSERT INTO o_review 
VALUES
( 2 , 1002 , 2 , '' , '친구 소개로 왔는데 정말 좋네요 다음부터 이용안하겠습니다.' , '2024-10-19', 1 , 10, 18, 2 , 'N','N','','', 1);

INSERT INTO o_review 
VALUES
( 3 , 1003 , 3 , '' , '이번에 두번째로 이용해보는데 정말 좋네요 광고 아닙니다. 사진도 올릴거임' , '2024-10-21', 5 , 10, 18, 2 , 'N','Y','','', 1);

INSERT INTO o_review 
VALUES
( 4 , 1004 , 4 , '' , '사진이랑 영상으로 퀄리티 보여드립니다' , '2024-10-23', 4 , 23, 1, 1 , 'Y','Y','','', 1);

INSERT INTO o_review 
VALUES
( 5 , 1005 , 5 , '' , '진짜 별로네요 소비자보호협회에 무슨무슨죄로 고소하다 고소해 고소미 냠냠' , '2024-10-28', 1 , 2, 52, 1 , 'N','N','','', 1);

--리뷰 댓글
select * 
from o_comment;

INSERT INTO o_comment
VALUES
( 1 , 1 , 1002  , '2024-10-20','정말 좋네요 나도 사야지');

INSERT INTO o_comment
VALUES
( 2 , 2 , 1002  , '2024-10-20','내가 언제 이런 글을 썼지?');

INSERT INTO o_comment
VALUES
( 3 , 2 , 1003  , '2024-10-21','하하 이자식 완전 바보로구만');

INSERT INTO o_comment
VALUES
( 4 , 3 , 1001  , '2024-10-22','사진 좋네요 사진작가세요?');

INSERT INTO o_comment
VALUES
( 5 , 3 , 1002  , '2024-10-23','이거 바이럴입니다 백퍼센또');

INSERT INTO o_comment
VALUES
( 6 , 4 , 1002  , '2024-10-25','와 퀄리티 보소~~ > ,, <');

INSERT INTO o_comment
VALUES
( 7 , 5 , 1001  , '2024-10-29','어떻게 하나요?');

INSERT INTO o_comment
VALUES
( 8 , 5 , 1004  , '2024-10-29','비~~상~~');

-- 사진 더미 추가
INSERT INTO o_revurl VALUES( 1, 3, 'eca2cf24df7f0b57.webp' , 'eca2cf24df7f0b57.webp' , 10000 );
INSERT INTO o_revurl VALUES( 2, 4, '5862d5a348b87057.webp' , '5862d5a348b87057.webp' , 10000 );

COMMIT;
