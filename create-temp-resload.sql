DROP TABLE IF EXISTS "tempResLoad";
CREATE TABLE IF NOT EXISTS "tempResLoad" (
	"Source" TEXT,
	"PropertyCode" VARCHAR(10),
	"ResID" VARCHAR(20),
	"Title" VARCHAR(20),
	"Name" VARCHAR(200),
	"CheckInDate" DATE,
	"CheckOutDate" DATE,
	"RateCode" VARCHAR(20),
	"Status" VARCHAR(10),
	"RoomNumber" VARCHAR(10),
	"EmailAddress" TEXT,
	"LastUpdated" TIMESTAMP,
	"RoomType" VARCHAR(20)
);
TRUNCATE "tempResLoad";
