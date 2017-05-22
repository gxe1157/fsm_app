  ****************************************
  ********* Evelio Velez 05-18-2013 ******
  ****************************************
  **SET COLOR TO

  **** VARIABLES
  BK_OUT=''
  BK_PRN=''
  BK_AUDIT=''

  FLAG=0
  TAB_SUM=0
  TAB_ID=''
  TRK_WDA=0
  TRK_WD=''
  LN=1

  T_BK_DIST=0
  T_BK_WARD=0
  T_BK_PGS=0
  T_BK_PGLN=5
  T_BK_PG_OF=0
  T_BKS=1
  T_BK_FIRST=''
  T_BK_LAST=''
  T_BK_ALPHA=0
  T_BK_SPL1='Z'
  T_BK_SPL2='Z'
  T_BK_SPL3='Z'

  T_BK_SPLIT=2

  DO CASE
     CASE T_BK_SPLIT=2
       T_BK_SPL1='K'
       T_BK_SPL2=''
       T_BK_SPL3=''
     CASE T_BK_SPLIT=3
       T_BK_SPL1='G'
       T_BK_SPL2='O'
       T_BK_SPL3=''
     CASE T_BK_SPLIT=4
       T_BK_SPL1='E'
       T_BK_SPL2='K'
       T_BK_SPL3='R'
     OTHERWISE
       T_BK_SPL1=''
       T_BK_SPL2=''
  ENDCASE


  ***********************
  ** MAIN PROGRAM CODE **
  ***********************
  DIMENSION TAB[27]
  =SET_UP()

  FIRST_REC=1
  END_REC=0

  SELECT A   && (BK_OUT)
  COPY STRU TO OUTPUT
  USE OUTPUT IN B

  USE LOOKUP IN C
  SELECT C   && LOOKUP.DBF
  SCAN WHILE NOT EOF()   &&SELECT C TRACKING DBF
      =WRITE_PAGE()
      SELECT C         && LOOKUP.DBF
  ENDSCAN

  SELECT B  && OUTPUT
  GO TOP
  =COMP_FILES()

  GO TOP
  ** BROWSE FIELD LAST,ABB_F,ABB_L, PG_COUNT,WARD,DISTRICT,TAB_TOTAL,TAB_SEP,PG_OF, BK_COUNT

  =WRITE_RPT()
  =WRT_AUDIT()  && FUNCTION WRT_AUDIT



  ****************************
  ** ALL FUNCTIONS BEGIN HERE
  ****************************
  ****************************
  FUNCTION WRITE_PAGE
  PRIVATE TRK_WD, COMPARE

  TRK_WD=RTRIM(C.TRACK1)                  &&  look up code Ward+district
 
  SELECT A   && (BK_OUT)
  SEEK TRK_WD   && FROM SELECT A

  IF FOUND()
     LINE=1
     TAB_SUM=0
     TAB_ID=SUBSTR(TRK_WD,LEN(TRK_WD),1)

     SCAN WHILE TRK_WD=WARD+DISTRICT+SUBSTR(LAST,1,1)
        TAB_SUM=TAB_SUM+1

        IF LINE<=T_BK_PGLN
           =XFER(LINE,1)
           LINE=LINE+1
        ELSE
           LINE=1
           =XFER(LINE,1)
           LINE=LINE+1
        ENDIF

     ENDSCAN

     SKIP -1
     FOR ADDLINES= LINE TO T_BK_PGLN      &&  fILL IN bLANK LINES NEEDED TO COMPLETE PAGE
         SCATTER MEMVAR BLANK
         SELECT B     && OUTPUT DBF
         M.ABB_F=T_BK_FIRST
         M.ABB_L=A.LAST

         TAB_SUM=TAB_SUM-1
         M.PG_COUNT= ADDLINES
         M.WARD=SUBSTR(C.TRACK1,1,2)
         M.DISTRICT=SUBSTR(C.TRACK1,3,2)
         M.TAB_SEP=TAB_ID
         M.BK_COUNT=C.TRACK6

         APPEND BLANK
         GATHER MEMVAR
         IF ADDLINES=T_BK_PGLN
            T_BK_PG_OF=T_BK_PG_OF+1
            REPLACE B.PG_OF WITH T_BK_PG_OF
         ENDIF

         SELECT A
     ENDFOR
     SKIP
     COMPARE = WARD+DISTRICT

     IF SUBSTR(C.TRACK1,1,4) # COMPARE
	T_BK_PG_OF = 0

         ** UPDATE TOTAL PAGES PER BOOK ( M.PG_COUNT )
         SELECT B
         M.PG_OF = B.PG_OF
         END_REC=RECNO()
         GOTO FIRST_REC

         SCAN WHILE RECNO() <= END_REC
              REPLACE B.PG_COUNT WITH M.PG_OF
         ENDSCAN
         FIRST_REC = END_REC+1
         SELECT A
     ENDIF
 
  ELSE
     WAIT ' NOT FOUND '
  ENDIF


  ***********************
  FUNCTION XFER
  PARAMETERS MYLINE, OPT

  SCATTER MEMVAR  && FROM SELECT A
  M.PG_COUNT=MYLINE
  M.TAB_TOTAL=TAB_SUM
  M.TAB_SEP=TAB_ID

  DO CASE
     CASE MYLINE=1 AND OPT=1
          T_BK_FIRST=LAST

     CASE MYLINE=T_BK_PGLN AND OPT=1
          FLAG=1
          M.ABB_F=T_BK_FIRST
          M.ABB_L=LAST
          T_BK_PG_OF=T_BK_PG_OF+1
          M.PG_OF = T_BK_PG_OF
  ENDCASE

  SELECT B     && OUTPUT DBF

  M.ELEC_NAME=ELEC_N
  M.ELEC_DATE=ELEC_D
  M.CNTY_NAME=CNTY_LIST[COUNTY,1]
  M.SUPER_NAME=SUPER_N
  M.BK_COUNT=C.TRACK6

  APPEND BLANK
  GATHER MEMVAR
  SELECT A


  *********************
  FUNCTION TAB_INFO
  PRIVATE ALPHABET, ALPHA_X

  ALPHABET=65
  ALPHA_X=1

  DO WHILE ALPHA_X<=26
     TAB[ALPHA_X]=CHR(ALPHABET)

     ALPHA_X=ALPHA_X+1
     ALPHABET=ALPHABET+1
  ENDDO

  ******************
  FUNCTION SET_UP
  CLOSE DATABASES
  =TAB_INFO()

  BK_OUT=NEW_DIR+'T'+ALLTRIM(STR(MUNI_OPT,2))+'_'+WD_DISP+ALLTRIM(str(DIST_OPT,2))
  BK_PRN=NEW_DIR+'T'+ALLTRIM(STR(MUNI_OPT,2))+'_'+WD_DISP+ALLTRIM(str(DIST_OPT,2))+'.TXT'
  BK_AUDIT=NEW_DIR+'T'+ALLTRIM(STR(MUNI_OPT,2))+WD_DISP+ALLTRIM(str(DIST_OPT,2))+'.TXT'

  USE POLLBOOK.DBF IN A
  SELECT A
 
  IF !EMPTY(DIST_OPT)
     COPY TO (BK_OUT) FOR MUNI_FLD[MUNI_OPT]=RTRIM(MUNICIPALI) AND VAL(DISTRICT)=DIST_OPT  AND WARD=WD_DISP
  ELSE
     COPY TO (BK_OUT) FOR MUNI_FLD[MUNI_OPT]=RTRIM(MUNICIPALI)
  ENDIF

  && ASSIGN WARD,DISTRICT AND FIRST LETTER TO ARRAY by using index unique
  USE (BK_OUT) IN A
  SELECT A   && (BK_OUT)
  INDEX UNIQUE ON WARD+DISTRICT+SUBSTR(LAST,1,1) TO TEMP

  COPY TO TEMP
  USE TEMP IN C
  SET INDEX TO
  CREATE TABLE LOOKUP ( TRACK1 C(10), TRACK2 N(5), TRACK3 N(5), TRACK4 N(5), TRACK5 N(5), TRACK6 N(5), TRACK7 N(4) )
  USE LOOKUP IN B

  SELECT A   && (BK_OUT)
  INDEX ON WARD+DISTRICT+LAST TO TEMP

  SELECT C   && TEMP.DBF
  TRK_WDA=RECCOUNT()
  GO TOP

  FOR MCOUNT = 1 TO TRK_WDA
      IF EMPTY(DIST_OPT)       && If process entire town as opposed to only a specif ward dist.
         =CHK_BK_CNT( BKS_NEEDED )
      ENDIF


      @ 04,10 SAY 'Building Files ....  :'+STR(RECNO(),7)
      SCATTER MEMVAR
      SELECT B   && LOOKUP.DBF
      APPEND BLANK
      REPLACE TRACK1 WITH M.WARD+M.DISTRICT+SUBSTR(M.LAST,1,1)

      =GETDATA(RTRIM(B.TRACK1))
      REPLACE B.TRACK2 WITH T_BK_WARD;
              B.TRACK3 WITH T_BK_DIST;
              B.TRACK4 WITH T_BK_ALPHA;
              B.TRACK5 WITH T_BK_PGS;
              B.TRACK6 WITH T_BKS;
              B.TRACK7 WITH CEILING(T_BK_DIST/T_BK_PGLN)

      IF NOT EOF() AND substr(B.TRACK1,1,4)<>WARD+DISTRICT;
               OR NOT EOF() AND CHR( ASC(T_BK_SPL1)+1) = SUBSTR(LAST,1,1);
               OR NOT EOF() AND CHR( ASC(T_BK_SPL2)+1)=SUBSTR(LAST,1,1);
               OR NOT EOF() AND CHR( ASC(T_BK_SPL3)+1)=SUBSTR(LAST,1,1)

               =RESET_TRK(RTRIM(B.TRACK1))
      ENDIF


      SELECT C  && TEMP.DBF
      SKIP
      IF EOF()
         EXIT
      ENDIF
  ENDFOR
  SELECT B      && LOOKUP.DBF


  **************
  FUNCTION CHK_BK_CNT
  PARAMETERS BK_C
  DO CASE
     CASE BK_C = 3
       T_BK_SPL1='G'
       T_BK_SPL2='O'
       T_BK_SPL3=' '
     CASE BK_C = 4
       T_BK_SPL1='E'
       T_BK_SPL2='K'
       T_BK_SPL3='R'
     OTHERWISE        && DEFAULT TO 2 BOKS
       T_BK_SPL1='K'
       T_BK_SPL2=''
       T_BK_SPL3=''
  ENDCASE
  BK_C = 0


  *****************
  FUNCTION GETDATA
     PARAMETERS TRK_WD
     PRIVATE TRK_WD, ALPHA_CNT
     ALPHA_CNT=0

     SELECT A                         && (BK_OUT)
     SEEK TRK_WD
     IF FOUND()
        SCAN WHILE TRK_WD=WARD+DISTRICT+SUBSTR(LAST,1,1)
           ALPHA_CNT=ALPHA_CNT+1                                    && COUNT ALPHA
           && MERCER CNTY SPECIAL CASE
           DO CASE
              CASE MUNICIPALI='TRENTON' AND WARD='11'
                   REPLACE MUNICIPALI WITH RTRIM(MUNICIPALI)+'-NORTH'
              CASE MUNICIPALI='TRENTON' AND WARD='12'
                   REPLACE MUNICIPALI WITH RTRIM(MUNICIPALI)+'-SOUTH'
              CASE MUNICIPALI='TRENTON' AND WARD='13'
                   REPLACE MUNICIPALI WITH RTRIM(MUNICIPALI)+'-EAST'
              CASE MUNICIPALI='TRENTON' AND WARD='14'
                   REPLACE MUNICIPALI WITH RTRIM(MUNICIPALI)+'-WEST'
           ENDCASE

        ENDSCAN
        T_BK_ALPHA=ALPHA_CNT          && COUNT TABS
        T_BK_DIST=T_BK_DIST+ALPHA_CNT && DISTRICT COUNT
        T_BK_WARD=T_BK_WARD+ALPHA_CNT && WARD COUNT
        T_BK_PGS=T_BK_PGS+1           && TOTAL PAGE IN BOOK
        IF EOF()
           SKIP -1
        ENDIF

     ELSE
        WAIT ' NOT FOUND - CONTACT SOFTWARE DEVELOPER '
        SUSPEND
     ENDIF

  ****************
  FUNCTION RESET_TRK
     PARAMETERS TRK_COMP

     DO CASE
        CASE SUBSTR(TRK_COMP,1,2)<>WARD
             T_BK_WARD=0

        CASE SUBSTR(TRK_COMP,3,2)<>DISTRICT
             T_BK_DIST=0

     ENDCASE
     T_BK_DIST=0
     T_BKS=T_BKS+1                         && TOTAL BOOKS PRODUCED
     T_BK_PGS=0                            && TOTAL PAGE IN BOOK


  ******************
  FUNCTION WRT_AUDIT
  PRIVATE TOTAL_TAB, TOTAL_DIST, TOTAL_WARD, FNAME, LNAME, TEMP, HEADER, FLAG
  TOTAL_TAB=0
  TOTAL_DIST=0
  TOTAL_WARD=0
  FNAME=''
  LNAME=''
  HEADER=''
  FLAG=0
  SELECT B   && OUTPUT DBF

  GO TOP
  IF FILE(BK_AUDIT)			                  && Does file exist?
     ERASE (BK_AUDIT)
  ENDIF
  MY_Expense = FCREATE(BK_AUDIT)

  IF MY_Expense < 0					   && Check for error opening file
     WAIT 'Cannot open or create output file' WINDOW NOWAIT
  ELSE							       && If no error, write to file
     X=1
     DO WHILE NOT EOF()
        SCATTER MEMVAR
        IF B.BK_COUNT=X
          X=X+1
          HEADER=chr(13)+chr(10)+' BOOK: '+LTRIM(STR(M.BK_COUNT,4))+' ['+M.WARD+M.DISTRICT+'] '+M.MUNICIPALI+chr(13)+chr(10)
          =FWRITE(MY_Expense, HEADER)
        ENDIF

        FNAME=B.LAST
        TOTAL_TAB=0
        TEMP=''

        SCAN WHILE M.BK_COUNT=B.BK_COUNT AND M.TAB_SEP=B.TAB_SEP
            IF !empty(last)
               TOTAL_TAB=TOTAL_TAB+1
               TOTAL_DIST=TOTAL_DIST+1
               TOTAL_WARD=TOTAL_WARD+1
               LNAME=B.LAST
            ENDIF
        ENDSCAN

        IF TOTAL_TAB=0
           FNAME=SPACE(LEN(LAST))
           LNAME=SPACE(LEN(LAST))
        ENDIF

        TEMP=' '+M.WARD+M.DISTRICT+M.TAB_SEP+' '+FNAME+' - '+LNAME+' '+STR(TOTAL_TAB,5)+chr(13)+chr(10)

        IF M.BK_COUNT#B.BK_COUNT
           SPACER=SPACE(LEN( M.WARD+M.DISTRICT+M.TAB_SEP+FIRST+LAST ))
           TEMP=TEMP+SPACER+STR(TOTAL_DIST,6)+'   '+STR(TOTAL_WARD,7)+chr(13)+chr(10)
           TOTAL_DIST=0
        ENDIF

        =FWRITE(MY_Expense, TEMP)
     ENDDO
  ENDIF
  =FCLOSE(MY_Expense)				       && Close file

  GO TOP
**  BROWSE FIELD LAST, TAB_SEP, BK_COUNT
**  MODI COMM (BK_AUDIT)
  RETURN



  ******************
  FUNCTION WRITE_RPT

  GO BOTT
  LAST_PAGE=101
  GO TOP
  
  IF FILE(BK_PRN)			                  && Does file exist?
     MY_Expense = FOPEN(BK_PRN,12)	   && If so, open read-write
  ELSE
     MY_Expense = FCREATE(BK_PRN)
  ENDIF

  IF MY_Expense < 0					   && Check for error opening file
     WAIT 'Cannot open or create output file' WINDOW NOWAIT
  ELSE							       && If no error, write to file
     REC_LINE=1
     DO WHILE .T.
       =GRAB_REC()
       =FWRITE(MY_Expense, TEMP)
       REC_LINE=REC_LINE+1

       IF EOF()
          EXIT
       ENDIF

     ENDDO
  ENDIF
  =FCLOSE(MY_Expense)				       && Close file

  ** Modi comm (BK_PRN)
  ** WAIT 'Done .....'+MUNI_FLD[MUNI_OPT]+'...'+BK_PRN



********************
FUNCTION GRAB_REC

X=1
TEMP=''
NN=''

IF EMPTY(DIST_OPT)
   IF BKS_NEEDED = 0
      T_BK_SPLIT =2
   ELSE
      T_BK_SPLIT = BKS_NEEDED
   ENDIF
ENDIF


IF REC_LINE=1
   FOR CLINE= 1 TO T_BK_PGLN
       NN=LTRIM(STR(CLINE,2))+'|'
       TEMP=TEMP+"County&NN"+"Elec_date&NN"+"Elec_Name&NN"+"Super_Name&NN"+"FULLNAME&NN"+"AD&NN"+"CITY ,NJ ZIP&NN"+"VOTERID&NN"+"DATE_BIRTH&NN"+"PARTY&NN"+"MUNICIPALI&NN"+"WARD&NN"+"DISTRICT&NN"+"ABB_F&NN"+"ABB_L&NN"+"PG_COUNT&NN"+"PG_OF&NN"+"TAB_SEP&NN"+"TAB_TOTAL&NN"+"ID_REQUIRED&NN"+"MAIL_IN&NN"+"STATUS&NN"+"T_BK_SPLIT&NN"
   ENDFOR
   RETURN
ENDIF
TEMP=TEMP+CHR(10)


DO WHILE X<=T_BK_PGLN  && TOTAL LINE PE PAGE
   STATE=SPACE(2)
   AD1=RTRIM(ST_NUMBER)+' '+RTRIM(ST_NAME)+' '+RTRIM(UNIT)+' '+RTRIM(ADD2)
   IF !EMPTY(AD1)
       STATE='NJ'
   ENDIF
   TEMP=TEMP+RTRIM(CNTY_NAME)+'|'+DTOC(ELEC_DATE)+'|'+RTRIM(ELEC_NAME)+'|'+RTRIM(SUPER_NAME)+'|'+RTRIM(LAST)+', '+RTRIM(FIRST)+' '+RTRIM(MIDDLE)+' '+RTRIM(suffix)+'|'+RTRIM(AD1)+'|'+RTRIM(CITY)+', '+RTRIM(STATE)+' '+rtrim(ZIP)+'|'+RTRIM(VOTERID)+'|'+DATE_BIRTH+'|'+rtrim(PARTY)+'|'+RTRIM(MUNICIPALI)+'|'+WARD+'|'+DISTRICT+'|'+ABB_F+'|'+ABB_L+'|'+str(PG_COUNT,5)+'|'+str(PG_OF,5)+'|'+TAB_SEP+'|'+STR(TAB_TOTAL,5)+'|'+ID_REQUIRED+'|'+MAIL_IN+'|'+STATUS+'|'+str(T_BK_SPLIT,1)+'|'
   X=X+1
   SKIP

   IF EOF()
      EXIT
   ENDIF
ENDDO
RETURN


**********************
FUNCTION COMP_FILES

 PRIVATE CONF_CNT, FILLER_REC
 CONF_CNT=0
 NG_CNT = 0

 FILLER_REC=0

 SELECT A   && (BK_OUT)
 SET INDEX TO
 INDEX ON VOTERID TO TEMP

 SELECT B   && OUTPUT
 GO TOP

 DO WHILE NOT EOF()  && MAIN
    M.VOTERID=B.VOTERID

    IF EMPTY(M.VOTERID)
       DELETE
       SKIP
       LOOP
    ELSE
       SELECT A
       SEEK M.VOTERID
       IF FOUND()
          CONF_CNT=CONF_CNT+1
          @ 08,10 SAY 'Record Confirmed     :'+STR( CONF_CNT,7 )
          @ 09,10 SAY 'Record Not Found     :'+STR( NG_CNT,7 )
          SELECT B
       ELSE
          NG_CNT= NG_CNT+1
          @ 09,10 SAY 'Record Not Found     :'+STR( NG_CNT,7 )+' *** Error ***'
          SELECT B
          DELETE
       ENDIF
    ENDIF
    SKIP

 ENDDO  && END MAIN
 COUNT TO FILLER_REC FOR DELE()
 @ 10,10 SAY 'Insert Blank Records :'+STR( FILLER_REC,7 )
 @ 12,10 SAY 'Total Output File    :'+STR( FILLER_REC+CONF_CNT,7 )










