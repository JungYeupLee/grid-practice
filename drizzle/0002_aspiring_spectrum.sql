ALTER TABLE "participants" ADD COLUMN IF NOT EXISTS "birth_date" date;--> statement-breakpoint
-- 이미 있는 참가자의 생년월일을 채운다. 실습용이라 실제 값을 쓸 이유가 없어
-- 1980-01-01 ~ 2005-12-31 구간에서 무작위로 만든다.
-- Postgres에서 date - date는 일수(integer)이므로 random()을 곱해 시작 날짜에 더하면
-- 구간 안의 임의 날짜가 되고, random()은 행마다 다시 평가되어 각자 다른 값이 된다.
-- 값이 비어 있는 행만 건드리므로 다시 실행해도 기존 값을 덮어쓰지 않는다.
UPDATE "participants"
SET "birth_date" =
	DATE '1980-01-01' + (random() * (DATE '2005-12-31' - DATE '1980-01-01'))::int
WHERE "birth_date" IS NULL;
