/* Rexx - Convert the Julian Date to Gregorian Date
          Input : Julian Date    - YYYYDDD
          Output: Gregorian Date - YYYY/MM/DD
          Exit  : Type QUIT

   Do Forever Loop is used to eliminate the need to execute multiple
   times. User can exit the program at any time by typing QUIT

   Basic Validations Performed:
     - Input date is not blank
     - Input date is of 7 length
     - Input date if of Number datatype

*/
DO FOREVER

  SAY 'Please enter the Julian date(YYYYDDD) or type QUIT to end!'
  PULL julian_date

  IF julian_date = 'QUIT' THEN
     EXIT

  julian_date = STRIP( julian_date )

  DO WHILE ( julian_date <> 'QUIT' ) &,
           ( ( julian_date = '' ) |,
             ( LENGTH( julian_date ) <> 7 ) |,
             ( DATATYPE( julian_date ) <> 'NUM' ) )
     SAY 'Please enter the date in Julian date(YYYYDDD) format or',
         'type QUIT to end!'
     PULL julian_date
     julian_date = STRIP( julian_date )
  END

  IF julian_date = 'QUIT' THEN
     EXIT

/* Get the Year & Days from the user input */
  year = SUBSTR(julian_date, 1, 4)
  days = SUBSTR(julian_date, 5, 3)

/* Determine if the input year is a Leap year */
  leap = ( year // 4 = 0 ) &,
         ( ( year // 100 <> 0 ) | ( year // 400 = 0 ) )

/* Determine if the days need to be added to Feb in case of leap */
  leap_days = leap & ( days > 59 )


/* Store no of days of each month in days_in_month to be used later */
  days_in_month = '31 28 31 30 31 30 31 31 30 31 30 31'

/* Initialize variables to be used in the calculations */
  month = 0
  day_of_month = 0
  total_days = 0

/* Loop through each month from days_in_month & determine the month
   and day_of_month for Gregorian Date
*/
  DO ctr = 1 TO 12
     /* If it's Feb Month & leap year, add 1 day to total days */
     curr_ctr_days = WORD( days_in_month, ctr ) +,
                     ( ctr = 2 & leap_days )
     prev_month_days = total_days
     total_days = prev_month_days + curr_ctr_days

     month = ctr

     IF days <= total_days THEN
        IF days < total_days THEN
           DO
             day_of_month = days - prev_month_days
             LEAVE
           END
        ELSE
           DO
             day_of_month = curr_ctr_days
             LEAVE
           END
  END

/* Format the Output in Gregorian Date format */
  day_of_week = DATE( 'W', SUBSTR( julian_date, 3, 5 ), 'J' )
  SAY 'Day of week: '||day_of_Week

  month = RIGHT( month, 2, '0' )
  day_of_month = RIGHT( day_of_month, 2, '0')

  gregorian_date = year||'/'||month||'/'day_of_month
  SAY 'Gregorian Date: '||gregorian_date

END
EXIT