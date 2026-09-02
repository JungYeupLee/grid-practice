-- 실습용 참가자를 넣는다. 생년월일은 실제 값을 쓸 이유가 없으므로
-- 1980-01-01 ~ 2005-12-31 구간에서 무작위로 만든다.
-- Postgres에서 date - date는 일수(integer)이므로, 여기에 random()을 곱해
-- 시작 날짜에 더하면 구간 안의 임의 날짜가 나온다.
INSERT INTO "participants" ("name", "birth_date")
SELECT
	s.name,
	DATE '1980-01-01' + (random() * (DATE '2005-12-31' - DATE '1980-01-01'))::int
FROM (VALUES ('김서준'), ('이지우'), ('박하준'), ('최유나'), ('정민서')) AS s(name);
--> statement-breakpoint
-- 이미 들어 있던 행 중 생년월일이 비어 있으면 같은 방식으로 채운다.
UPDATE "participants"
SET "birth_date" =
	DATE '1980-01-01' + (random() * (DATE '2005-12-31' - DATE '1980-01-01'))::int
WHERE "birth_date" IS NULL;
