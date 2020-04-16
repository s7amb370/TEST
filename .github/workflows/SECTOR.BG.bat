@ECHO OFF
CLS
SET NAME=SECTOR.BG Classic Massive [HLstatsX] 18+

SET STARTPARAM=sv_lan 0 -game cstrike -port 27015 +maxplayers 21 +map de_dust2 -noipx -insecure -nomaster -console -pingbooster 3 +hostname %NAME%

SET COPYRIGHT=1

SET LANG=EN

SET STYLETIME=2

SET COLORSTART=1

SET COLORERROR=2

SET PATHWAY=1

SET DYNAMICCOLOR=1

SET CONFIRM=0

SET VD_ENABE=0

IF "%LANG%"=="BG" (GOTO:BG)
IF "%LANG%"=="EN" (GOTO:EN)

:BG

SET MM_SERVERNAME=Стартиране на сървър
SET MM_PATHWAY=Разположение на файловете на сървъра
SET MM_CREATEDIRLOG=Създаване на лог файл.

SET MM_STARMSG=Пуснете специален сървър
SET MM_STARTMSG_ABOUT=Тази система ще стартира сървъра при краш.

SET MM_CONFIRM_KEY=Натиснете бутон за да стартирате отново!

SET MM_RUNMSG_OK=Стартирай сървъра.
SET MM_RUNMSG_CRASH=ВНИМАНИЕ: Рестарт на сървъра след сериозна грешка!
SET MM_RUNMSG_UP=Изчакайте няколко минути сървъра се възтановява...

GOTO:END_LANG


:EN

SET MM_SERVERNAME=Starting dedicated server
SET MM_PATHWAY=Server location
SET MM_CREATEDIRLOG=Created log file.

SET MM_STARMSG=Run dedicated server
SET MM_STARTMSG_ABOUT=This system will run the server, after the crash.

SET MM_CONFIRM_KEY=Press any key for run server!

SET MM_RUNMSG_OK=Run the server.
SET MM_RUNMSG_CRASH=WARNING: begin restore the server from a serious error!
SET MM_RUNMSG_UP=Wait a minute, is restoring the server...

GOTO:END_LANG



:END_LANG

TITLE  %MM_SERVERNAME% %NAME%

SET VERSION=1.1.0

SET GREEN=COLOR 0a
SET RED=COLOR 0c
SET BLUE=COLOR 09
SET PINK=COLOR 0d
SET YELLOW=COLOR 0E
SET WHITE=COLOR 0F

IF "%COLORSTART%"=="1"  SET COLORSTART=%GREEN%
IF "%COLORSTARt%"=="2"  SET COLORSTART=%RED%
IF "%COLORSTART%"=="3"  SET COLORSTART=%BLUE%
IF "%COLORSTART%"=="4"  SET COLORSTART=%PINK%
IF "%COLORSTART%"=="5"  SET COLORSTART=%YELLOW%
IF "%COLORSTART%"=="6"  SET COLORSTART=%WHITE%

IF "%COLORERROR%"=="1"  SET COLORERROR=%GREEN%
IF "%COLORERROR%"=="2"  SET COLORERROR=%RED%
IF "%COLORERROR%"=="3"  SET COLORERROR=%BLUE%
IF "%COLORERROR%"=="4"  SET COLORERROR=%PINK%
IF "%COLORERROR%"=="5"  SET COLORERROR=%YELLOW%
IF "%COLORERROR%"=="6"  SET COLORERROR=%WHITE%

IF NOT EXIST VIRTUALDRIVE.bat GOTO VD_ENABE_FALSE
IF %VD_ENABE%==1 (CALL VIRTUALDRIVE.bat)
:VD_ENABE_FALSE


IF "%PATHWAY%"=="1" (ECHO %MM_PATHWAY%: %CD%
ECHO ====================================
ECHO.)

IF NOT EXIST RUNLOG (
ECHO ------------------------------------
ECHO %MM_CREATEDIRLOG%
ECHO ------------------------------------
ECHO.
MKDIR RUNLOG)

IF "%STYLETIME%"=="0" SET SHOWTIME=
IF "%STYLETIME%"=="1" SET SHOWTIME=%TIME:~0,-3%
IF "%STYLETIME%"=="2" SET SHOWTIME=%TIME:~0,-3% / %DATE:~3% 

ECHO ====================================================>>RUNLOG/%DATE%.txt    
ECHO %DATE% ^> Start new session %TIME:~0,-3% >>RUNLOG/%DATE%.txt
ECHO ====================================================>>RUNLOG/%DATE%.txt    
 



ECHO %MM_STARMSG% %NAME%
ECHO.
ECHO ====================================
ECHO %MM_STARTMSG_ABOUT%
ECHO.

IF "%LANG%"=="BG" (
IF "%COPYRIGHT%"=="1" ECHO Съпорт: Skype: s7amb370
IF "%COPYRIGHT%"=="1" ECHO.
IF "%COPYRIGHT%"=="1" ECHO Автори: Cox, Master, SiLky, DavidofF
IF "%COPYRIGHT%"=="1" ECHO.
IF "%COPYRIGHT%"=="1" ECHO Версия: %VERSION%

ECHO ====================================
IF "%COPYRIGHT%"=="1" ECHO.
)

IF "%LANG%"=="EN" (
IF "%COPYRIGHT%"=="1" ECHO Support: Skype: s7amb370
IF "%COPYRIGHT%"=="1" ECHO.
IF "%COPYRIGHT%"=="1" ECHO Autors: Cox, Master, SiLky, DavidofF
IF "%COPYRIGHT%"=="1" ECHO.
IF "%COPYRIGHT%"=="1" ECHO Version: %VERSION%

ECHO ====================================
IF "%COPYRIGHT%"=="1" ECHO.
)


ECHO ------------------------------------
ECHO.
ECHO %SHOWTIME% ^>^>^> %MM_RUNMSG_OK%

IF "%DYNAMICCOLOR%"=="0" (%COLORSTART%)

:RUNSERVER

IF "%DYNAMICCOLOR%"=="1" (%COLORSTART%)

START/HIGH/MIN/WAIT  hlds.exe + %STARTPARAM%

%COLORERROR%

ECHO.
ECHO ------------------------------------
ECHO.
ECHO %SHOWTIME% ^> %MM_RUNMSG_CRASH%
ECHO ------------------------------------

ECHO %SHOWTIME% ^> Server has been crashed>>RUNLOG/%DATE%.txt

ping -n 2 -w 1 127.0.0.1 > nul
COLOR C0
ping -n 2 -w 1 127.0.0.1 > nul
COLOR 0C
ping -n 2 -w 1 127.0.0.1 > nul
COLOR C0
ping -n 2 -w 1 127.0.0.1 > nul
COLOR 0C
ping -n 2 -w 1 127.0.0.1 > nul
COLOR 0C


IF "%CONFIRM%"=="1" (
ECHO %MM_CONFIRM_KEY%

ping -n 2 -w 1 127.0.0.1 > nul
PAUSE >nul)

IF "%STYLETIME%"=="0" SET SHOWTIME=
IF "%STYLETIME%"=="1" SET SHOWTIME=%TIME:~0,-3%
IF "%STYLETIME%"=="2" SET SHOWTIME=%TIME:~0,-3% / %DATE:~3% 

ECHO ------------------------------------
ECHO.
ECHO %SHOWTIME% ^>^>^> %MM_RUNMSG_UP%

GOTO RUNSERVER
