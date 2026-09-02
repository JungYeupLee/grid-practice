import { date, pgTable, serial, text, timestamp } from 'drizzle-orm/pg-core'

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
