/* Rexx - Convert the Julian Date to Gregorian Date
          Input : Julian Date    - YYYYDDD
          Output: Gregorian Date - YYYYMMDD
          Exit  : Type QUIT

   Do Forever Loop is used to eliminate the need to execute multiple
   times. User can exit the program at any time by typing QUIT

   Basic Validations Performed:
     - Input date is not blank
     - Input date is of 7 length
     - Input date if of Number datatype
     - Input date day is in range from 1 to 366
*/
DO FOREVER

  SAY 'Please enter the Julian date(YYYYDDD) or type QUIT to end!'
  PULL julian_date

  IF julian_date = 'QUIT' THEN
     EXIT

  julian_date = STRIP( julian_date )

  CALL determine_leap_year

  DO WHILE ( julian_date <> 'QUIT' ) &,
           ( ( julian_date = '' ) |,
             ( LENGTH( julian_date ) <> 7 ) |,
             ( DATATYPE( julian_date ) <> 'NUM' ) |,
             ( days < 1 | days > 366 ) |,
             ( days > 365 & leap_year <> 1 ) )
     SAY 'Please enter the valid Julian date(YYYYDDD) or',
         'type QUIT to end!'
     PULL julian_date
     julian_date = STRIP( julian_date )
     CALL determine_leap_year
  END

  IF julian_date = 'QUIT' THEN
     EXIT

/* Format the Output in Gregorian Date format */
  gregorian_temp = DATE( 'S', SUBSTR( julian_date, 3, 5 ), 'J' )
  gregorian_date = SUBSTR( julian_date, 1, 4 ) ||,
                   SUBSTR( gregorian_temp, 5, 4)

  day_of_week = DATE( 'W', gregorian_date, 'S' )

  SAY 'Day of week: '||day_of_Week
  SAY 'Gregorian Date: '||gregorian_date

END

determine_leap_year:
  leap_year = 0
  IF ( julian_date <> '' & LENGTH( julian_date ) = 7 &,
       DATATYPE( julian_date ) = 'NUM' ) THEN
     DO
      /* Get the Year & Days from the user input */
        year = SUBSTR(julian_date, 1, 4)
        days = SUBSTR(julian_date, 5, 3)

      /* Determine if the input year is a Leap year */
        leap_year = ( year // 4 = 0 ) &,
               ( ( year // 100 <> 0 ) | ( year // 400 = 0 ) )
     END

  RETURN

EXIT