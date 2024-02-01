/*

#Script adapted to work with PostgreSQL 9.2.5 and UMLS2018AA by Juan M. Banda (juan@jmbanda.com)
PostgreSQL load script authored and contributed by Steve Bedrick (bedricks@ohsu.edu).
Please point each 'COPY' statement to your local '/tmp/META' installation directory, or wherever you have stored the .RRF files output by MetamorphoSys. 
This script has been tested in PostgreSQL 8.2.3 on Mac OS 10.4.10

# The script can also work with PostgreSQL 11.2 and UMLS-2020AB by Zhao Zhengyang (tsingcheng1327@live.cn)
Thank you for Mr Banda and Mr Bedrick!
This script has been tested in PostgreSQL 11.2 on Linux (Deepin 20.1, Debain 10 cored).

*/

create schema if not exists _2023ab; /* You can change the schema name as your wish. */
set schema '_2023ab';

DROP TABLE if exists MRCOLS;
CREATE TABLE MRCOLS (
	COL	char(40),
	DES	char(200),
	REF	char(40),
	MIN	integer,
	AV	float,
	MAX	integer,
	FIL	char(50),
	DTY	char(40),
	dummy char(1)
);

---change the path of RRF file according the practice---
\copy MRCOLS FROM '/Users/shashankjatav/shash_work/2023AB/META/MRCOLS.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRCOLS DROP COLUMN dummy;


DROP TABLE if exists MRCONSO;
CREATE TABLE  MRCONSO (
	CUI	char(8) NOT NULL,
	LAT	char(3) NOT NULL,
	TS	char(1) NOT NULL,
	LUI	char(10) NOT NULL,
	STT	char(3) NOT NULL,
	SUI	char(10) NOT NULL,
	ISPREF	char(1) NOT NULL,
	AUI	char(9) NOT NULL,
	SAUI	char(50),
	SCUI	char(100),
	SDUI	char(100),
	SAB	char(40) NOT NULL,
	TTY	char(40) NOT NULL,
	CODE	char(100) NOT NULL,
	STR	char(3000) NOT NULL,
	SRL	integer NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	CVF	integer,
	dummy char(1)
);

\copy MRCONSO FROM '/Users/shashankjatav/shash_work/2023AB/META/MRCONSO.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRCONSO DROP COLUMN dummy;


DROP TABLE if exists MRCUI;
CREATE TABLE MRCUI (
	CUI1	char(8) NOT NULL,
	VER	char(10) NOT NULL,
	REL	char(4) NOT NULL,
	RELA	char(100),
	MAPREASON	char(4000),
	CUI2	char(8),
	MAPIN	char(1),
	dummy char(1)
);

\copy MRCUI FROM '/Users/shashankjatav/shash_work/2023AB/META/MRCUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRCUI DROP COLUMN dummy;


DROP TABLE if exists MRDEF;
CREATE TABLE MRDEF (
	CUI	char(8) NOT NULL,
	AUI	char(9) NOT NULL,
	ATUI	char(11) NOT NULL,
	SATUI	char(50),
	SAB	char(40) NOT NULL,
	DEF	text NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	CVF	integer,
	dummy char(1)
);

\copy MRDEF FROM '/Users/shashankjatav/shash_work/2023AB/META/MRDEF.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRDEF DROP COLUMN dummy;


DROP TABLE if exists MRDOC;
CREATE TABLE MRDOC (
	DOCKEY	char(50) NOT NULL,
	VALUE	char(200),
	TYPE	char(50) NOT NULL,
	EXPL	char(1000),
	dummy char(1)
);

\copy MRDOC FROM '/Users/shashankjatav/shash_work/2023AB/META/MRDOC.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRDOC DROP COLUMN dummy;


DROP TABLE if exists MRFILES;
CREATE TABLE MRFILES (
	FIL	char(50),
	DES	char(200),
	FMT	char(300),
	CLS	bigint,
	RWS	bigint,
	BTS	bigint,
	dummy char(1)
);

\copy MRFILES FROM '/Users/shashankjatav/shash_work/2023AB/META/MRFILES.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRFILES DROP COLUMN dummy;


DROP TABLE if exists MRHIER;
CREATE TABLE MRHIER (
	CUI	char(8) NOT NULL,
	AUI	char(9) NOT NULL,
	CXN	integer NOT NULL,
	PAUI	char(10),
	SAB	char(40) NOT NULL,
	RELA	char(100),
	PTR	char(1000),
	HCD	char(100),
	CVF	integer,
	dummy char(1)
);

\copy MRHIER FROM '/Users/shashankjatav/shash_work/2023AB/META/MRHIER.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRHIER DROP COLUMN dummy;


DROP TABLE if exists MRHIST;
CREATE TABLE MRHIST (
	CUI	char(8) NOT NULL,
	SOURCEUI	char(100) NOT NULL,
	SAB	char(40) NOT NULL,
	SVER	char(40) NOT NULL,
	CHANGETYPE	char(1000) NOT NULL,
	CHANGEKEY	char(1000) NOT NULL,
	CHANGEVAL	char(1000) NOT NULL,
	REASON	char(1000),
	CVF	integer,
	dummy char(1)
);

\copy MRHIST FROM '/Users/shashankjatav/shash_work/2023AB/META/MRHIST.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRHIST DROP COLUMN dummy;


DROP TABLE if exists MRMAP;
CREATE TABLE MRMAP (
	MAPSETCUI	char(8),
	MAPSETSAB	char(40),
	MAPSUBSETID	char(10),
	MAPRANK	integer,
	MAPID	char(50),
	MAPSID	char(50),
	FROMID	char(50),
	FROMSID	char(50),
	FROMEXPR	char(4000),
	FROMTYPE	char(50),
	FROMRULE	char(4000),
	FROMRES	char(4000),
	REL	char(4),
	RELA	char(100),
	TOID	char(50),
	TOSID	char(50),
	TOEXPR	char(4000),
	TOTYPE	char(50),
	TORULE	char(4000),
	TORES	char(4000),
	MAPRULE	char(4000),
	MAPRES	char(4000),
	MAPTYPE	char(50),
	MAPATN	char(100),
	MAPATV	char(4000),
	CVF	integer,
	dummy char(1)
);
\copy MRMAP FROM '/Users/shashankjatav/shash_work/2023AB/META/MRMAP.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRMAP DROP COLUMN dummy;


DROP TABLE if exists MRRANK;
CREATE TABLE MRRANK (
	RANK	integer NOT NULL,
	SAB	char(40) NOT NULL,
	TTY	char(40) NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	dummy char(1)
);
\copy MRRANK FROM '/Users/shashankjatav/shash_work/2023AB/META/MRRANK.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRRANK DROP COLUMN dummy;


DROP TABLE if exists MRREL;
CREATE TABLE MRREL (
	CUI1	char(8) NOT NULL,
	AUI1	char(9),
	STYPE1	char(50) NOT NULL,
	REL	char(4) NOT NULL,
	CUI2	char(8) NOT NULL,
	AUI2	char(9),
	STYPE2	char(50) NOT NULL,
	RELA	char(100),
	RUI	char(10) NOT NULL,
	SRUI	char(50),
	SAB	char(40) NOT NULL,
	SL	char(40) NOT NULL,
	RG	char(10),
	DIR	char(1),
	SUPPRESS	char(1) NOT NULL,
	CVF	integer,
	dummy char(1)
);

\copy MRREL FROM '/Users/shashankjatav/shash_work/2023AB/META/MRREL.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRREL DROP COLUMN dummy;

DROP TABLE if exists MRSAB;
CREATE TABLE MRSAB (
	VCUI	char(8),
	RCUI	char(8),
	VSAB	char(40) NOT NULL,
	RSAB	char(40) NOT NULL,
	SON	char(3000) NOT NULL,
	SF	char(40) NOT NULL,
	SVER	char(40),
	VSTART	char(8),
	VEND	char(8),
	IMETA	char(10) NOT NULL,
	RMETA	char(10),
	SLC	char(1000),
	SCC	char(1000),
	SRL	integer NOT NULL,
	TFR	integer,
	CFR	integer,
	CXTY	char(50),
	TTYL	char(400),
	ATNL	char(4000),
	LAT	char(3),
	CENC	char(40) NOT NULL,
	CURVER	char(1) NOT NULL,
	SABIN	char(1) NOT NULL,
	SSN	char(3000) NOT NULL,
	SCIT	char(4000) NOT NULL,
	dummy char(1)
);
\copy MRSAB FROM '/Users/shashankjatav/shash_work/2023AB/META/MRSAB.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRSAB DROP COLUMN dummy;


DROP TABLE if exists MRSAT;
CREATE TABLE MRSAT (
	CUI	char(8) NOT NULL,
	LUI	char(10),
	SUI	char(10),
	METAUI	char(100),
	STYPE	char(50) NOT NULL,
	CODE	char(100),
	ATUI	char(11) NOT NULL,
	SATUI	char(50),
	ATN	char(100) NOT NULL,
	SAB	char(40) NOT NULL,
	ATV	text,
	SUPPRESS	char(1) NOT NULL,
	CVF	integer,
	dummy char(1)
);
\copy MRSAT FROM '/Users/shashankjatav/shash_work/2023AB/META//MRSAT.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRSAT DROP COLUMN dummy;


DROP TABLE if exists MRSMAP;
CREATE TABLE MRSMAP (
	MAPSETCUI	char(8),
	MAPSETSAB	char(40),
	MAPID	char(50),
	MAPSID	char(50),
	FROMEXPR	char(4000),
	FROMTYPE	char(50),
	REL	char(4),
	RELA	char(100),
	TOEXPR	char(4000),
	TOTYPE	char(50),
	CVF	integer,
	dummy char(1)
);
\copy MRSMAP FROM '/Users/shashankjatav/shash_work/2023AB/META/MRSMAP.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRSMAP DROP COLUMN dummy;


DROP TABLE if exists MRSTY;
CREATE TABLE MRSTY (
	CUI	char(8) NOT NULL,
	TUI	char(4) NOT NULL,
	STN	char(100) NOT NULL,
	STY	char(50) NOT NULL,
	ATUI	char(11) NOT NULL,
	CVF	integer,
	dummy char(1)
);
\copy MRSTY FROM '/Users/shashankjatav/shash_work/2023AB/META/MRSTY.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRSTY DROP COLUMN dummy;


DROP TABLE if exists MRXNS_ENG;
CREATE TABLE MRXNS_ENG (
	LAT	char(3) NOT NULL,
	NSTR	char(3000) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	char(10) NOT NULL,
	SUI	char(10) NOT NULL,
	dummy char(1)
);
\copy MRXNS_ENG FROM '/Users/shashankjatav/shash_work/2023AB/META/MRXNS_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRXNS_ENG DROP COLUMN dummy;


DROP TABLE if exists MRXNW_ENG;
CREATE TABLE MRXNW_ENG (
	LAT	char(3) NOT NULL,
	NWD	char(200) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	char(10) NOT NULL,
	SUI	char(10) NOT NULL,
	dummy char(1)
);
\copy MRXNW_ENG FROM '/Users/shashankjatav/shash_work/2023AB/META/MRXNW_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRXNW_ENG DROP COLUMN dummy;

DROP TABLE if exists MRXW_ENG;
CREATE TABLE MRXW_ENG (
	LAT	char(3) NOT NULL,
	WD	char(200) NOT NULL,
	CUI	char(8) NOT NULL,
	LUI	char(10) NOT NULL,
	SUI	char(10) NOT NULL,
	dummy char(1)
);
\copy MRXW_ENG FROM '/Users/shashankjatav/shash_work/2023AB/META/MRXW_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRXW_ENG DROP COLUMN dummy;

/*  Because I only use English items, I deleted the load of MRXW_XXX loaders except English one.
	If you want to load another language, you can rewrite the SQL expression as follows:

	DROP TABLE if exists MRXW_LAN; ---'LAN' means the language.---
	CREATE TABLE MRXW_ENG (
		LAT	char(3) NOT NULL,
		WD	varchar(100) NOT NULL,
		CUI	char(12) NOT NULL,
		LUI	char(12) NOT NULL,
		SUI	char(12) NOT NULL,
		dummy char(1)
	);
	COPY MRXW_LAN FROM '/your/path/META/MRXW_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';
	ALTER TABLE MRXW_LAN DROP COLUMN dummy;
 */

DROP TABLE if exists MRAUI;
CREATE TABLE MRAUI (
	AUI1	char(9) NOT NULL,
	CUI1	char(8) NOT NULL,
	VER	char(10) NOT NULL,
	REL	char(4),
	RELA	char(100),
	MAPREASON	char(4000) NOT NULL,
	AUI2	char(9) NOT NULL,
	CUI2	char(8) NOT NULL,
	MAPIN	char(1) NOT NULL,
	dummy char(1)
);
\copy MRAUI FROM '/Users/shashankjatav/shash_work/2023AB/META/MRAUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MRAUI DROP COLUMN dummy;


DROP TABLE if exists AMBIGSUI;
CREATE TABLE AMBIGSUI (
	SUI	char(10) NOT NULL,
	CUI	char(8) NOT NULL,
	dummy char(1)
);

\copy AMBIGSUI FROM '/Users/shashankjatav/shash_work/2023AB/META/AMBIGSUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE AMBIGSUI DROP COLUMN dummy;


DROP TABLE if exists AMBIGLUI;
CREATE TABLE AMBIGLUI (
	LUI	char(10) NOT NULL,
	CUI	char(8) NOT NULL,
	dummy char(1)
);

\copy AMBIGLUI FROM '/Users/shashankjatav/shash_work/2023AB/META/AMBIGLUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE AMBIGLUI DROP COLUMN dummy;


DROP TABLE if exists DELETEDCUI;
CREATE TABLE DELETEDCUI (
	PCUI	char(8) NOT NULL,
	PSTR	char(3000) NOT NULL,
	dummy char(1)
);
\copy DELETEDCUI FROM '/Users/shashankjatav/shash_work/2023AB/META/CHANGE/DELETEDCUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE DELETEDCUI DROP COLUMN dummy;


DROP TABLE if exists DELETEDLUI;
CREATE TABLE DELETEDLUI (
	PLUI	char(10) NOT NULL,
	PSTR	char(3000) NOT NULL,
	dummy char(1)
);
\copy DELETEDLUI FROM '/Users/shashankjatav/shash_work/2023AB/META/CHANGE/DELETEDLUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE DELETEDLUI DROP COLUMN dummy;

DROP TABLE if exists DELETEDSUI;
CREATE TABLE DELETEDSUI (
	PSUI	char(10) NOT NULL,
	LAT	char(3) NOT NULL,
	PSTR	char(3000) NOT NULL,
	dummy char(1)
);
\copy DELETEDSUI FROM '/Users/shashankjatav/shash_work/2023AB/META/CHANGE/DELETEDSUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE DELETEDSUI DROP COLUMN dummy;


DROP TABLE if exists MERGEDCUI;
CREATE TABLE MERGEDCUI (
	PCUI	char(8) NOT NULL,
	CUI	char(8) NOT NULL,
	dummy char(1)
);
\copy MERGEDCUI FROM '/Users/shashankjatav/shash_work/2023AB/META/CHANGE/MERGEDCUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MERGEDCUI DROP COLUMN dummy;


DROP TABLE if exists MERGEDLUI;
CREATE TABLE MERGEDLUI (
	PLUI	char(10),
	LUI	char(10),
	dummy char(1)
);
\copy MERGEDLUI FROM '/Users/shashankjatav/shash_work/2023AB/META/CHANGE/MERGEDLUI.RRF' WITH DELIMITER AS '|' NULL AS '';
ALTER TABLE MERGEDLUI DROP COLUMN dummy;