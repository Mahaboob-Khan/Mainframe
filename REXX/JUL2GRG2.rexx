/* Rexx - Convert the Julian Date to Gregorian Date
          Input : Julian Date    - YYYYDDD
          Output: Gregorian Date - YYYYMMDD
          Exit  : Type QUIT
*/
SIGNAL ON ERROR
SIGNAL ON SYNTAX
CALL get_user_input;
SAY 'Bye!!!'
EXIT(0)

get_user_input:
  SAY 'Please enter a valid Julian date(YYYYDDD) or type QUIT to end!'
  PULL julian_date
  julian_date = STRIP( julian_date )
  CALL get_gregorian_date;
  RETURN

get_gregorian_date:
  DO WHILE julian_date <> 'QUIT'
    gregorian_temp = DATE( 'S', SUBSTR( julian_date, 3, 5 ), 'J' )
    gregorian_date = SUBSTR( julian_date, 1, 4 ) ||,
                     SUBSTR( gregorian_temp, 5, 4)

    day_of_week = DATE( 'W', gregorian_date, 'S' )
    SAY 'Day of week: '||day_of_Week
    SAY 'Gregorian Date: '||gregorian_date
    CALL get_user_input;
  END
  RETURN

ERROR: SYNTAX:
  SAY 'Invalid date entered!'
  SAY 'Please verify the Julian date entered and relaunch.'