:: *****************************************************************************
:: Ping_Email.bat  5/9/2018 
:: Summary: CED Web Apps Server Report
::
:: Description: Ping servers that support CED web apps and email report. 
::
:: Scheduled Task - Everyday at 7:00 am.
::
:: Path:\\geobase-win\ced\GADS\R2017\R398\Batch\Ping_Email.bat
:: *****************************************************************************

:: Set log directory for process verification file
    SET LogDir=\\geobase-win\ced\GADS\R2017\R398\Batch\log\servers

:: Set variable %theDate% to today's date (YYYYMMDD)
     for /f "tokens=2,3,4 delims=/ " %%a in ('date/t') do set theDate=%%c%%a%%b

:: Record starting time
Echo. > %LogDir%%theDate%.log
Echo ============================================================================  >> %LogDir%%theDate%.log
Echo CED Web Apps Server Report  >> %LogDir%%theDate%.log
Echo ============================================================================  >> %LogDir%%theDate%.log
Echo. >> %LogDir%%theDate%.log 2>&1
Echo Start time:  >> %LogDir%%theDate%.log
 time /T >> %LogDir%%theDate%.log

::  Send ping output to log file (Echo. = blank line)
Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING CED Internal Server by Name (wsitd03):  >> %LogDir%%theDate%.log 2>&1
 ping -a wsitd03  >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING CED Internal Server by IP (10.200.1.106): 1>>%LogDir%%theDate%.log 2>&1
 ping -a 10.200.1.106  >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING CED Public Web Server by Name (wspdsmap.cityoftacoma.org): 1>>%LogDir%%theDate%.log 2>&1
 ping -a wspdsmap.cityoftacoma.org  >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING CED Public Web Server by IP (131.191.240.68): 1>>%LogDir%%theDate%.log 2>&1
 ping -a 131.191.240.68 >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING IT Internal Server by Name (arcgisprod02):  >> %LogDir%%theDate%.log 2>&1
 ping -a arcgisprod02 >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING IT Internal Server by IP (10.200.0.185):  >> %LogDir%%theDate%.log 2>&1
 ping -a 10.200.0.185 >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING IT Public Web Server by Name (gis.cityoftacoma.org): 1>>%LogDir%%theDate%.log 2>&1
 ping -a gis.cityoftacoma.org  >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING IT Public Web Server by IP (131.191.240.64): 1>>%LogDir%%theDate%.log 2>&1
 ping -a 131.191.240.64 >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING IT Public Web Server by Internal Name (arcgisprod03): 1>>%LogDir%%theDate%.log 2>&1
 ping -a arcgisprod03  >> %LogDir%%theDate%.log 2>&1

Echo. >> %LogDir%%theDate%.log 2>&1
Echo ********** PING IT Public Web Server by Internal IP (131.191.129.130): 1>>%LogDir%%theDate%.log 2>&1
 ping -a 131.191.129.130 >> %LogDir%%theDate%.log 2>&1

::Record stop time
Echo. >> %LogDir%%theDate%.log 2>&1
Echo Stop time:  >> %LogDir%%theDate%.log
 time /T >> %LogDir%%theDate%.log

 
::Send Email with log file content
cscript \\geobase-win\ced\GADS\R2017\R398\Batch\Ping_Email.vbs %LogDir%%theDate%.log

::pause