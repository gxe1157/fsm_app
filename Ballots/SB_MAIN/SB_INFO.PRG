***********  MAY 24, 2012

***********************
FUNCTION BERGEN_TWN

SET EXACT ON
CNT_TOWN=1

GO TOP
@ 10,20 SAY 'PROCESSING...............'

DO WHILE NOT EOF()
   CNT_TOWN=CNT_TOWN+1
   @ 10,45 SAY ':'+STR(CNT_TOWN,8)

   DO CASE
      CASE MUNICIPALI="ALLENDALE"
           REPLACE TOWN WITH "T01"
           REPLACE TWN_NAME WITH "Borough of Allendale"

      CASE MUNICIPALI="ALPINE"
           REPLACE TOWN WITH "T02"
           REPLACE TWN_NAME WITH "Borough of Alpine"

      CASE MUNICIPALI="BERGENFIELD"
           REPLACE TOWN WITH "T03"
           REPLACE TWN_NAME WITH "Borough of Bergenfield"

      CASE MUNICIPALI="BOGOTA"
           REPLACE TOWN WITH "T04"
           REPLACE TWN_NAME WITH "Borough of Bogota"

      CASE MUNICIPALI="CARLSTADT"
           REPLACE TOWN WITH "T05"
           REPLACE TWN_NAME WITH "Borough  of Carlstadt"

      CASE MUNICIPALI="CLIFFSIDE PARK"
           REPLACE TOWN WITH "T06"
           REPLACE TWN_NAME WITH "Borough of Cliffside Park"

      CASE MUNICIPALI="CLOSTER"
           REPLACE TOWN WITH "T07"
           REPLACE TWN_NAME WITH "Borough of Closter"

      CASE MUNICIPALI="CRESSKILL"
           REPLACE TOWN WITH "T08"
           REPLACE TWN_NAME WITH "Borough of Cresskill"

      CASE MUNICIPALI="DEMAREST"
           REPLACE TOWN WITH "T09"
           REPLACE TWN_NAME WITH "Borough of Demarest"

      CASE MUNICIPALI="DUMONT"
           REPLACE TOWN WITH "T10"
           REPLACE TWN_NAME WITH "Borough of Dumont"

      CASE MUNICIPALI="EAST RUTHERFORD"
           REPLACE TOWN WITH "T11"
           REPLACE TWN_NAME WITH "Borough of East Rutherford"

      CASE MUNICIPALI="EDGEWATER"                    
           REPLACE TOWN WITH "T12"
           REPLACE TWN_NAME WITH "Borough of Edgewater"

      CASE MUNICIPALI="ELMWOOD PARK"
           REPLACE TOWN WITH "T13"
           REPLACE TWN_NAME WITH "Borough of Elmwood Park"

      CASE MUNICIPALI="EMERSON"
           REPLACE TOWN WITH "T14"
           REPLACE TWN_NAME WITH "Borough of Emerson"

      CASE MUNICIPALI="ENGLEWOOD"
           REPLACE TOWN WITH "T15"
           REPLACE TWN_NAME WITH "City of Englewood"

      CASE MUNICIPALI="ENGLEWOOD CLIFFS"
           REPLACE TOWN WITH "T16"
           REPLACE TWN_NAME WITH "Borough of Englewood Cliffs"

      CASE MUNICIPALI="FAIR LAWN"
           REPLACE TOWN WITH "T17"
           REPLACE TWN_NAME WITH "Borough of Fair Lawn"

      CASE MUNICIPALI="FAIRVIEW"
           REPLACE TOWN WITH "T18"
           REPLACE TWN_NAME WITH "Borough of Fairview"

      CASE MUNICIPALI="FORT LEE"
           REPLACE TOWN WITH "T19"
           REPLACE TWN_NAME WITH "Borough of Fort Lee"

      CASE MUNICIPALI="FRANKLIN LAKES"
           REPLACE TOWN WITH "T20"
           REPLACE TWN_NAME WITH "Borough of Franklin Lakes"

      CASE MUNICIPALI="GARFIELD"
           REPLACE TOWN WITH "T21"
           REPLACE TWN_NAME WITH "City of Garfield"

      CASE MUNICIPALI="GLEN ROCK"
           REPLACE TOWN WITH "T22"
           REPLACE TWN_NAME WITH "Borough of Glen Rock"

      CASE MUNICIPALI="HACKENSACK"
           REPLACE TOWN WITH "T23"
           REPLACE TWN_NAME WITH "City of Hackensack"

      CASE MUNICIPALI="HARRINGTON PARK"
           REPLACE TOWN WITH "T24"
           REPLACE TWN_NAME WITH "Borough of Harrington Park"

      CASE MUNICIPALI="HASBROUCK HEIGHTS"
           REPLACE TOWN WITH "T25"
           REPLACE TWN_NAME WITH "Borough of Hasbrouck Heights"

      CASE MUNICIPALI="HAWORTH"
           REPLACE TOWN WITH "T26"
           REPLACE TWN_NAME WITH "Borough of Haworth"

      CASE MUNICIPALI="HILLSDALE"
           REPLACE TOWN WITH "T27"
           REPLACE TWN_NAME WITH "Borough of Hillsdale"

      CASE MUNICIPALI="HO HO KUS"
           REPLACE TOWN WITH "T28"
           REPLACE TWN_NAME WITH "Borough of Ho-Ho-Kus"

      CASE MUNICIPALI="LEONIA"
           REPLACE TOWN WITH "T29"
           REPLACE TWN_NAME WITH "Borough of Leonia"

      CASE MUNICIPALI="LITTLE FERRY"
           REPLACE TOWN WITH "T30"
           REPLACE TWN_NAME WITH "Borough of Little Ferry"

      CASE MUNICIPALI="LODI"
           REPLACE TOWN WITH "T31"
           REPLACE TWN_NAME WITH "Borough of Lodi"

      CASE MUNICIPALI="LYNDHURST"
           REPLACE TOWN WITH "T32"
           REPLACE TWN_NAME WITH "Township of Lyndhurst"

      CASE MUNICIPALI="MAHWAH"
           REPLACE TOWN WITH "T33"
           REPLACE TWN_NAME WITH "Township of Mahwah"

      CASE MUNICIPALI="MAYWOOD"
           REPLACE TOWN WITH "T34"
           REPLACE TWN_NAME WITH "Borough of Maywood"

      CASE MUNICIPALI="MIDLAND PARK"
           REPLACE TOWN WITH "T35"
           REPLACE TWN_NAME WITH "Borough of Midland Park"

      CASE MUNICIPALI="MONTVALE"
           REPLACE TOWN WITH "T36"
           REPLACE TWN_NAME WITH "Borough of Montvale"

      CASE MUNICIPALI="MOONACHIE"
           REPLACE TOWN WITH "T37"
           REPLACE TWN_NAME WITH "Borough of Moonachie"

      CASE MUNICIPALI="NEW MILFORD"
           REPLACE TOWN WITH "T38"
           REPLACE TWN_NAME WITH "Borough of New Milford"

      CASE MUNICIPALI="NORTH ARLINGTON"
           REPLACE TOWN WITH "T39"
           REPLACE TWN_NAME WITH "Borough of North Arlington"

      CASE MUNICIPALI="NORTHVALE"
           REPLACE TOWN WITH "T40"
           REPLACE TWN_NAME WITH "Borough of Northvale"

      CASE MUNICIPALI="NORWOOD"
           REPLACE TOWN WITH "T41"
           REPLACE TWN_NAME WITH "Borough of Norwood"

      CASE MUNICIPALI="OAKLAND"
           REPLACE TOWN WITH "T42"
           REPLACE TWN_NAME WITH "Borough of Oakland"

      CASE MUNICIPALI="OLD TAPPAN"
           REPLACE TOWN WITH "T43"
           REPLACE TWN_NAME WITH "Borough of Old Tappan"

      CASE MUNICIPALI="ORADELL"
           REPLACE TOWN WITH "T44"
           REPLACE TWN_NAME WITH "Borough of Oradell"

      CASE MUNICIPALI="PALISADES PARK"
           REPLACE TOWN WITH "T45"
           REPLACE TWN_NAME WITH "Borough of Palisades Park"

      CASE MUNICIPALI="PARAMUS"
           REPLACE TOWN WITH "T46"
           REPLACE TWN_NAME WITH "Borough of Paramus"

      CASE MUNICIPALI="PARK RIDGE"
           REPLACE TOWN WITH "T47"
           REPLACE TWN_NAME WITH "Borough of Park Ridge"

      CASE MUNICIPALI="RAMSEY"
           REPLACE TOWN WITH "T48"
           REPLACE TWN_NAME WITH "Borough of Ramsey"

      CASE MUNICIPALI="RIDGEFIELD"
           REPLACE TOWN WITH "T49"
           REPLACE TWN_NAME WITH "Borough of Ridgefield"

      CASE MUNICIPALI="RIDGEFIELD PARK"
           REPLACE TOWN WITH "T50"
           REPLACE TWN_NAME WITH "Village of Ridgefield Park"

      CASE MUNICIPALI="RIDGEWOOD"
           REPLACE TOWN WITH "T51"
           REPLACE TWN_NAME WITH "Village of Ridgewood"

      CASE MUNICIPALI="RIVER EDGE"
           REPLACE TOWN WITH "T52"
           REPLACE TWN_NAME WITH "Borough of River Edge"

      CASE MUNICIPALI="RIVER VALE"
           REPLACE TOWN WITH "T53"
           REPLACE TWN_NAME WITH "Township of River Vale"

      CASE MUNICIPALI="ROCHELLE PARK"
           REPLACE TOWN WITH "T54"
           REPLACE TWN_NAME WITH "Township of Rochelle Park"

      CASE MUNICIPALI="ROCKLEIGH"
           REPLACE TOWN WITH "T55"
           REPLACE TWN_NAME WITH "Borough of Rockleigh"

      CASE MUNICIPALI="RUTHERFORD"
           REPLACE TOWN WITH "T56"
           REPLACE TWN_NAME WITH "Borough of Rutherford"

      CASE MUNICIPALI="SADDLE BROOK"
           REPLACE TOWN WITH "T57"
           REPLACE TWN_NAME WITH "Township of Saddle Brook"

      CASE MUNICIPALI="SADDLE RIVER"
           REPLACE TOWN WITH "T58"
           REPLACE TWN_NAME WITH "Borough of Saddle River"

      CASE MUNICIPALI="SOUTH HACKENSACK"
           REPLACE TOWN WITH "T59"
           REPLACE TWN_NAME WITH "Township of South Hackensack"

      CASE MUNICIPALI="TEANECK"
           REPLACE TOWN WITH "T60"
           REPLACE TWN_NAME WITH "Township of Teaneck"

      CASE MUNICIPALI="TENAFLY"
           REPLACE TOWN WITH "T61"
           REPLACE TWN_NAME WITH "Borough of Tenafly"

      CASE MUNICIPALI="TETERBORO"
           REPLACE TOWN WITH "T62"
           REPLACE TWN_NAME WITH "Borough of Teterboro"

      CASE MUNICIPALI="TWP OF WASHINGTON"
           REPLACE TOWN WITH "T63"
           REPLACE TWN_NAME WITH "TOWNSHIP OF WASHINGTON"

      CASE MUNICIPALI="UPPER SADDLE RIVER"
           REPLACE TOWN WITH "T64"
           REPLACE TWN_NAME WITH "Borough of Upper Saddle River"

      CASE MUNICIPALI="WALDWICK"
           REPLACE TOWN WITH "T65"
           REPLACE TWN_NAME WITH "Borough of Waldwick"

      CASE MUNICIPALI="WALLINGTON"
           REPLACE TOWN WITH "T66"
           REPLACE TWN_NAME WITH "Borough of Wallington"

      CASE MUNICIPALI="WESTWOOD"
           REPLACE TOWN WITH "T67"
           REPLACE TWN_NAME WITH "Borough of Westwood"

      CASE MUNICIPALI="WOODCLIFF LAKE"
           REPLACE TOWN WITH "T68"
           REPLACE TWN_NAME WITH "Borough of Woodcliff Lake"

      CASE MUNICIPALI="WOODRIDGE"
           REPLACE TOWN WITH "T69"
           REPLACE TWN_NAME WITH "Borough of Wood-Ridge"

      CASE MUNICIPALI="WYCKOFF"
           REPLACE TOWN WITH "T70"
           REPLACE TWN_NAME WITH "Township of Wyckoff"

   ENDCASE
              
SKIP
    
ENDDO
SELECT D
USE
SELECT A

SET EXACT OFF

GO TOP


******************
FUNCTION BERGEN_MOV
  
   DO CASE
      CASE '01'$NTOWN
           SUB_DIR="ALLENDAL"
      CASE '02'$NTOWN
          SUB_DIR="ALPINE"
      CASE '03'$NTOWN
           SUB_DIR="BERGNFLD"
      CASE '04'$NTOWN
            SUB_DIR="BOGOTA"
      CASE '05'$NTOWN
           SUB_DIR="CARLSTDT"
      CASE '06'$NTOWN
           SUB_DIR="CLIFSDPK"
      CASE '07'$NTOWN
           SUB_DIR="CLOSTER"
      CASE '08'$NTOWN
           SUB_DIR="CRESSKIL"
      CASE '09'$NTOWN
           SUB_DIR="DEMAREST"
      CASE '10'$NTOWN
           SUB_DIR="DUMONT"
      CASE '11'$NTOWN
           SUB_DIR="E_RUTHER"
      CASE '12'$NTOWN
           SUB_DIR="EDGEWATE"
      CASE '13'$NTOWN
            SUB_DIR="ELMWD_PK"
      CASE '14'$NTOWN
           SUB_DIR="EMERSON"
      CASE '15'$NTOWN
           SUB_DIR="ENGLEWOO"
      CASE '16'$NTOWN
           SUB_DIR="ENGL_CLF"
      CASE '17'$NTOWN
           SUB_DIR="FAIRLAWN"
      CASE '18'$NTOWN
           SUB_DIR="FAIRVIEW"
      CASE '19'$NTOWN
           SUB_DIR="FORT_LEE"
      CASE '20'$NTOWN
           SUB_DIR="FRAN_LKS"
      CASE '21'$NTOWN
           SUB_DIR="GARFIELD"
      CASE '22'$NTOWN
           SUB_DIR="GLEN_RCK"
      CASE '23'$NTOWN
           SUB_DIR="HACKENSK"
      CASE '24'$NTOWN
           SUB_DIR="HARRI_PK"
      CASE '25'$NTOWN
           SUB_DIR="HASB_HTS"
      CASE '26'$NTOWN
           SUB_DIR="HAWORTH"
      CASE '27'$NTOWN
           SUB_DIR="HILLSDAL"
      CASE '28'$NTOWN
           SUB_DIR="HOHO_KUS"
      CASE '29'$NTOWN
           SUB_DIR="LEONIA"
      CASE '30'$NTOWN
           SUB_DIR="LT_FERRY"
      CASE '31'$NTOWN
            SUB_DIR="LODI"
      CASE '32'$NTOWN
           SUB_DIR="LYNDHURS"
      CASE '33'$NTOWN
           SUB_DIR="MAHWAH"
      CASE '34'$NTOWN
           SUB_DIR="MAYWOOD"
      CASE '35'$NTOWN
           SUB_DIR="MIDLD_PK"
      CASE '36'$NTOWN
           SUB_DIR="MONTVALE"
      CASE '37'$NTOWN
           SUB_DIR="MOONACHI"
      CASE '38'$NTOWN
           SUB_DIR="NEW_MLFD"
      CASE '39'$NTOWN
           SUB_DIR="NO_ARLIN"
      CASE '40'$NTOWN
           SUB_DIR="NORTHVAL"
      CASE '41'$NTOWN
           SUB_DIR="NORWOOD"
      CASE '42'$NTOWN
           SUB_DIR="OAKLAND"
      CASE '43'$NTOWN
           SUB_DIR="OLD_TAPP"
      CASE '44'$NTOWN
           SUB_DIR="ORADELL"
      CASE '45'$NTOWN
           SUB_DIR="PALIS_PK"
      CASE '46'$NTOWN
           SUB_DIR="PARAMUS"
      CASE '47'$NTOWN
           SUB_DIR="PRK_RIDG"
      CASE '48'$NTOWN
           SUB_DIR="RAMSEY"
      CASE '49'$NTOWN
           SUB_DIR="RIDGFLD"
      CASE '50'$NTOWN
           SUB_DIR="RIDFLDPK"
      CASE '51'$NTOWN
           SUB_DIR="RIDGWOOD"
      CASE '52'$NTOWN
           SUB_DIR="RVR_EDGE"
      CASE '53'$NTOWN
           SUB_DIR="RVR_VALE"
      CASE '54'$NTOWN
           SUB_DIR="ROCHE_PK"
      CASE '55'$NTOWN
           SUB_DIR="RCKLEIGH"
      CASE '56'$NTOWN
           SUB_DIR="RUTHERFD"
      CASE '57'$NTOWN
           SUB_DIR="SADDLBRK"
      CASE '58'$NTOWN
           SUB_DIR="SADDLERV"
      CASE '59'$NTOWN
           SUB_DIR="SO_HACK"
      CASE '60'$NTOWN
           SUB_DIR="TEANECK"
      CASE '61'$NTOWN
           SUB_DIR="TENAFLY"
      CASE '62'$NTOWN
           SUB_DIR="TETERBOR"
      CASE '63'$NTOWN
           SUB_DIR="TWP_WASH"
      CASE '64'$NTOWN
           SUB_DIR="U_SADDLE"
      CASE '65'$NTOWN
           SUB_DIR="WALDWICK"
      CASE '66'$NTOWN
           SUB_DIR="WALLINGT"
      CASE '67'$NTOWN
           SUB_DIR="WESTWOOD"
      CASE '68'$NTOWN
           SUB_DIR="WDCLF_LK"
      CASE '69'$NTOWN
           SUB_DIR="WOODRIDG"
      CASE '70'$NTOWN
           SUB_DIR="WYCKOFF"

   ENDCASE


******************
FUNCTION MERCER_TWN

DO WHILE NOT EOF()
   DO CASE
      CASE MUNICIPALI='EAST WINDSOR'
           REPLACE TOWN WITH 'T01'
      CASE MUNICIPALI='EWING'
           REPLACE TOWN WITH 'T02'
      CASE MUNICIPALI='HAMILTON'
           REPLACE TOWN WITH 'T03'
      CASE MUNICIPALI='HIGHTSTOWN'
           REPLACE TOWN WITH 'T04'
      CASE MUNICIPALI='HOPEWELL BORO'
           REPLACE TOWN WITH 'T05'
      CASE MUNICIPALI='HOPEWELL TWP'
           REPLACE TOWN WITH 'T06'
      CASE MUNICIPALI='LAWRENCE'
           REPLACE TOWN WITH 'T07'
      CASE MUNICIPALI='PENNINGTON'
           REPLACE TOWN WITH 'T08'
      CASE MUNICIPALI='PRINCETON'
           REPLACE TOWN WITH 'T09'
      CASE MUNICIPALI='TRENTON' AND WARD='11'
           REPLACE TOWN WITH 'T11'
      CASE MUNICIPALI='TRENTON' AND WARD='12'
           REPLACE TOWN WITH 'T12'
      CASE MUNICIPALI='TRENTON' AND WARD='13'
           REPLACE TOWN WITH 'T13'
      CASE MUNICIPALI='TRENTON' AND WARD='14'
           REPLACE TOWN WITH 'T14'
      CASE MUNICIPALI='TRENTON'
           REPLACE TOWN WITH 'T11'
      CASE MUNICIPALI='ROBBINSVILLE'
           REPLACE TOWN WITH 'T15'
      CASE MUNICIPALI='WEST WINDSOR'
           REPLACE TOWN WITH 'T16'
   ENDCASE
   
SKIP

ENDDO
GO TOP


******************
FUNCTION MERCER_MOV

   DO CASE
      CASE '01'$NTOWN
           SUB_DIR='EAST_WIN'
      CASE '02'$NTOWN
           SUB_DIR='EWING'
      CASE '03'$NTOWN
           SUB_DIR='HAMILTON'
      CASE '04'$NTOWN
           SUB_DIR='HIGHTSTO'
      CASE '05'$NTOWN
           SUB_DIR='HOPE_BOR'
      CASE '06'$NTOWN
           SUB_DIR='HOPE_TWP'
      CASE '07'$NTOWN
           SUB_DIR='LAWRENCE'
      CASE '08'$NTOWN
           SUB_DIR='PENNINGT'
      CASE '09'$NTOWN
           SUB_DIR='PRINCETO'
      CASE '11'$NTOWN
           SUB_DIR='TRENTON'
      CASE '12'$NTOWN
           SUB_DIR='TRENTON'
      CASE '13'$NTOWN
           SUB_DIR='TRENTON'
      CASE '14'$NTOWN
           SUB_DIR='TRENTON'
      CASE '15'$NTOWN
           SUB_DIR='ROBBINSV'
      CASE '16'$NTOWN
           SUB_DIR='WEST_WIN'
   ENDCASE


******************
FUNCTION UNION_TWN

GO TOP
DO WHILE NOT EOF()
   DO CASE
      CASE MUNICIPALI='BERKELEY HTS'
           REPLACE TOWN WITH 'T01'
      CASE MUNICIPALI='CLARK'
           REPLACE TOWN WITH 'T02'
      CASE MUNICIPALI='CRANFORD'
           REPLACE TOWN WITH 'T03'
      CASE MUNICIPALI='ELIZABETH'
           REPLACE TOWN WITH 'T04'
      CASE MUNICIPALI='FANWOOD'
           REPLACE TOWN WITH 'T05'
      CASE MUNICIPALI='GARWOOD'
           REPLACE TOWN WITH 'T06'
      CASE MUNICIPALI='HILLSIDE'
           REPLACE TOWN WITH 'T07'
      CASE MUNICIPALI='KENILWORTH'
           REPLACE TOWN WITH 'T08'
      CASE MUNICIPALI='LINDEN'
           REPLACE TOWN WITH 'T09'
      CASE MUNICIPALI='MOUNTAINSIDE'
           REPLACE TOWN WITH 'T10'
      CASE MUNICIPALI='NEW PROVIDENCE'
           REPLACE TOWN WITH 'T11'
      CASE MUNICIPALI='PLAINFIELD'
           REPLACE TOWN WITH 'T12'
      CASE MUNICIPALI='RAHWAY'
           REPLACE TOWN WITH 'T13'
      CASE MUNICIPALI='ROSELLE'
           REPLACE TOWN WITH 'T14'
      CASE MUNICIPALI='ROSELLE PARK'
           REPLACE TOWN WITH 'T15'
      CASE MUNICIPALI='SCOTCH PLAINS'
           REPLACE TOWN WITH 'T16'
      CASE MUNICIPALI='SPRINGFIELD'
           REPLACE TOWN WITH 'T17'
      CASE MUNICIPALI='SUMMIT'
           REPLACE TOWN WITH 'T18'
      CASE MUNICIPALI='UNION'
           REPLACE TOWN WITH 'T19'
      CASE MUNICIPALI='WESTFIELD'
           REPLACE TOWN WITH 'T20'
      CASE MUNICIPALI='WINFIELD'
           REPLACE TOWN WITH 'T21'
   ENDCASE
   
SKIP

ENDDO

REPLACE INACTIVE_V WITH '**' FOR 'I'$VOTER_STAT
GO TOP


******************
FUNCTION UNION_MOV

   DO CASE
      CASE '01'$NTOWN
           SUB_DIR='BERK_HTS'
      CASE '02'$NTOWN
           SUB_DIR='CLARK'
      CASE '03'$NTOWN
           SUB_DIR='CRANFORD'
      CASE '04'$NTOWN
           SUB_DIR='ELIZA'
      CASE '05'$NTOWN
           SUB_DIR='FANWOOD'
      CASE '06'$NTOWN
           SUB_DIR='GARWOOD'
      CASE '07'$NTOWN
           SUB_DIR='HILLSIDE'
      CASE '08'$NTOWN
           SUB_DIR='KENILWO'
      CASE '09'$NTOWN
           SUB_DIR='LINDEN'
      CASE '10'$NTOWN
           SUB_DIR='MOUNTAIN'
      CASE '11'$NTOWN
           SUB_DIR='NEW_PROV'
      CASE '12'$NTOWN
           SUB_DIR='PLAINFLD'
      CASE '13'$NTOWN
           SUB_DIR='RAHWAY'
      CASE '14'$NTOWN
           SUB_DIR='ROSELE'
      CASE '15'$NTOWN
           SUB_DIR='ROSE_PRK'
      CASE '16'$NTOWN
           SUB_DIR='SCOTCH_P'
      CASE '17'$NTOWN
           SUB_DIR='SPRINGF'
      CASE '18'$NTOWN
           SUB_DIR='SUMMIT'
      CASE '19'$NTOWN
           SUB_DIR='UNION'
      CASE '20'$NTOWN
           SUB_DIR='WESTFLD'
      CASE '21'$NTOWN
           SUB_DIR='WINFIELD'
   ENDCASE
   

******************
FUNCTION HUDSON_MOV

   DO CASE
      CASE NTOWN = "BAY"
           SUB_DIR='BAY'
      CASE NTOWN = "EN"
           SUB_DIR='EN'
      CASE NTOWN = "GUT"
           SUB_DIR='GUT'
      CASE NTOWN = "HAR"
           SUB_DIR='HAR'
      CASE NTOWN = "HOB"
           SUB_DIR='HOB'
      CASE SUBSTR(NTOWN,1,2)="JC"
           SUB_DIR='JC'
      CASE NTOWN = "KY"
           SUB_DIR='KY'
      CASE NTOWN = "NB"
           SUB_DIR='NB'
      CASE NTOWN = "SEC"
           SUB_DIR='SEC'
      CASE NTOWN = "UC"
           SUB_DIR='UC'
      CASE NTOWN = "WNY"
           SUB_DIR='WNY'
      CASE NTOWN = "WEE"
           SUB_DIR='WEE'
   ENDCASE
  


***********************
FUNCTION HUD_TWN

GO TOP
DO WHILE NOT EOF()

   DO CASE

      CASE MUNICIPALI="BAYONNE"
           REPLACE TOWN WITH "BAY"
      CASE MUNICIPALI="EAST NEWARK"
           REPLACE TOWN WITH "EN"
      CASE MUNICIPALI="GUTTENBERG"
           REPLACE TOWN WITH "GUT"
      CASE MUNICIPALI="HARRISON"      
           REPLACE TOWN WITH "HAR"
      CASE MUNICIPALI="HOBOKEN"
           REPLACE TOWN WITH "HOB"

      CASE MUNICIPALI="JERSEY CITY"
            DO CASE
              CASE WARD="01" 
                   REPLACE WARD WITH "A",TOWN WITH "JCA"
              CASE WARD="02" 
                   REPLACE WARD WITH "B",TOWN WITH "JCB"
              CASE WARD="03" 
                   REPLACE WARD WITH "C",TOWN WITH "JCC"
              CASE WARD="04" 
                   REPLACE WARD WITH "D",TOWN WITH "JCD"
              CASE WARD="05"                             
                   REPLACE WARD WITH "E",TOWN WITH "JCE"
              CASE WARD="06" 
                   REPLACE WARD WITH "F",TOWN WITH "JCF"
           ENDCASE

      CASE MUNICIPALI="KEARNY"
           REPLACE TOWN WITH "KY"
      CASE MUNICIPALI="NORTH BERGEN"
           REPLACE TOWN WITH "NB"
      CASE MUNICIPALI="SECAUCUS"
           REPLACE TOWN WITH "SEC"
      CASE MUNICIPALI="UNION CITY"      
           REPLACE TOWN WITH "UC"
      CASE MUNICIPALI="WEST NEW YORK"
           REPLACE TOWN WITH "WNY"
      CASE MUNICIPALI="WEEHAWKEN"
           REPLACE TOWN WITH "WEE"
   ENDCASE
   
SKIP
    
ENDDO
GO TOP
