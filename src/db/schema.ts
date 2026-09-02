import { date, integer, pgTable, serial, text, timestamp } from 'drizzle-orm/pg-core'

/* 실습용 표 하나. 이 파일이 "코드가 원하는 DB 구조"다.
   여기에 column을 하나 더한 뒤 db:generate, db:migrate를 실행하면
   실제 DB가 이 모양을 따라온다. */
export const participants = pgTable('participants', {
  id: serial('id').primaryKey(),
  name: text('name').notNull(),
  /* 생년월일. 모르는 참가자도 있을 수 있으므로 비워 둘 수 있게 한다. */
  birthDate: date('birth_date'),
  createdAt: timestamp('created_at').defaultNow().notNull(),
})

/* 강의에서 진행할 내용을 순서대로 담는 표.
   step으로 순서를 정하고, title은 그 단계에서 무엇을 하는지,
   body는 왜 그렇게 하는지를 적는다.

   이 표는 실제 DB에 이미 있다(0001_pretty_tinkerer). 여기서 빼면
   db:generate가 DROP TABLE lectures를 만들어 버리므로 반드시 남겨 둔다. */
export const lectures = pgTable('lectures', {
  id: serial('id').primaryKey(),
  step: integer('step').notNull(),
  title: text('title').notNull(),
  body: text('body'),
  createdAt: timestamp('created_at').defaultNow().notNull(),
})
