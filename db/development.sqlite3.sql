BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "users" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"email"	varchar NOT NULL DEFAULT '',
	"encrypted_password"	varchar NOT NULL DEFAULT '',
	"reset_password_token"	varchar,
	"reset_password_sent_at"	datetime,
	"remember_created_at"	datetime,
	"sign_in_count"	integer NOT NULL DEFAULT 0,
	"current_sign_in_at"	datetime,
	"last_sign_in_at"	datetime,
	"current_sign_in_ip"	varchar,
	"last_sign_in_ip"	varchar,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"fullname"	varchar,
	"confirmation_token"	varchar,
	"confirmed_at"	datetime,
	"confirmation_sent_at"	datetime,
	"provider"	varchar,
	"uid"	varchar,
	"image"	varchar,
	"phone_number"	varchar,
	"description"	text,
	"pin"	varchar,
	"phone_verified"	boolean,
	"stripe_id"	varchar,
	"merchant_id"	varchar,
	"merchant_provider"	varchar,
	"merchant_access_code"	varchar,
	"merchant_publishable_key"	varchar,
	"unread"	integer DEFAULT 1
);
CREATE TABLE IF NOT EXISTS "notifications" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content"	varchar,
	"user_id"	integer,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "settings" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"enable_email"	boolean DEFAULT 't',
	"enable_sms"	boolean DEFAULT 't',
	"user_id"	integer,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "calendars" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"day"	date,
	"price"	integer,
	"status"	integer,
	"room_id"	integer,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "messages" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content"	text,
	"user_id"	integer,
	"conversation_id"	integer,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "conversations" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"sender_id"	integer,
	"recipient_id"	integer,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "reviews" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"comment"	text,
	"star"	integer DEFAULT 1,
	"room_id"	integer,
	"reservation_id"	integer,
	"guest_id"	integer,
	"host_id"	integer,
	"type"	varchar,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "reservations" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer,
	"room_id"	integer,
	"start_date"	datetime,
	"end_date"	datetime,
	"price"	integer,
	"total"	integer,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"status"	integer DEFAULT 1
);
CREATE TABLE IF NOT EXISTS "photos" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"room_id"	integer,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"image_file_name"	varchar,
	"image_content_type"	varchar,
	"image_file_size"	integer,
	"image_updated_at"	datetime
);
CREATE TABLE IF NOT EXISTS "rooms" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"home_type"	varchar,
	"room_type"	varchar,
	"accommodate"	integer,
	"bed_room"	integer,
	"bath_room"	integer,
	"listing_name"	varchar,
	"summary"	text,
	"address"	varchar,
	"is_tv"	boolean,
	"is_kitchen"	boolean,
	"is_air"	boolean,
	"is_heating"	boolean,
	"is_internet"	boolean,
	"price"	integer,
	"active"	boolean,
	"user_id"	integer,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"latitude"	float,
	"longitude"	float,
	"instant"	integer DEFAULT 1
);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" (
	"key"	varchar NOT NULL,
	"value"	varchar,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	PRIMARY KEY("key")
);
CREATE TABLE IF NOT EXISTS "schema_migrations" (
	"version"	varchar NOT NULL,
	PRIMARY KEY("version")
);
INSERT INTO "users" VALUES (1,'nabivanec.a@gmail.com','$2a$11$XZZ13ci13Qb68p00HT0OpeuPZAQW110Yw.aSUZJAonWN5hGP4T4Nu',NULL,NULL,NULL,10,'2018-12-10 15:15:34.019215','2018-12-06 20:34:42.478089','127.0.0.1','127.0.0.1','2018-12-03 00:57:23.858373','2018-12-10 15:15:34.020516','Andrew Nabyvanets',NULL,'2018-12-03 00:57:23.851166',NULL,'facebook','1850635635047906','http://graph.facebook.com/v2.6/1850635635047906/picture',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO "users" VALUES (5,'ank47nabivanets@hotmail.com','$2a$11$JxzSr2pcsWB9bsGtIA11KOHmXcm46i9ShF71Yk.qjVvjiXjkdZ7Te',NULL,NULL,NULL,3,'2018-12-06 20:31:24.027714','2018-12-05 20:19:09.849974','127.0.0.1','127.0.0.1','2018-12-05 20:16:38.504465','2018-12-06 20:31:24.029859','Antony Rodriges','AhNYoK-RSBveQfyKycrA','2018-12-05 20:17:21.011798','2018-12-05 20:16:38.504743',NULL,NULL,NULL,NULL,'',NULL,NULL,'cus_E6LMvQB92pHBrl',NULL,NULL,NULL,NULL,0);
INSERT INTO "notifications" VALUES (1,'New Booking from Antony Rodriges',1,'2018-12-05 22:16:47.186389','2018-12-05 22:16:47.186389');
INSERT INTO "notifications" VALUES (2,'New Booking from Antony Rodriges',1,'2018-12-05 22:16:57.313615','2018-12-05 22:16:57.313615');
INSERT INTO "notifications" VALUES (3,'New Booking from Antony Rodriges',1,'2018-12-05 22:21:34.726572','2018-12-05 22:21:34.726572');
INSERT INTO "notifications" VALUES (4,'New Booking from Antony Rodriges',1,'2018-12-05 22:21:45.673388','2018-12-05 22:21:45.673388');
INSERT INTO "notifications" VALUES (5,'New Booking from Antony Rodriges',1,'2018-12-05 22:25:54.148054','2018-12-05 22:25:54.148054');
INSERT INTO "notifications" VALUES (6,'New Booking from Antony Rodriges',1,'2018-12-05 22:26:19.764158','2018-12-05 22:26:19.764158');
INSERT INTO "notifications" VALUES (7,'New Booking from Antony Rodriges',1,'2018-12-05 22:27:10.774320','2018-12-05 22:27:10.774320');
INSERT INTO "notifications" VALUES (8,'New Booking from Antony Rodriges',1,'2018-12-05 22:28:10.069541','2018-12-05 22:28:10.069541');
INSERT INTO "notifications" VALUES (9,'New Booking from Antony Rodriges',1,'2018-12-05 22:29:35.181571','2018-12-05 22:29:35.181571');
INSERT INTO "notifications" VALUES (10,'New Request from Antony Rodriges',1,'2018-12-06 20:31:55.708821','2018-12-06 20:31:55.708821');
INSERT INTO "settings" VALUES (1,'t','t',1,'2018-12-03 00:57:23.883315','2018-12-03 00:57:23.883315');
INSERT INTO "settings" VALUES (2,'t','t',2,'2018-12-05 19:00:43.226382','2018-12-05 19:00:43.226382');
INSERT INTO "settings" VALUES (3,'t','t',3,'2018-12-05 19:01:57.652859','2018-12-05 19:01:57.652859');
INSERT INTO "settings" VALUES (4,'t','t',4,'2018-12-05 19:21:07.912868','2018-12-05 19:21:07.912868');
INSERT INTO "settings" VALUES (5,'t','t',5,'2018-12-05 20:16:38.533830','2018-12-05 20:16:38.533830');
INSERT INTO "reservations" VALUES (1,5,3,'2018-12-13 00:00:00','2018-12-15 00:00:00',90,270,'2018-12-05 22:16:47.158350','2018-12-05 22:16:47.158350',0);
INSERT INTO "reservations" VALUES (2,5,3,'2018-12-13 00:00:00','2018-12-15 00:00:00',90,270,'2018-12-05 22:16:57.290438','2018-12-05 22:16:57.290438',0);
INSERT INTO "reservations" VALUES (3,5,3,'2018-12-13 00:00:00','2018-12-15 00:00:00',90,270,'2018-12-05 22:21:34.709731','2018-12-05 22:21:34.709731',0);
INSERT INTO "reservations" VALUES (4,5,3,'2018-12-11 00:00:00','2018-12-15 00:00:00',90,450,'2018-12-05 22:21:45.653063','2018-12-05 22:21:45.653063',0);
INSERT INTO "reservations" VALUES (5,5,3,'2018-12-11 00:00:00','2018-12-15 00:00:00',90,450,'2018-12-05 22:25:54.118207','2018-12-05 22:25:56.854335',1);
INSERT INTO "reservations" VALUES (6,5,3,'2018-12-12 00:00:00','2018-12-15 00:00:00',90,360,'2018-12-05 22:26:19.746416','2018-12-05 22:26:22.601859',1);
INSERT INTO "reservations" VALUES (7,5,3,'2018-12-12 00:00:00','2018-12-15 00:00:00',90,360,'2018-12-05 22:27:10.741989','2018-12-05 22:27:13.991269',1);
INSERT INTO "reservations" VALUES (8,5,1,'2018-12-12 00:00:00','2018-12-14 00:00:00',20,60,'2018-12-05 22:28:10.041532','2018-12-05 22:28:12.754110',1);
INSERT INTO "reservations" VALUES (9,5,3,'2019-01-17 00:00:00','2019-01-19 00:00:00',90,270,'2018-12-05 22:29:35.164432','2018-12-05 22:29:37.537984',1);
INSERT INTO "reservations" VALUES (10,5,4,'2018-12-31 00:00:00','2019-01-02 00:00:00',160,480,'2018-12-06 20:31:55.682094','2018-12-06 20:31:55.682094',0);
INSERT INTO "photos" VALUES (1,1,'2018-12-05 18:50:11.438155','2018-12-05 18:50:11.438155','lviv.bmp','image/x-ms-bmp',4210842,'2018-12-05 18:50:10.981364');
INSERT INTO "photos" VALUES (3,2,'2018-12-05 19:37:33.140897','2018-12-05 19:37:33.140897','91169-640x360-101-image-640.bmp','image/x-ms-bmp',691338,'2018-12-05 19:37:33.007513');
INSERT INTO "photos" VALUES (4,2,'2018-12-05 19:37:33.450339','2018-12-05 19:37:33.450339','1000px-Palace_of_Westminster_from_the_dome_on_Methodist_Central_Hall.bmp','image/x-ms-bmp',2001138,'2018-12-05 19:37:33.213489');
INSERT INTO "photos" VALUES (5,3,'2018-12-05 19:47:46.940126','2018-12-05 19:47:46.940126','Los_Angeles__Winter_2016.bmp','image/x-ms-bmp',31359114,'2018-12-05 19:47:43.426007');
INSERT INTO "photos" VALUES (6,3,'2018-12-05 19:47:47.303697','2018-12-05 19:47:47.303697','downtown-la-skyline.bmp','image/x-ms-bmp',854538,'2018-12-05 19:47:47.119387');
INSERT INTO "photos" VALUES (7,3,'2018-12-05 19:47:47.603407','2018-12-05 19:47:47.603407','macys-los-angeles-skyline-at-night-header.bmp','image/x-ms-bmp',1463178,'2018-12-05 19:47:47.364881');
INSERT INTO "photos" VALUES (8,4,'2018-12-05 19:59:43.811224','2018-12-05 19:59:43.811224','paris-2017-home.bmp','image/x-ms-bmp',9720138,'2018-12-05 19:59:42.915999');
INSERT INTO "photos" VALUES (9,4,'2018-12-05 19:59:44.026731','2018-12-05 19:59:44.026731','1000px-Palace_of_Westminster_from_the_dome_on_Methodist_Central_Hall.bmp','image/x-ms-bmp',766398,'2018-12-05 19:59:43.901470');
INSERT INTO "photos" VALUES (10,5,'2018-12-05 20:04:17.785157','2018-12-05 20:04:17.785157','shutterstock_449361664-1200x540.bmp','image/x-ms-bmp',1944138,'2018-12-05 20:04:17.585826');
INSERT INTO "photos" VALUES (11,5,'2018-12-05 20:04:18.050063','2018-12-05 20:04:18.050063','miami-beach-waterworld-david-kamp.bmp','image/x-ms-bmp',1278858,'2018-12-05 20:04:17.852804');
INSERT INTO "photos" VALUES (12,5,'2018-12-05 20:04:18.259633','2018-12-05 20:04:18.259633','everglades-and-miami.bmp','image/x-ms-bmp',601466,'2018-12-05 20:04:18.121613');
INSERT INTO "rooms" VALUES (1,'Apartment','Private',1,1,1,'Best Flat','Best Flat ','Lviv Oblast, Ukraine','t','t','t','t','t',20,'t',1,'','2018-12-05 18:50:15.694395',49.6512234,23.8266948,1);
INSERT INTO "rooms" VALUES (2,'Apartment','Entire',3,2,1,'Best Flat in London','Just the best','Chelsea, London, UK','f','f','f','t','f',100,'t',1,'','2018-12-05 19:51:53.975962',51.4875417,-0.1682205,1);
INSERT INTO "rooms" VALUES (3,'Apartment','Private',3,2,2,'LA Flat downtown','Flat in Los Angeles Downtown','Downtown, Los Angeles, CA, USA',NULL,NULL,NULL,NULL,NULL,90,'t',1,'','2018-12-05 19:54:03.299341',33.96686645,-118.351675719108,1);
INSERT INTO "rooms" VALUES (4,'','Entire',2,2,1,'Appartment in Paris','Appartment in Paris','Paris, France',NULL,NULL,NULL,NULL,NULL,160,'t',1,'','2018-12-05 19:59:59.951771',48.8566101,2.3514992,0);
INSERT INTO "rooms" VALUES (5,'House','Private',3,3,3,'House Miami','Beach house in Miami','Miami, FL, USA',NULL,NULL,NULL,NULL,NULL,120,'t',1,'','2018-12-05 20:05:27.271496',25.7742658,-80.1936589,1);
INSERT INTO "ar_internal_metadata" VALUES ('environment','development','2018-12-03 00:28:00.356279','2018-12-03 00:28:00.356279');
INSERT INTO "schema_migrations" VALUES ('20170601111504');
INSERT INTO "schema_migrations" VALUES ('20170601123636');
INSERT INTO "schema_migrations" VALUES ('20170603044035');
INSERT INTO "schema_migrations" VALUES ('20170603052652');
INSERT INTO "schema_migrations" VALUES ('20170603062052');
INSERT INTO "schema_migrations" VALUES ('20170604041812');
INSERT INTO "schema_migrations" VALUES ('20170604104057');
INSERT INTO "schema_migrations" VALUES ('20170604104107');
INSERT INTO "schema_migrations" VALUES ('20170606050251');
INSERT INTO "schema_migrations" VALUES ('20170606060855');
INSERT INTO "schema_migrations" VALUES ('20170612041625');
INSERT INTO "schema_migrations" VALUES ('20170701105621');
INSERT INTO "schema_migrations" VALUES ('20170702081117');
INSERT INTO "schema_migrations" VALUES ('20170702081152');
INSERT INTO "schema_migrations" VALUES ('20170703001821');
INSERT INTO "schema_migrations" VALUES ('20170703001839');
INSERT INTO "schema_migrations" VALUES ('20170703065629');
INSERT INTO "schema_migrations" VALUES ('20170703123155');
INSERT INTO "schema_migrations" VALUES ('20170704040417');
INSERT INTO "schema_migrations" VALUES ('20170705051041');
INSERT INTO "schema_migrations" VALUES ('20170705055826');
INSERT INTO "schema_migrations" VALUES ('20170705060049');
INSERT INTO "schema_migrations" VALUES ('20170705114915');
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_confirmation_token" ON "users" (
	"confirmation_token"
);
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_reset_password_token" ON "users" (
	"reset_password_token"
);
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_email" ON "users" (
	"email"
);
CREATE INDEX IF NOT EXISTS "index_notifications_on_user_id" ON "notifications" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "index_settings_on_user_id" ON "settings" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "index_calendars_on_room_id" ON "calendars" (
	"room_id"
);
CREATE INDEX IF NOT EXISTS "index_messages_on_conversation_id" ON "messages" (
	"conversation_id"
);
CREATE INDEX IF NOT EXISTS "index_messages_on_user_id" ON "messages" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "index_reviews_on_host_id" ON "reviews" (
	"host_id"
);
CREATE INDEX IF NOT EXISTS "index_reviews_on_guest_id" ON "reviews" (
	"guest_id"
);
CREATE INDEX IF NOT EXISTS "index_reviews_on_reservation_id" ON "reviews" (
	"reservation_id"
);
CREATE INDEX IF NOT EXISTS "index_reviews_on_room_id" ON "reviews" (
	"room_id"
);
CREATE INDEX IF NOT EXISTS "index_reservations_on_room_id" ON "reservations" (
	"room_id"
);
CREATE INDEX IF NOT EXISTS "index_reservations_on_user_id" ON "reservations" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "index_photos_on_room_id" ON "photos" (
	"room_id"
);
CREATE INDEX IF NOT EXISTS "index_rooms_on_user_id" ON "rooms" (
	"user_id"
);
COMMIT;
