/*  2020 version
	Created by: 
	Yeb Havinga, MSc
	yhavinga@gmail.com

	Modified by:
	Juan M. Banda 
	juan@jmbanda.com

	Tested by:
	Zhao Zhengyang
	tsingcheng1327@live.cn

	2023 version
	Modified by:
	Shashank

*/

--- I deleted the expression where tables does not exist in this version. ---

CREATE INDEX X_MRCONSO_CUI ON MRCONSO(CUI);
ALTER TABLE MRCONSO ADD CONSTRAINT X_MRCONSO_PK PRIMARY KEY (AUI);
CREATE INDEX X_MRCONSO_SUI ON MRCONSO(SUI);
CREATE INDEX X_MRCONSO_LUI ON MRCONSO(LUI);
CREATE INDEX X_MRCONSO_CODE ON MRCONSO(CODE);
CREATE INDEX X_MRCONSO_SAB_TTY ON MRCONSO(SAB,TTY);
CREATE INDEX X_MRCONSO_SCUI ON MRCONSO(SCUI);
CREATE INDEX X_MRCONSO_STR ON MRCONSO(STR);
CREATE INDEX X_MRDEF_CUI ON MRDEF(CUI);
CREATE INDEX X_MRDEF_AUI ON MRDEF(AUI);
ALTER TABLE MRDEF ADD CONSTRAINT X_MRDEF_PK PRIMARY KEY (ATUI);
CREATE INDEX X_MRDEF_SAB ON MRDEF(SAB);
CREATE INDEX X_MRHIER_CUI ON MRHIER(CUI);
CREATE INDEX X_MRHIER_AUI ON MRHIER(AUI);
CREATE INDEX X_MRHIER_SAB ON MRHIER(SAB);
CREATE INDEX X_MRHIER_PTR ON MRHIER(PTR);
CREATE INDEX X_MRHIER_PAUI ON MRHIER(PAUI);
CREATE INDEX X_MRHIST_CUI ON MRHIST(CUI);
CREATE INDEX X_MRHIST_SOURCEUI ON MRHIST(SOURCEUI);
CREATE INDEX X_MRHIST_SAB ON MRHIST(SAB);
ALTER TABLE MRRANK ADD CONSTRAINT X_MRRANK_PK PRIMARY KEY (SAB,TTY);
CREATE INDEX X_MRREL_CUI1 ON MRREL(CUI1);
CREATE INDEX X_MRREL_AUI1 ON MRREL(AUI1);
CREATE INDEX X_MRREL_CUI2 ON MRREL(CUI2);
CREATE INDEX X_MRREL_AUI2 ON MRREL(AUI2);
ALTER TABLE MRREL ADD CONSTRAINT X_MRREL_PK PRIMARY KEY (RUI);
CREATE INDEX X_MRREL_SAB ON MRREL(SAB);
ALTER TABLE MRSAB ADD CONSTRAINT X_MRSAB_PK PRIMARY KEY (VSAB);
CREATE INDEX X_MRSAB_RSAB ON MRSAB(RSAB);
CREATE INDEX X_MRSAT_CUI ON MRSAT(CUI);
CREATE INDEX X_MRSAT_METAUI ON MRSAT(METAUI);
ALTER TABLE MRSAT ADD CONSTRAINT X_MRSAT_PK PRIMARY KEY (ATUI);
CREATE INDEX X_MRSAT_SAB ON MRSAT(SAB);
CREATE INDEX X_MRSAT_ATN ON MRSAT(ATN);
CREATE INDEX X_MRSTY_CUI ON MRSTY(CUI);
ALTER TABLE MRSTY ADD CONSTRAINT X_MRSTY_PK PRIMARY KEY (ATUI);
CREATE INDEX X_MRSTY_STY ON MRSTY(STY);
CREATE INDEX X_MRXNS_ENG_NSTR ON MRXNS_ENG(NSTR);
CREATE INDEX X_MRXNW_ENG_NWD ON MRXNW_ENG(NWD);
CREATE INDEX X_MRXW_ENG_WD ON MRXW_ENG(WD);
CREATE INDEX X_AMBIGSUI_SUI ON AMBIGSUI(SUI);
CREATE INDEX X_AMBIGLUI_LUI ON AMBIGLUI(LUI);
VACUUM ANALYZE;