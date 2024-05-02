-- TABLE
CREATE TABLE agent(
  "AgentID" TEXT,
  "Name" TEXT
);
CREATE TABLE "call" (
	"CallID"	TEXT,
	"AgentID"	TEXT,
	"CustomerID"	TEXT,
	"PickedUp"	TEXT,
	"Duration"	INTEGER,
	"ProductSold"	TEXT
);
CREATE TABLE "customer" (
	"CustomerID"	TEXT,
	"Name"	TEXT,
	"Occupation"	TEXT,
	"Email"	TEXT,
	"Company"	TEXT,
	"PhoneNumber"	TEXT,
	"Age"	INTEGER
);
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
