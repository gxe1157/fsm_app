
** EVELIO VELEZ JR.  11/03/2009
**

SET TALK OFF
SET COLOR TO W/B
CLEAR

HOLD_SUP=0
match_ctn=0
no_match=0

STORE SPACE(8) TO SUP_DBF
STORE SPACE(8) TO TAR_DBF

ANS=' '

DIR *.DBF

@ 30,2 TO 33,44 DOUBLE
@ 31,5 SAY 'Remove These Names    : ' GET SUP_DBF
@ 32,5 SAY 'From New Mailing File : ' GET TAR_DBF

READ

@ 00,00 clear TO 25,78

IF LEN(RTRIM(SUP_DBF))=0 OR LEN(RTRIM(TAR_DBF))=0
   RETURN
ENDIF

USE &SUP_DBF IN A 
USE &TAR_DBF IN B 

SET TALK ON
SET SAFETY OFF

SELECT A
=MATCHCODE()

SELECT B
=MATCHCODE()

INDEX ON MATCH TO IDOM
SET TALK OFF
SET SAFETY ON

SELECT A
GO TOP

DO WHILE .NOT. EOF()  && 1
   HOLD_SUP=RECNO()
   MyMatch=MATCH
   
   SELECT B
   GO TOP
   
   SEEK MyMatch
   IF FOUND()
      SCAN WHILE MyMatch=MATCH
         DELETE
         no_match=no_match+1
         @ 10,40  SAY ' Supress Records Found  : '+str(no_match,5) 

      ENDSCAN
   ELSE
         no_match=no_match+1
         @ 12,40  SAY ' Supress Not Found....  : '+str(no_match,5) 
   ENDIF
   SELECT A
   SKIP
   
ENDDO && 1      

SELECT B
GO TOP


SET TALK ON
COUNT FOR DELE()
WAIT 'Total records found in target file for supression'

set safety off
COPY TO SUP_DEL FOR DELE()

set index to
PACK
CLOSE ALL DATABASES



***********************
FUNCTION MATCHCODE
REPLACE ALL MATCH WITH SUBSTR(FIRST,1,3)+RTRIM(LAST)+SUBSTR(ADD1,1,15)+SUBSTR(CITY,1,10)+SUBSTR(ZIP,1,5)

