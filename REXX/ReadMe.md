# REXX
<details>
  <summary> 1. Julian Date to Gregorian Date Converter - REXX </summary>
 <br />
  
**Input :** Julian Date    - YYYYDDD <br />
**Output:** Gregorian Date - YYYYMMDD <br />
**Exit  :** Type QUIT <br />

**Modification**
- Initial Release - 2023-09-10
- Updated Version - 2023-09-10
  - Updated the code to correctly calculate the Day of week
  - Earlier version wasn't giving correct Day of week if the date < 1973001
  - Added the logic check for days in the input Julian date
  - Updated the logic to find the Gregorian Date using the in-built DATE() function in REXX

**Basic Validations Performed:**
 - Input date is not blank
 - Input date is of 7 length
 - Input date if of Number datatype
 - Input date day is in range from 1 to 365 (366 for Leap year)

**REXX Code**: 
  - [JUL2GREG - Explict Error Checks](https://github.com/Mahaboob-Khan/Mainframe/blob/main/REXX/JUL2GREG.rexx)
  - [JUL2GRG2 - Error Handling using SIGNAL](https://github.com/Mahaboob-Khan/Mainframe/blob/main/REXX/JUL2GRG2.rexx)

**Testing:**
![JUL2GREG](/REXX/files/Julian_to_Gregorian.PNG)
</details>
