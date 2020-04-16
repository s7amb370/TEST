@ECHO OFF
CLS

REM Име на сървъра.. "Промени за всеки отделен сървър !!"
SET NAME=CS.SECTOR.BG


REM Параметри при стартиране на сървъра..
SET STARTPARAM=sv_lan 1 -game cstrike -port 27015 +maxplayers 21 +map de_dust2 -noipx -insecure -nomaster -console -pingbooster 3 +hostname AntiCovid...


REM Авторско право (0-изкл, 1-вкл.)
SET COPYRIGHT=1


REM Език на конзолата.
SET LANG=EN


REM	Формат за показване на часа (0-нищо, 1-само час, 2-Час и Дата)
SET STYLETIME=2


REM	Цвят при стартиране на конзолата(COLORSTART)(По подразбиране: 1); Цвят за грешки (COLORERROR)(По подразбиране: 2)  (1-Зелен, 2-Червен, 3-Син, 4-Лилав, 5-Жълт, 6-Бял)
SET COLORSTART=1
SET COLORERROR=2


REM	Показване на пътя до файловете на сървъра (0- Не, 1- Да) 
SET PATHWAY=1


REM Грешките да са оцветени винаги или само когато възникнат (0-Винаги, 1-Само по време на грешката)
SET DYNAMICCOLOR=1


REM При срив на сървъра , нужно ли е да натиснете бутон за да стартира, или да стане автоматично? (1-Натисни бутон, 0-Автоматично!!!) НЕ ПИПАЙ!
SET CONFIRM=0

REM //////////////////////////////////////////////////////////////////////

IF "%LANG%"=="EN" (
SET MM_SERVERNAME=Starting dedicated server
SET MM_PATHWAY=Server location
SET MM_CREATEDIRLOG=Created log file.
SET MM_STARMSG=Run dedicated server
SET MM_STARTMSG_ABOUT=This system will run the server, after the crash.
SET MM_CONFIRM_KEY=Press any key for run server!
SET MM_RUNMSG_OK=Run the server.
SET MM_RUNMSG_CRASH=WARNING: begin restore the server from a serious error!
SET MM_RUNMSG_UP=Wait a second, is restoring the server...
)
REM Начало.
REM ///////////////////////////////////////////////////////////////////////

REM // Име на прозореца..
TITLE  %MM_SERVERNAME% %NAME%

REM // Определение цветов
SET GREEN=COLOR 0a
SET RED=COLOR 0c
SET BLUE=COLOR 09
SET PINK=COLOR 0d
SET YELLOW=COLOR 0E
SET WHITE=COLOR 0F

REM // Цветове на стартираната конзола
IF "%COLORSTART%"=="1"  SET COLORSTART=%GREEN%
IF "%COLORSTARt%"=="2"  SET COLORSTART=%RED%
IF "%COLORSTART%"=="3"  SET COLORSTART=%BLUE%
IF "%COLORSTART%"=="4"  SET COLORSTART=%PINK%
IF "%COLORSTART%"=="5"  SET COLORSTART=%YELLOW%
IF "%COLORSTART%"=="6"  SET COLORSTART=%WHITE%

REM // Цветове на грешките
IF "%COLORERROR%"=="1"  SET COLORERROR=%GREEN%
IF "%COLORERROR%"=="2"  SET COLORERROR=%RED%
IF "%COLORERROR%"=="3"  SET COLORERROR=%BLUE%
IF "%COLORERROR%"=="4"  SET COLORERROR=%PINK%
IF "%COLORERROR%"=="5"  SET COLORERROR=%YELLOW%
IF "%COLORERROR%"=="6"  SET COLORERROR=%WHITE%


REM // Показва пътя към РЕХЛДС
IF "%PATHWAY%"=="1" (ECHO %MM_PATHWAY%: %CD%
ECHO ====================================
ECHO.)

REM // Създаване на файл с лог за грешките.                                                         
IF NOT EXIST RUNLOG (
ECHO ------------------------------------
ECHO %MM_CREATEDIRLOG%
ECHO ------------------------------------
ECHO.
MKDIR RUNLOG)

REM // Формат - Дата, Час
IF "%STYLETIME%"=="0" SET SHOWTIME=
IF "%STYLETIME%"=="1" SET SHOWTIME=%TIME:~0,-3%
IF "%STYLETIME%"=="2" SET SHOWTIME=%TIME:~0,-3% / %DATE:~3% 

REM // Записване на стартове в лог-а
ECHO ====================================================>>RUNLOG/%NAME%/%DATE%.txt    
ECHO %DATE% ^> Start new session %TIME:~0,-3% >>RUNLOG/%NAME%/%DATE%.txt
ECHO ====================================================>>RUNLOG/%NAME%/%DATE%.txt    
 

REM СТАРТ.
REM ////////////////////////////////////////////////////////


REM // Стартово съобщение, формати.
ECHO %MM_STARMSG% %NAME%
ECHO.
ECHO ====================================
ECHO %MM_STARTMSG_ABOUT%
ECHO.


IF "%LANG%"=="EN" (
IF "%COPYRIGHT%"=="1" ECHO Autor: Cox, Masta®, DavidofF.
ECHO ====================================
IF "%COPYRIGHT%"=="1" ECHO.
)


ECHO ------------------------------------
ECHO.
ECHO %SHOWTIME% ^>^>^> %MM_RUNMSG_OK%
IF "%DYNAMICCOLOR%"=="0" (%COLORSTART%)

REM // При срив на сървъра се задейства:
:RUNSERVER

REM // Промяна в цвета на грешките
IF "%DYNAMICCOLOR%"=="1" (%COLORSTART%)

REM // Параметри за таск-а
START/HIGH/MIN/WAIT  hlds.exe + %STARTPARAM%

REM // Формат на цвета на грешките
%COLORERROR%

ECHO.
ECHO ------------------------------------
ECHO.
ECHO %SHOWTIME% ^> %MM_RUNMSG_CRASH%
ECHO ------------------------------------

REM // Записване на лог файл!!
ECHO %SHOWTIME% ^> SERVER HAS BEEN CRASH>>RUNLOG/%NAME%/%DATE%.txt

PING 127.0.0.1 -n 3 > nul
IF "%CONFIRM%"=="1" (
ECHO %MM_CONFIRM_KEY%
PAUSE >nul)
IF "%STYLETIME%"=="0" SET SHOWTIME=
IF "%STYLETIME%"=="1" SET SHOWTIME=%TIME:~0,-3%
IF "%STYLETIME%"=="2" SET SHOWTIME=%TIME:~0,-3% / %DATE:~3% 
ECHO ------------------------------------
ECHO.
ECHO %SHOWTIME% ^>^>^> %MM_RUNMSG_UP%
GOTO RUNSERVER
