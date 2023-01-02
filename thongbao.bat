@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
cls
chcp 65001
title Notify New K0kuS's RPG
MODE 120,30
 @for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
reg add HKCU\Console /v QuickEdit /t REG_DWORD /d 0 /f
echo %esc%[38;5;255m
cls

echo.
echo ========================================================================================================================
echo                                                       THÔNG BÁO
echo ========================================================================================================================
echo.&echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo  [20:30 2/1/2023]
echo                        K0kuS's RPG v0.5 Story Update Part 2 Early Access Đang Bắt Đầu Phát Triển!!
echo                Bản cập nhật bổ sung cốt truyện cho K0kuS's RPG v0.4 và Cân Bằng Các chỉ số trong Game
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo  [2/1/2023]
echo                                K0kuS's RPG v0.4 Story Update Early Access Vừa Ra Mắt!!
echo                         K0kuS's RPG v0.4 Story Update Early Access release at 18:30 2/1/2023
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo  [1/1/2023]
echo                                      K0kuS's RPG v0.4 sắp được hoàn thành.!
echo  Tên chính thức của bản cập nhật này là: K0kuS's RPG v0.4 Story Update Early Access, một bản cập nhật đầy hứa hẹn
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo  [0:00 1/1/2023]
echo                                    K0kuS's RPG v0.3 Happy New Year Early Acess
echo                    Bản K0kuS's RPG v0.3 Happy New Year Early Acess vừa ra mắt!! vào lúc 0:00 1/1/2023



pause>nul
exit
