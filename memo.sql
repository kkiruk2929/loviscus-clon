
CREATE DATABASE `dev`;
USE dev;

CREATE TABLE IF NOT EXISTS `memo` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` VARCHAR(30) NOT NULL COMMENT 'user login id',
	`content` TEXT DEFAULT NULL COMMENT '메모 내용' COLLATE 'utf8mb4_general_ci',
	`created_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
	PRIMARY KEY (`id`) USING BTREE
)
COMMENT='메모 테이블'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;

-- 메모 내용 추가
INSERT INTO memo (`user_id`, `content`) VALUES ('lee jun', '너무 좋아요~');
INSERT INTO memo (`user_id`, `content`) VALUES ('doodoo', '진짜 구려요 쓰레기에요 씨발~~');
INSERT INTO memo (`user_id`, `content`) VALUES ('붐바야', '그냥 그렇네요!!!!!!');
INSERT INTO memo (`user_id`, `content`) VALUES ('아이구', '그냥 저냥 쓸게요!');
INSERT INTO memo (`user_id`, `content`) VALUES ('몰러', '걍씀');

-- created_date의 순으로 정렬해서 가져오기, 최대 10개
SELECT id, user_id, content, created_date FROM memo ORDER BY created_date ASC LIMIT 10;

-- created_date의 역순으로 정렬해서 가져오기, 최대 10개
SELECT id, user_id, content, created_date FROM memo ORDER BY created_date DESC LIMIT 10;

-- 특정 문자가 포함된 검색
SELECT id, user_id, content, created_date FROM memo WHERE content LIKE '%fuck%' ORDER BY created_date DESC LIMIT 10;

-- user_id가 'lee jun'인 것들 모두 지우기
DELETE FROM memo WHERE user_id = 'lee jun';

-- id가 1인 것 지우기
DELETE FROM memo WHERE id = 1;

-- 특정 문자가 포함된 게시글 업데이트
UPDATE memo SET content = '1번 게시글 수정' WHERE id = 1;

-- 특정 문자가 포함된 게시글 업데이트
UPDATE memo SET content = 'modified content' WHERE content LIKE '%fuck%';