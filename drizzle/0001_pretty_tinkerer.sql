CREATE TABLE "lectures" (
	"id" serial PRIMARY KEY NOT NULL,
	"step" integer NOT NULL,
	"title" text NOT NULL,
	"body" text,
	"created_at" timestamp DEFAULT now() NOT NULL
);
