       IDENTIFICATION DIVISION.
       PROGRAM-ID. CobolDMS.

       DATA DIVISION.
         WORKING-STORAGE SECTION.
         01 WS-SELECTION PIC 9 VALUE 3.
         01 WS-DEGREES PIC 999V99.
         01 WS-DMS-DEGREES PIC 999V99.
         01 WS-DMS-MINUTES PIC 999V99.
         01 WS-DMS-SECONDS PIC 999V99.

       PROCEDURE DIVISION.
         MENU-PARA.
         DISPLAY "== COBOL Degree and DMS Converter ==".
         DISPLAY "Please, select an option from below:".
         DISPLAY "[0] Convert degrees to DMS notation".
         DISPLAY "[1] Convert DMS notation to degrees".
         DISPLAY "[2] Help".
         DISPLAY "[3] Exit".
         ACCEPT WS-SELECTION.

         DISPLAY " "
         DISPLAY " "

           EVALUATE TRUE
               WHEN WS-SELECTION = 0
                   GO TO DEGREES-TO-DMS-PARA

               WHEN WS-SELECTION = 1
                   GO TO DMS-TO-DEGREES-PARA

               WHEN WS-SELECTION = 2
                   GO TO HELP-PARA

               WHEN WS-SELECTION = 3
                   STOP RUN

               WHEN OTHER
                   DISPLAY "That is not a valid option. Please, try "
                   "again"
                   DISPLAY " "
                   GO TO MENU-PARA
           END-EVALUATE.


        
         SUBMENU-PARA.
         DISPLAY " ".
         DISPLAY "    Please, select an option from below:"
         DISPLAY "    [0] Go back to main menu"
         DISPLAY "    [1] Exit"
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
         DISPLAY "    > Degrees to DMS <    ".
         GO TO SUBMENU-PARA.



         DMS-TO-DEGREES-PARA.
         DISPLAY "    > DMS to Degrees <    ".
         GO TO SUBMENU-PARA.


         HELP-PARA.
         DISPLAY "    > This help menu is still under work <    ".
         DISPLAY "      Sorry ):".
         GO TO SUBMENU-PARA.


       STOP RUN.

