       IDENTIFICATION DIVISION.
       PROGRAM-ID. CobolDMS.

       DATA DIVISION.
         WORKING-STORAGE SECTION.
         01 WS-SELECTION PIC 9 VALUE 3.
         01 WS-DEGREES PIC 999V9999.
         01 WS-DEGREES-VISUAL PIC ZZ9.999.
         01 WS-MINUTES PIC 999V9999.
         01 WS-SECONDS PIC 999V9999.
         01 WS-DMS-TEMP1 PIC 999V999.
         01 WS-DMS-TEMP2 PIC 999V999.
         01 WS-DMS-DEGREES PIC ZZ9.
         01 WS-DMS-MINUTES PIC Z9.
         01 WS-DMS-MINUTES-NUMERIC PIC 99.
         01 WS-DMS-SECONDS PIC 99V99.

       PROCEDURE DIVISION.
         MENU-PARA.
         DISPLAY "== COBOL Degree and DMS Converter ==".
         DISPLAY "Please, select an option from below:".
         DISPLAY "[0] Convert degrees to DMS notation".
         DISPLAY "[1] Convert DMS notation to degrees".
      *  DISPLAY "[2] Help".
         DISPLAY "[2] Exit".
         DISPLAY " ".
         DISPLAY ">>> " WITH NO ADVANCING.
         ACCEPT WS-SELECTION.

         DISPLAY " ".
         DISPLAY " ".

           EVALUATE TRUE
               WHEN WS-SELECTION = 0
                   GO TO DEGREES-TO-DMS-PARA

               WHEN WS-SELECTION = 1
                   GO TO DMS-TO-DEGREES-PARA

      *     WHEN WS-SELECTION = 2
      *            GO TO HELP-PARA

               WHEN WS-SELECTION = 2
                   STOP RUN

               WHEN OTHER
                   DISPLAY "That is not a valid option. Please, try "
                   "again"
                   DISPLAY " "
                   GO TO MENU-PARA
           END-EVALUATE.


        
         SUBMENU-PARA.
         DISPLAY " ".
         DISPLAY "    Please, select an option from below:".
         DISPLAY "    [0] Go back to main menu".
         DISPLAY "    [1] Exit".
         DISPLAY "    ".
         DISPLAY "    >>> " WITH NO ADVANCING.
         ACCEPT WS-SELECTION.

           EVALUATE TRUE
               WHEN WS-SELECTION = 0
                   DISPLAY " "
                   DISPLAY " "
                   GO TO MENU-PARA

              WHEN OTHER
                   STOP RUN
           END-EVALUATE.
         


         DEGREES-TO-DMS-PARA.
         DISPLAY "            > Degrees to DMS <    ".
         DISPLAY "    Enter value in degrees (XXX.XXX): "
         WITH NO ADVANCING.
         ACCEPT WS-DEGREES.

      * For the degrees use the whole number part of the decimal
         MOVE WS-DEGREES(1:3) TO WS-DMS-DEGREES.
     
      * For the minutes multiply the decimal by 60 and use the whole part
         MOVE WS-DEGREES(4:3) TO WS-DMS-TEMP1.
         MULTIPLY 0.6 BY WS-DMS-TEMP1.
         MOVE WS-DMS-TEMP1(1:2) TO WS-DMS-MINUTES.

      * For the seconds multiply the remaining decimal by 60
         MOVE WS-DMS-MINUTES TO WS-DMS-MINUTES-NUMERIC.
         COMPUTE WS-DMS-TEMP1 = WS-DMS-TEMP1 -
         (WS-DMS-MINUTES-NUMERIC * 10).
         MULTIPLY 6 BY WS-DMS-TEMP1.
         MOVE WS-DMS-TEMP1 TO WS-DMS-SECONDS.

         DISPLAY "    "WS-DMS-DEGREES"° "WS-DMS-MINUTES"' "
         WS-DMS-SECONDS'"'.
         GO TO SUBMENU-PARA.



         DMS-TO-DEGREES-PARA.
         DISPLAY "       > DMS to Degrees <    ".
         DISPLAY "    Enter degrees (XXX): " WITH NO ADVANCING.
         ACCEPT WS-DEGREES.
         DISPLAY "    Enter minutes (XX): " WITH NO ADVANCING.
         ACCEPT WS-MINUTES.
         DISPLAY "    Enter seconds (XX.XXX): " WITH NO ADVANCING.
         ACCEPT WS-SECONDS.

         COMPUTE WS-DEGREES-VISUAL = WS-DEGREES + (WS-MINUTES / 60) +
           (WS-SECONDS / 3600).

         DISPLAY "    "WS-DEGREES-VISUAL"°".
         GO TO SUBMENU-PARA.


      *  HELP-PARA.
      *  DISPLAY "    > This help menu is still under work <    ".
      *  DISPLAY "      Sorry ):".
      *  DISPLAY "      PLEASE SEND HELP".
      *  DISPLAY "      WHY AM I EVEN DOING THIS?".
      *  GO TO SUBMENU-PARA.


       STOP RUN.

