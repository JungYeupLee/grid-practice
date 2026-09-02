CREATE TABLE "participants" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"birth_date" date,
	"created_at" timestamp DEFAULT now() NOT NULL
);
