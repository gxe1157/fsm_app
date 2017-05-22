SET TALK OFF
SET SAFETY OFF
    TEMP =''
    
	USE PRINTPRO.DBF IN D
	SELECT D
	
    GO TOP
	NewTXT = 'C:\JOBS\_FSM_APP\BALLOTS\TEST\TESTBX.CSV'
	
	**COPY TO ( NewTXT ) SDF
    = WRITE_BX( NewTXT )
	
	CLOSE ALL DATABASES
*	=CLEAN_UP()    &&  ERASE ALL NON RELEVANT FILES
  
  
	******************
	FUNCTION WRITE_BX
    PARAMETER BK_PRN
  	PRIVATE REC_LINE
  	REC_LINE = 0
    
	IF FILE(BK_PRN)			                  	&& Does file exist?
		BX_OUT = FOPEN(BK_PRN,12)	   			    && If so, open read-write
	ELSE
		BX_OUT = FCREATE(BK_PRN)
	ENDIF

	IF BX_OUT < 0					   			&& Check for error opening file
		WAIT 'Cannot open or create output file' WINDOW NOWAIT
	ELSE							       		&& If no error, write to file

		 SCAN WHILE .NOT. EOF()
			TEMP =''
			
			FOR mcount = 1 TO FCOUNT()
				IF MCOUNT < FCOUNT()
					TEMP = TEMP+RTRIM( EVAL( FIELD[MCOUNT]) )+'|'
				ELSE
					TEMP = TEMP+RTRIM( EVAL( FIELD[MCOUNT]) )+CHR(10)
				ENDIF
			NEXT
			
			FWRITE(BX_OUT, TEMP)
			REC_LINE=REC_LINE+1
			@ 10,20 SAY 'Record No: '+STR(REC_LINE,9)
		 ENDSCAN
	ENDIF
	
	FCLOSE(BX_OUT)				       			&& Close file

