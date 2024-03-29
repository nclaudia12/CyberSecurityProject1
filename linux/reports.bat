:::::: Activity 1 ::::::
:: Navigation and cleanup
cd "C:\Users\%USERNAME%\Desktop"
mkdir reports
cd reports
del report.txt
:: Report initialization
echo Baselining Report > report.txt
echo Created by [your name here] >> report.txt
echo %OS% system report created on %DATE% with logged in user, %USERNAME% >> report.txt


:::::: Activity 2 ::::::
:: OS information
wmic /APPEND:report.txt os get caption, buildnumber
:: Disk information
wmic /APPEND:report.txt logicaldisk get caption, filesystem, freespace, size, volumeserialnumber


:::::: Activity 3 ::::::
:: 64-bit applications
dir "%ProgramFiles%" >> report.txt
:: or
dir "C:\Program Files" >> report.txt
:: 32-bit application 
dir "%ProgramFiles(x86)%" >> report.txt
:: or
dir "C:\Program Files (x86)" >> report.txt

:: User information
wmic /APPEND:report.txt useraccount get caption, sid, description
:: All user logons, last logons
wmic /APPEND:report.txt netlogin get caption, numberoflogons, lastlogon
:: Windows update patcches
wmic /APPEND:report.txt qfe get caption, description, installedon, hotfixid


:::::: Activity 5 ::::::
:: Alex's password status
net user Alex >> report.txt
:: Groups on the machine
net localgroup >> report.txt
:: Current password policy
net accounts >> report.txt
