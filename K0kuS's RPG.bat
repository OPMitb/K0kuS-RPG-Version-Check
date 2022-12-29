@echo off
chcp 65001
title K0kuS RPG v0.3.1 Early Access
MODE 120,38
set version=0.3.1
SETLOCAL EnableDelayedExpansion
 @for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
reg add HKCU\Console /v QuickEdit /t REG_DWORD /d 0 /f
cls

cd C:\K0kuSRPG\data\scripts
echo  [CheckVersion]
call checkversion.bat
set /p versionweb= <%temp%/K0kuSRPGCheckVersion.txt 

:loadgame
set /p playerexptotal= <C:/K0kuSRPG/data/playerexptotal.txt
set /p sworddamage= <C:/K0kuSRPG/data/sworddamage.txt
set /p sword= <C:/K0kuSRPG/data/swordname.txt
set /p playerlv= <C:/K0kuSRPG/data/playerlv.txt
set /p gold= <C:/K0kuSRPG/data/gold.txt
set /p wavei= <C:/K0kuSRPG/data/wavei.txt 
set /p playername= <C:/K0kuSRPG/data/playername.txt

::items
set swordunlock=0
set silverunlock=[Lock]
set ironunlock=[Lock]
set goldunlock=[Lock]
set diamondunlock=[Lock]
set rubyunlock=[Lock]
set emeraldunlock=[Lock]

set /a chestrarity=%random% %%10 +1
set commonchestcount=0
set rarechestcount=0
set epicchestcount=0

set /a potionrarity=%random% %%10 +1
set attackpotioncount=0
set attackpotionactive=0
set attackturn=0

::monsterstart
set /p monstername= <C:/K0kuSRPG/data/mobs/slime/name.txt
set /p slimehealth= <C:\K0kuSRPG\data\mobs\slime\health.txt
set /p slimehealthdefault=<C:\K0kuSRPG\data\mobs\slime\healthdefault.txt
set /p slimelevel=<C:\K0kuSRPG\data\mobs\slime\level.txt

::monsterkillstats
set monsterkill=0
set slimekill=0
set goblinkill=0
set ragegoblinkill=0
set brutalgoblinkill=0
set giantgoblinkill=0
set guardgoblinkill=0
set infantrygoblin=0
set darknessgoblin=0
set royalgoblin=0
set kingofgoblinkill=0

:loadsave
set /p sworddamage= <C:/K0kuSRPG/data/save/sworddamage.txt
set /p sword= <C:/K0kuSRPG/data/save/swordname.txt
set /p playerlv= <C:/K0kuSRPG/data/save/playerlv.txt
set /p gold= <C:/K0kuSRPG/data/save/gold.txt
set /p wavei= <C:/K0kuSRPG/data/save/wavei.txt
set /p playerexptotal= <C:/K0kuSRPG/data/save/playerexptotal.txt
set /p monstername= <C:/K0kuSRPG/data/save/monstername.txt
set /p monsterhealthdefault= <C:/K0kuSRPG/data/save/monsterhealthdefault.txt
set /p monsterhealth= <C:/K0kuSRPG/data/save/monsterhealth.txt
set /p level= <C:/K0kuSRPG/data/save/level.txt
set /p swordunlock= <C:/K0kuSRPG/data/save/swordunlock.txt
set /p silverunlock= <C:/K0kuSRPG/data/save/silverunlock.txt
set /p ironunlock= <C:/K0kuSRPG/data/save/ironunlock.txt
set /p goldunlock= <C:/K0kuSRPG/data/save/goldunlock.txt
set /p diamondunlock= <C:/K0kuSRPG/data/save/diamondunlock.txt
set /p rubyunlock= <C:/K0kuSRPG/data/save/rubyunlock.txt
set /p commonchestcount= <C:/K0kuSRPG/data/save/commonchestcount.txt
set /p rarechestcount= <C:/K0kuSRPG/data/save/rarechestcount.txt
set /p epicchestcount= <C:/K0kuSRPG/data/save/epicchestcount.txt
set /p attackpotioncount= <C:/K0kuSRPG/data/save/attackpotioncount.txt
cls
goto :rem
:save
 echo !sworddamage!> C:/K0kuSRPG/data/save\sworddamage.txt
 echo !sword!> C:/K0kuSRPG/data/save/swordname.txt
 echo !playerlv!> C:/K0kuSRPG/data/save/playerlv.txt
 echo !gold!> C:/K0kuSRPG/data/save/gold.txt
 echo !wavei!> C:/K0kuSRPG/data/save/wavei.txt
 echo !playerexptotal!> C:/K0kuSRPG/data/save/playerexptotal.txt
 echo !monstername!> C:/K0kuSRPG/data/save/monstername.txt
 echo !monsterhealthdefault!> C:/K0kuSRPG/data/save/monsterhealthdefault.txt
 echo !monsterhealth!> C:/K0kuSRPG/data/save/monsterhealth.txt
 echo !level!> C:/K0kuSRPG/data/save/level.txt

::swordsave
 echo !swordunlock!> C:/K0kuSRPG/data/save/swordunlock.txt
 echo !silverunlock!> C:/K0kuSRPG/data/save/silverunlock.txt
 echo !ironunlock!> C:/K0kuSRPG/data/save/ironunlock.txt
 echo !goldunlock!> C:/K0kuSRPG/data/save/goldunlock.txt
 echo !diamondunlock!> C:/K0kuSRPG/data/save/diamondunlock.txt
 echo !rubyunlock!> C:/K0kuSRPG/data/save/rubyunlock.txt

::chestsave
 echo !commonchestcount!> C:/K0kuSRPG/data/save/commonchestcount.txt
 echo !rarechestcount!> C:/K0kuSRPG/data/save/rarechestcount.txt
 echo !epicchestcount!> C:/K0kuSRPG/data/save/epicchestcount.txt

::itemsave
 echo !attackpotioncount!> C:/K0kuSRPG/data/save/attackpotioncount.txt
 
goto :gameplay

:save1
goto :gameplay

:reset
cd C:/K0kuSRPG/data
del save /f /q
del sworddamagenow.txt /f /q
taskkill /f -im cmd.exe

:rem

goto :gamestart

:lvlup
if !playerexptotal! geq 200 if !playerexptotal! lss 800 set playerlv=1
if !playerexptotal! geq 800 if !playerexptotal! lss 1400 set playerlv=2
if !playerexptotal! geq 1400 if !playerexptotal! lss 2000 set playerlv=3
if !playerexptotal! geq 2000 if !playerexptotal! lss 2600 set playerlv=4
if !playerexptotal! geq 2600 if !playerexptotal! lss 3400 set playerlv=5
if !playerexptotal! geq 3400 if !playerexptotal! lss 4200 set playerlv=6
if !playerexptotal! geq 4200 if !playerexptotal! lss 5000 set playerlv=7
if !playerexptotal! geq 5000 if !playerexptotal! lss 5800 set playerlv=8
if !playerexptotal! geq 5800 if !playerexptotal! lss 6600 set playerlv=9
if !playerexptotal! geq 6600 if !playerexptotal! lss 7600 set playerlv=10
if !playerexptotal! geq 7600 if !playerexptotal! lss 8600 set playerlv=11
if !playerexptotal! geq 8600 if !playerexptotal! lss 9600 set playerlv=12
if !playerexptotal! geq 9600 if !playerexptotal! lss 10600 set playerlv=13
if !playerexptotal! geq 10600 if !playerexptotal! lss 11600 set playerlv=14
if !playerexptotal! geq 11600 if !playerexptotal! lss 12800 set playerlv=15
if !playerexptotal! geq 12800 if !playerexptotal! lss 14000 set playerlv=16
if !playerexptotal! geq 14000 if !playerexptotal! lss 15200 set playerlv=17
if !playerexptotal! geq 15200 if !playerexptotal! lss 16400 set playerlv=18
if !playerexptotal! geq 16400 if !playerexptotal! lss 17600 set playerlv=19
if !playerexptotal! geq 17600 if !playerexptotal! lss 20000 set playerlv=20
goto :!monsternow!
pause >nul
goto :gameplay

:gamestart
if !version! == !versionweb! goto :start
cls
echo  Phiên Bản mới nhất hiện tại là !versionweb!
echo    Vui lòng cập nhật
pause>nul
exit

:start
echo                Xin chào %playername%
timeout 1 /nobreak >nul
echo          Chào mừng bạn đã đến với K0kuS's RPG
timeout 1 /nobreak >nul
echo        %esc%[38;5;1mChúc Mừng Năm Mới%esc%[38;5;255m    %esc%[38;5;226mAn Khan Thịnh Vượng%esc%[38;5;255m
timeout 1 /nobreak >nul
echo        Game vẫn đang trong giai đoạn thử nghiệm
timeout 3 /nobreak >nul
cls

:gameplay
MODE 120,38
set /p playername= <C:/K0kuSRPG/data/playername.txt
╱ ╲
taskkill /f -im cscript.exe
cd C:\K0kuSRPG/data/audio/system
start hidemusic.vbs
cls
echo %version%
echo          __   __                __   __                  _____            _______        _____        _______
echo         ^| ^|  ╱ ╱    _____      ^| ^|  ╱ ╱                 ╱ ____╲          ^|  ___  ^|      ^|  __ ╲      ╱  _____^|
echo         ^| ^| ╱ ╱    ╱     ╲     ^| ^| ╱ ╱     _      _     ╲  ╲  ╱          ^| ^|  ╱ ╱       ^|  __  ^|    ^|  ╱
echo         ^| ^|╱ ╱    ╱       ╲    ^| ^|╱ ╱     ^| ^|    ^| ^|     ╲  ╲            ^| ^| ╱ ╱        ^|  ___╱     ^|  ^|  ____
echo         ^|    ^|===^|  ^|   ^|  ^|===^|    ^|=====^| ^|    ^| ^|=====╱  ╱            ^| ^| ╲ ╲========^| ^|=========^|  ^|  ^|_ ^|
echo         ^| ^|╲ ╲    ╲  ___  ╱    ^| ^|╲ ╲     ^| ╲____╱ ^|    ╱  ╱__╲          ^| ^|  ╲ ╲       ^| ^|         ^|  ^|___^| ^|
echo         ^|_^| ╲_╲    ╲_____╱     ^|_^| ╲_╲     ╲______╱     ╲_____╱          ^|_^|   ╲_╲      ^|_^|          ╲_______╱
echo.
echo ________________________________________________________________________________________________________________________
echo Tên Nhân Vật: %playername%
echo                                                 ^<--------Stats--------^>
echo                                                ╱                       ╲
echo                                                         Lv↑(!playerlv!) 
echo.
echo                                                   Sử dụng kiếm !sword!
echo.
echo                                                       Tổng EXP (!playerexptotal!)
echo.
echo                                                    %esc%[38;5;1m[!attackturn!]%esc%[38;5;255m   %esc%[38;5;4m[DB]%esc%[38;5;255m   %esc%[38;5;106m[EB]%esc%[38;5;255m
echo.
echo                                                            ^|                                           ^| %esc%[38;5;214mGold: !gold!%esc%[38;5;255m
echo ________________________________________________________________________________________________________________________
echo                                         -.--------------------------------------.-
echo                                        .'%esc%[38;5;1mChúc Mừng Năm Mới%esc%[38;5;255m    %esc%[38;5;226mAn Khan Thịnh Vượng%esc%[38;5;255m'.
echo                                             .-------------------------------.
echo                                        .---'                                 '---.
echo /.------------------------------------'                                           '-----------------------------------.\
echo ========================================================================================================================
echo                     1 = Map       2 = Shop       3 = Khám Phá       4 = Inventory       5 = Options                     
echo ========================================================================================================================
echo .
timeout 1 /nobreak >nul
set /p answergameplay=:*
if !answergameplay! ==1 goto :loadmap
if !answergameplay! ==2 goto :shop
if !answergameplay! ==save goto :save
if !answergameplay! ==reset goto :reset
if !answergameplay! ==exit goto :exit
if !answergameplay! ==3 goto :nextwavei
if !answergameplay! ==4 goto :inventory
if !answergameplay! ==5 goto :options

:misspell
cls
echo Sai câu lệnh
timeout 2 > nul
cls
echo Đang quay trở lại
timeout 2 > nul
goto :gameplay

:loadmap
taskkill /f -im cscript.exe
:map
cd C:\K0kuSRPG\data\audio\map
start hidemusic.vbs
set wave2=?&set wave3=?&set wave4=?&set wave5=?&set wave6=?&set wave7=?&set wave8=?&set wave9=?&set wave10= ?
if !wavei! geq 2 set wave2=2&  if !wavei! geq 3 set wave3=3&  if !wavei! geq 4 set wave4=4&  if !wavei! geq 5 set wave5=5&  if !wavei! geq 6 set wave6=6&  if !wavei! geq 7 set wave7=7&  if !wavei! geq 8 set wave8=8&  if !wavei! geq 9 set wave9=9&  if !wavei! geq 10 set wave10=10
cls
echo.&echo.&echo.&echo.
echo                                        ____________________________________________
echo                                      _╱                                            ╲
echo                                     ╱                                               ╲
echo                                   _╱    [!wave3!]        [!wave4!]          [!wave5!]                  ╲_
echo                                 _╱           ______________________________    [!wave6!]     ╲_
echo                               _╱           _╱                              ╲             ╲
echo _____________________________╱           _╱                                 ╲             ╲ 
echo                                        _╱                                    ╲_    [!wave7!]     ╲
echo          [1]                  [!wave2!]    _╱                                        ╲            ╲__
echo                                    _╱                                           ╲_             ╲
echo __________________________________╱                                               ╲     [!wave8!]     ╲
echo                                                                                    ╲             ╲
echo                                                                                     ╲             ╲
echo                                                                                    _╱     [!wave9!]      ╲_
echo                                                                                  _╱                  ╲_
echo                                                                                _╱                      ╲_
echo                                                                              _╱                          ╲_
echo                                                                             ╱                              ╲
echo                                                                            ^|                                ^| 
echo                                                                            ^|                                ^|
echo                                                                            ^|                                ^|
echo                                                                            ^|               [!wave10!]             ^|
echo                                                                            ^|                                ^|
echo                                                                            ^|                                ^|
echo                                                                            ^|                                ^|
echo                                                                             ╲_                            _╱
echo                                                                               ╲_                         ╱______________
echo                                                                                 ╲_
echo                                                                                   ╲_____________________________________
set /p answermap=:*
if !answermap! ==1 goto :loadslime
if !answermap! ==2 goto :checkgoblin
if !answermap! ==3 goto :checkragegoblin
if !answermap! ==4 goto :checkbrutalgoblin
if !answermap! ==5 goto :checkgiantgoblin
if !answermap! ==6 goto :checkguardgoblin
if !answermap! ==7 goto :checkinfantrygoblin
if !answermap! ==8 goto :checkdarknessgoblin
if !answermap! ==9 goto :checkroyalgoblin
if !answermap! ==10 goto :checkkingofgoblin
if !answermap! ==back goto :save

pause 
goto :map
╱ ╲


:loadslime
set /p slimehealth= <C:\K0kuSRPG\data\mobs\slime\health.txt & set /p slimehealthdefault=<C:\K0kuSRPG\data\mobs\slime\healthdefault.txt & set /p slimelevel=<C:\K0kuSRPG\data\mobs\slime\level.txt
:killmonsterslime
cd C:/K0kuSRPG/data/mobs/slime
call slimegui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killslime
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkgoblin
if !wavei! geq 2 goto :loadgoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loadgoblin
set /p goblinhealth= <C:/K0kuSRPG/data/mobs/goblin/health.txt & set /p monstername= <C:/K0kuSRPG/data/mobs/goblin/name.txt & set /p goblinhealthdefault= <C:/K0kuSRPG/data/mobs/goblin/healthdefault.txt & set /p goblinlevel= <C:/K0kuSRPG/data/mobs/goblin/level.txt
:killmonstergoblin
cls
cd C:/K0kuSRPG/data/mobs/goblin
call goblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killgoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkragegoblin
if !wavei! geq 3 goto :loadragegoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loadragegoblin
set /p ragegoblinhealth= <C:/K0kuSRPG/data/mobs/ragegoblin/health.txt & set /p monstername= <C:/K0kuSRPG/data/mobs/ragegoblin/name.txt & set /p ragegoblinhealthdefault= <C:/K0kuSRPG/data/mobs/ragegoblin/healthdefault.txt & set /p ragegoblinlevel= <C:/K0kuSRPG/data/mobs/ragegoblin/level.txt
:killmonsterragegoblin
cd C:/K0kuSRPG/data/mobs/ragegoblin
call ragegoblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killragegoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkbrutalgoblin
if !wavei! geq 4 goto :loadbrutalgoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loadbrutalgoblin
set /p brutalgoblinhealth= <C:/K0kuSRPG/data/mobs/brutalgoblin/health.txt & set /p monstername= <C:/K0kuSRPG/data/mobs/brutalgoblin/name.txt & set /p brutalgoblinhealthdefault= <C:/K0kuSRPG/data/mobs/brutalgoblin/healthdefault.txt & set /p brutalgoblinlevel= <C:/K0kuSRPG/data/mobs/brutalgoblin/level.txt
:killmonsterbrutalgoblin
cd C:/K0kuSRPG/data/mobs/brutalgoblin
call brutalgoblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killbrutalgoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkgiantgoblin
if !wavei! geq 5 goto :loadgiantgoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loadgiantgoblin
set /p giantgoblinhealth= <C:/K0kuSRPG/data/mobs/giantgoblin/health.txt & set /p monstername= <C:/K0kuSRPG/data/mobs/giantgoblin/name.txt & set /p giantgoblinhealthdefault= <C:/K0kuSRPG/data/mobs/giantgoblin/healthdefault.txt & set /p giantgoblinlevel= <C:/K0kuSRPG/data/mobs/giantgoblin/level.txt
:killmonstergiantgoblin
cd C:/K0kuSRPG/data/mobs/giantgoblin
call giantgoblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killgiantgoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkguardgoblin
if !wavei! geq 6 goto :loadguardgoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loadguardgoblin
set /p guardgoblinhealth= <C:/K0kuSRPG/data/mobs/guardgoblin/health.txt & set /p monstername= <C:/K0kuSRPG/data/mobs/guardgoblin/name.txt & set /p guardgoblinhealthdefault= <C:/K0kuSRPG/data/mobs/guardgoblin/healthdefault.txt & set /p guardgoblinlevel= <C:/K0kuSRPG/data/mobs/guardgoblin/level.txt
:killmonsterguardgoblin
cd C:/K0kuSRPG/data/mobs/guardgoblin
call guardgoblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killguardgoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkinfantrygoblin
if !wavei! geq 7 goto :loadinfantrygoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loadinfantrygoblin
set /p infantrygoblinhealth= <C:/K0kuSRPG/data/mobs/infantrygoblin/health.txt & set /p monstername= <C:/K0kuSRPG/data/mobs/infantrygoblin/name.txt & set /p infantrygoblinhealthdefault= <C:/K0kuSRPG/data/mobs/infantrygoblin/healthdefault.txt & set /p infantrygoblinlevel= <C:/K0kuSRPG/data/mobs/infantrygoblin/level.txt
:killmonsterinfantrygoblin
cd C:/K0kuSRPG/data/mobs/infantrygoblin
call infantrygoblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killinfantrygoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkdarknessgoblin
if !wavei! geq 8 goto :loaddarknessgoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loaddarknessgoblin
set /p darknessgoblinhealth= <C:/K0kuSRPG/data/mobs/darknessgoblin/health.txt & set /p darknessgoblinname= <C:/K0kuSRPG/data/mobs/darknessgoblin/name.txt & set /p darknessgoblinhealthdefault= <C:/K0kuSRPG/data/mobs/darknessgoblin/healthdefault.txt & set /p darknessgoblinlevel= <C:/K0kuSRPG/data/mobs/darknessgoblin/level.txt
:killmonsterdarknessgoblin
cd C:/K0kuSRPG/data/mobs/darknessgoblin
call darknessgoblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killdarknessgoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkroyalgoblin
if !wavei! geq 9 goto :loadroyalgoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loadroyalgoblin
set /p royalgoblinhealth= <C:/K0kuSRPG/data/mobs/royalgoblin/health.txt & set /p monstername= <C:/K0kuSRPG/data/mobs/royalgoblin/name.txt & set /p royalgoblinhealthdefault= <C:/K0kuSRPG/data/mobs/royalgoblin/healthdefault.txt & set /p royalgoblinlevel= <C:/K0kuSRPG/data/mobs/royalgoblin/level.txt
:killmonsterroyalgoblin
cd C:/K0kuSRPG/data/mobs/royalgoblin
call royalgoblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killroyalgoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map


:checkkingofgoblin
if !wavei! geq 10 goto :loadkingofgoblin
echo "Bạn chưa khám phá nơi này"
pause >nul
goto :map
:loadkingofgoblin
set /p kingofgoblinhealth= <C:/K0kuSRPG/data/mobs/kingofgoblin/health.txt & set /p monstername= <C:/K0kuSRPG/data/mobs/kingofgoblin/name.txt & set /p kingofgoblinhealthdefault= <C:/K0kuSRPG/data/mobs/kingofgoblin/healthdefault.txt & set /p kingofgoblinlevel= <C:/K0kuSRPG/data/mobs/kingofgoblin/level.txt
:killmonsterkingofgoblin
cd C:/K0kuSRPG/data/mobs/kingofgoblin
call kingofgoblingui.bat
timeout 1 /nobreak >nul
set /p answerkillmonster=:*
if !answerkillmonster! ==1 goto :killkingofgoblin
if !answerkillmonster! ==back goto :map
pause>nul
goto :map

:misspell
cls
echo Sai câu lệnh
timeout 2 > nul
cls
echo Đang quay trở lại
timeout 2 > nul
goto :killmonster

:nextwavei
if !wavei! equ 1 if !slimekill! geq 50 (echo "Đã khám phá ra Wave 2") else (echo "Bạn cần giết 50 Slime để khám phá Wave 2")
if !wavei! equ 1 if !slimekill! geq 50 set wavei=2
if !wavei! equ 2 set wavei=2

if !wavei! equ 2 if !goblinkill! geq 50 (echo "Đã khám phá ra Wave 3") else (echo "Bạn cần giết 50 Goblin để khám phá Wave 3")
if !wavei! equ 2 if !goblinkill! geq 50 set wavei=3
if !wavei! equ 3 set wavei=3

if !wavei! equ 3 if !ragegoblinkill! geq 50 (echo "Đã khám phá ra Wave 4") else (echo "Bạn cần giết 50 Rage Goblin để khám phá Wave 4")
if !wavei! equ 3 if !ragegoblinkill! geq 50 set wavei=4
if !wavei! equ 4 set wavei=4

if !wavei! equ 4 if !brutalgoblinkill! geq 50 (echo "Đã khám phá ra Wave 5") else (echo "Bạn cần giết 50 Brutal Goblin để khám phá Wave 5")
if !wavei! equ 4 if !brutalgoblinkill! geq 50 set wavei=5
if !wavei! equ 5 set wavei=5

if !wavei! equ 5 if !giantgoblinkill! geq 50 (echo "Đã khám phá ra Wave 6") else (echo "Bạn cần giết 50 Giant Goblin để khám phá Wave 6")
if !wavei! equ 5 if !giantgoblinkill! geq 50 set wavei=6
if !wavei! equ 6 set wavei=6

if !wavei! equ 6 if !guardgoblinkill! geq 50 (echo "Đã khám phá ra Wave 7") else (echo "Bạn cần giết 50 Guard Goblin để khám phá Wave 7")
if !wavei! equ 6 if !guardgoblinkill! geq 50 set wavei=7
if !wavei! equ 7 set wavei=7

if !wavei! equ 7 if !infantrygoblinkill! geq 50 (echo "Đã khám phá ra Wave 8") else (echo "Bạn cần giết 50 Infantry Goblin để khám phá Wave 8")
if !wavei! equ 7 if !infantrygoblinkill! geq 50 set wavei=8
if !wavei! equ 8 set wavei=8

if !wavei! equ 8 if !darknessgoblinkill! geq 50 (echo "Đã khám phá ra Wave 9") else (echo "Bạn cần giết 50 Darkness Goblin để khám phá Wave 9")
if !wavei! equ 8 if !darknessgoblinkill! geq 50 set wavei=9
if !wavei! equ 9 set wavei=9

if !wavei! equ 9 if !royalgoblinkill! geq 50 (echo "Đã khám phá ra Wave 10 [Boss Wave]") else (echo "Bạn cần giết 50 Royal Goblin để khám phá Wave 10")
if !wavei! equ 9 if !royalgoblinkill! geq 50 set wavei=10
if !wavei! equ 10 set wavei=10
pause>nul
goto :save

:killslime
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a slimehealth= !slimehealth! - !sworddamage!

if !goblinhealth! leq 15 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !slimehealth! leq 0 (echo "Bạn vừa đánh bại Slime nhận 20xp và 25G")

if !slimehealth! leq 0 set /a gold=!gold! +25
if !slimehealth! leq 0 set /a playerexptotal=!playerexptotal! + 20
if !slimehealth! leq 0 set /a slimekill=!slimekill! +1
if !slimehealth! leq 0 set monsterkill=!slimekill!
if !slimehealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !slimehealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !slimehealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !slimehealth! leq 0 set /a slimehealth=15
set monsternow=killmonsterslime
pause >nul
goto :lvlup
goto :gameplay

:killgoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a goblinhealth=!goblinhealth!-!sworddamage!

if !goblinhealth! leq 35 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !goblinhealth! leq 0 (echo "Bạn vừa đánh bại Goblin nhận 30xp và 35G")

if !goblinhealth! leq 0 set /a gold=!gold! +35
if !goblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 30
if !goblinhealth! leq 0 set /a goblinkill=!goblinkill! +1
if !goblinhealth! leq 0 set monsterkill=!goblinkill!
if !goblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !goblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !goblinhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !goblinhealth! leq 0 set /a goblinhealth=35
set monsternow=killmonstergoblin
pause >nul
goto :lvlup
goto :gameplay

:killragegoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a ragegoblinhealth=!ragegoblinhealth!-!sworddamage!
if !ragegoblinhealth! leq 50 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !ragegoblinhealth! leq 0 (echo "Bạn vừa đánh bại Rage Goblin nhận 40xp và 60G")

if !ragegoblinhealth! leq 0 set /a gold=!gold! +60
if !ragegoblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 40
if !ragegoblinhealth! leq 0 set /a ragegoblinkill=!ragegoblinkill! +1
if !ragegoblinhealth! leq 0 set monsterkill=!ragegoblinkill!
if !ragegoblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !ragegoblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !ragegoblinhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !ragegoblinhealth! leq 0 set /a ragegoblinhealth=50
set monsternow=killmonsterragegoblin
pause >nul
goto :lvlup
goto :gameplay

:killbrutalgoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a brutalgoblinhealth=!brutalgoblinhealth!-!sworddamage!
if !brutalgoblinhealth! leq 95 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !brutalgoblinhealth! leq 0 (echo "Bạn vừa đánh bại Brutal Goblin nhận 65xp và 120G")

if !brutalgoblinhealth! leq 0 set /a gold=!gold! +120
if !brutalgoblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 65
if !brutalgoblinhealth! leq 0 set /a brutalgoblinkill=!brutalgoblinkill! +1
if !brutalgoblinhealth! leq 0 set monsterkill=!brutalgoblinkill!
if !brutalgoblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !brutalgoblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !brutalgoblinhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !brutalgoblinhealth! leq 0 set /a brutalgoblinhealth=95
set monsternow=killmonsterbrutalgoblin
pause >nul
goto :lvlup
goto :gameplay

:killgiantgoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a giantgoblinhealth=!giantgoblinhealth!-!sworddamage!
if !giantgoblinhealth! leq 200 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !giantgoblinhealth! leq 0 (echo "Bạn vừa đánh bại Giant Goblin nhận 100xp và 200G")

if !giantgoblinhealth! leq 0 set /a gold=!gold! +200
if !giantgoblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 100
if !giantgoblinhealth! leq 0 set /a giantgoblinkill=!giantgoblinkill! +1
if !giantgoblinhealth! leq 0 set monsterkill=!giantgoblinkill!
if !giantgoblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !giantgoblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !giantgoblinhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !giantgoblinhealth! leq 0 set /a giantgoblinhealth=200
set monsternow=killmonstergiantgoblin
pause >nul
goto :lvlup
goto :gameplay

:killguardgoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a guardgoblinhealth=!guardgoblinhealth!-!sworddamage!
if !guardgoblinhealth! leq 300 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !guardgoblinhealth! leq 0 (echo "Bạn vừa đánh bại Guard Goblin nhận 150xp và 250G")

if !guardgoblinhealth! leq 0 set /a gold=!gold! +250
if !guardgoblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 150
if !guardgoblinhealth! leq 0 set /a guardgoblinkill=!guardgoblinkill! +1
if !guardgoblinhealth! leq 0 set monsterkill=!guardgoblinkill!
if !guardgoblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !guardgoblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !guardgoblinrhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !guardgoblinhealth! leq 0 set /a guardgoblinhealth=300
set monsternow=killmonsterguardgoblin
pause >nul
goto :lvlup
goto :gameplay

:killinfantrygoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a infantrygoblinhealth=!infantrygoblinhealth!-!sworddamage!
if !infantrygoblinhealth! leq 450 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !infantrygoblinhealth! leq 0 (echo "Bạn vừa đánh bại Infantry Goblin nhận 200xp và 300G")

if !infantrygoblinhealth! leq 0 set /a gold=!gold! +300
if !infantrygoblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 200
if !infantrygoblinhealth! leq 0 set /a infantrygoblinkill=!infantrygoblinkill! +1
if !infantrygoblinhealth! leq 0 set monsterkill=!infantrygoblinkill!
if !infantrygoblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !infantrygoblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !infantrygoblinhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !infantrygoblinhealth! leq 0 set /a infantrygoblinhealth=450
set monsternow=killmonsterinfantrygoblin
pause >nul
goto :lvlup
goto :gameplay

:killdarknessgoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a darknessgoblinhealth=!darknessgoblinhealth!-!sworddamage!
if !darknessgoblinhealth! leq 600 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !darknessgoblinhealth! leq 0 (echo "Bạn vừa đánh bại Darkness Goblin nhận 300xp và 400G")

if !darknessgoblinhealth! leq 0 set /a gold=!gold! +400
if !darknessgoblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 300
if !darknessgoblinhealth! leq 0 set /a darknessgoblinkill=!darknessgoblinkill! +1
if !darknessgoblinhealth! leq 0 set monsterkill=!darknessgoblinkill!
if !darknessgoblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !darknessgoblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !darknessgoblinhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !darknessgoblinhealth! leq 0 set /a darknessgoblinhealth=600
set monsternow=killmonsterdarknessgoblin
pause >nul
goto :lvlup
goto :gameplay

:killroyalgoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a royalgoblinhealth=!royalgoblinhealth!-!sworddamage!
if !royalgoblinhealth! leq 900 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !royalgoblinhealth! leq 0 (echo "Bạn vừa đánh bại Royal Goblin nhận 500xp và 500G")

if !royalgoblinhealth! leq 0 set /a gold=!gold! +500
if !royalgoblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 500
if !royalgoblinhealth! leq 0 set /a royalgoblinkill=!royalgoblinkill! +1
if !royalgoblinhealth! leq 0 set monsterkill=!royalgoblinkill!
if !royalgoblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !royalgoblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !royalgoblinhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !royalgoblinhealth! leq 0 set /a royalgoblinhealth=900
set monsternow=killmonsterroyalgoblin
pause >nul
goto :lvlup
goto :gameplay

:killkingofgoblin
echo !sworddamage!>C:/K0kuSRPG/data/sworddamagenow.txt
if !attackturn! geq 1 set /a sworddamage=!sworddamage! + !attackpotionactive! & set /a attackturn=!attackturn!-1
set /a kingofgoblinhealth=!kingofgoblinhealth!-!sworddamage!
if !kingofgoblinhealth! leq 2000 (echo "Bạn vừa gây ra !sworddamage! sát thương")
set /p sworddamage= <C:/K0kuSRPG/data/sworddamagenow.txt
if !kingofgoblinhealth! leq 0 (echo "Bạn vừa đánh bại King Of Goblin nhận 999xp và 999G")

if !kingofgoblinhealth! leq 0 set /a gold=!gold! +999
if !kingofgoblinhealth! leq 0 set /a playerexptotal=!playerexptotal! + 999
if !kingofgoblinhealth! leq 0 set /a kingofgoblinkill=!kingofgoblinkill! +1
if !kingofgoblinhealth! leq 0 set monsterkill=!kingofgoblinkill!
if !kingofgoblinhealth! leq 0 set /a chestrarity=%random% %%10 +1 & if !chestrarity! ==5 set /a commonchestcount=!commonchestcount! +1 & if !chestrarity! ==5 (echo "Bạn nhận được 1 Common Chest")
if !kingofgoblinhealth! leq 0 set /a chestrarity=%random% %%22 +1 & if !chestrarity! ==11 set /a rarechestcount=!rarechestcount! +1 & if !chestrarity! ==11 (echo "Bạn nhận được 1 Rare Chest")
if !kingofgoblinhealth! leq 0 set /a chestrarity=%random% %%34 +1 & if !chestrarity! ==17 set /a epicchestcount=!epicchestcount! +1 & if !chestrarity! ==17 (echo "Bạn nhận được 1 Epic Chest")
if !kingofgoblinhealth! leq 0 set /a kingofgoblinhealth=2000
set monsternow=killmonsterkingofgoblin
pause >nul
goto :lvlup
goto :gameplay


:shop
MODE 120,38
╱ ╲
cls
echo %version%
echo                                                  ===================
echo                                                 --- Shop Thanh Lý ---
echo                                                  ===================
echo  %esc%[38;5;214mGold: !gold!%esc%[38;5;255m ^|
echo ________________________________________________________________________________________________________________________
echo                                         Damage             ^|                                        Damage             
echo                                        --------            ^|                                       --------            
echo    1.Kiếm %esc%[38;5;130m"Đồng"%esc%[38;5;255m [1000G]                 [12]              ^|   6.Kiếm %esc%[38;5;1m"Ruby"%esc%[38;5;255m [25000G]                [80]     !rubyunlock!
echo                                                            ^|
echo    2.Kiếm %esc%[38;5;244m"Bạc"%esc%[38;5;255m  [2000G]                 [18]     !silverunlock!   ^|   7.Kiếm %esc%[38;5;118m"Ngọc Bảo Bích"%esc%[38;5;255m [50000G]       [200]    !emeraldunlock!
echo                                                            ^|
echo    3.Kiếm %esc%[38;5;108m"Sắt"%esc%[38;5;255m  [3500G]                 [26]     !ironunlock!   ^|
echo                                                            ^|
echo    4.Kiếm %esc%[38;5;226m"Vàng"%esc%[38;5;255m [6000G]                 [32]     !goldunlock!   ^|
echo                                                            ^|
echo    5.Kiếm %esc%[38;5;87m"Kim Cương"%esc%[38;5;255m [15000G]           [50]     !diamondunlock!   ^|
echo                                                            ^|
echo ___________________________________________________________^|____________________________________________________________
echo :'. 
echo :  '..............................................................
echo : *Mặc định cây kiếm có lượng sát thương cao nhất sẽ được sử dụng '.
echo ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
echo.
set /p answershop=:*
if !answershop! ==1 goto :coppersword
if !answershop! ==2 goto :silversword
if !answershop! ==3 goto :ironsword
if !answershop! ==4 goto :goldsword
if !answershop! ==5 goto :diamondsword
if !answershop! ==6 goto :rubysword
if !answershop! ==7 goto :emeraldsword
if !answershop! ==back goto :save

:misspell
cls
echo Sai câu lệnh
timeout 2 > nul
cls
echo Đang quay trở lại
timeout 2 > nul
goto :shop

:coppersword
if !sword!==Thường if !gold! geq 1000 (echo "Bạn vừa mua cây kiếm %esc%[38;5;130m"Đồng"%esc%[38;5;255m -1000G") else (echo "Bạn không có đủ tiền")
if !sword!==Thường if !gold! geq 1000 set /a gold=!gold!-1000 & set /p sworddamage= <C:/K0kuSRPG/data/items/coppersword/damage.txt & set /p sword= <C:/K0kuSRPG/data/items/coppersword/name.txt & set swordunlock=1 & set silverunlock=Unlock
pause >nul
goto :shop

:silversword
if !swordunlock! lss 1 (echo "Vật Phẩm này đã bị khoá")
if !sword!==Đồng if !swordunlock! geq 1 goto :silvernext
pause>nul
goto :shop
:silvernext
if !gold! geq 2000 (echo "Bạn vừa mua cây kiếm %esc%[38;5;244m"Bạc"%esc%[38;5;255m -2000G") else (echo "Bạn không có đủ tiền")
if !gold! geq 2000 set /a gold=!gold!-2000 & set /p sworddamage= <C:/K0kuSRPG/data/items/silversword/damage.txt & set /p sword= <C:/K0kuSRPG/data/items/silversword/name.txt & set swordunlock=2 & set ironunlock=Unlock
pause >nul
goto :shop

:ironsword
if !swordunlock! lss 2 (echo "Vật Phẩm này đã bị khoá")
if !sword!==Bạc if !swordunlock! geq 2 goto :ironnext
pause>nul
goto :shop
:ironnext
if !gold! geq 3500 (echo "Bạn vừa mua cây kiếm %esc%[38;5;108m"Sắt"%esc%[38;5;255m -3500G") else (echo "Bạn không có đủ tiền")
if !gold! geq 3500 set /a gold=!gold!-3500 & set /p sworddamage= <C:/K0kuSRPG/data/items/ironsword/damage.txt & set /p sword= <C:/K0kuSRPG/data/items/ironsword/name.txt & set swordunlock=3 & set goldunlock=Unlock
pause >nul
goto :shop

:goldsword
if !swordunlock! lss 3 (echo "Vật Phẩm này đã bị khoá")
if !sword!==Sắt if !swordunlock! geq 3 goto :goldnext
pause>nul
goto :shop
:goldnext
if !gold! geq 6000 (echo "Bạn vừa mua cây kiếm %esc%[38;5;226m"Vàng"%esc%[38;5;255m -6000G") else (echo "Bạn không có đủ tiền")
if !gold! geq 6000 set /a gold=!gold!-6000 & set /p sworddamage= <C:/K0kuSRPG/data/items/goldsword/damage.txt & set /p sword= <C:/K0kuSRPG/data/items/goldsword/name.txt & set swordunlock=4 & set diamondunlock=Unlock
pause >nul
goto :shop

:diamondsword
if !swordunlock! lss 4 (echo "Vật Phẩm này đã bị khoá")
if !sword!==Vàng if !swordunlock! geq 4 goto :diamondnext
pause>nul
goto :shop
:diamondnext
if !gold! geq 15000 (echo "Bạn vừa mua cây kiếm %esc%[38;5;87m"Kim Cương"%esc%[38;5;255m -15000G") else (echo "Bạn không có đủ tiền")
if !gold! geq 15000 set /a gold=!gold!-15000 & set /p sworddamage= <C:/K0kuSRPG/data/items/diamondsword/damage.txt & set /p sword= <C:/K0kuSRPG/data/items/diamondsword/name.txt & set swordunlock=5 & set rubyunlock=Unlock
pause >nul
goto :shop

:rubysword
if !swordunlock! lss 5 (echo "Vật Phẩm này đã bị khoá")
if !swordunlock! geq 5 goto :rubynext
pause>nul
goto :shop
:rubynext
if !gold! geq 25000 (echo "Bạn vừa mua cây kiếm %esc%[38;5;1m"Ruby"%esc%[38;5;255m -25000G") else (echo "Bạn không có đủ tiền")
if !gold! geq 25000 set /a gold=!gold!-25000 & set /p sworddamage= <C:/K0kuSRPG/data/items/rubysword/damage.txt & set /p sword= <C:/K0kuSRPG/data/items/rubysword/name.txt & set swordunlock=6 & set emeraldunlock=Unlock
pause >nul
goto :shop

:emeraldsword
if !swordunlock! lss 6 (echo "Vật Phẩm này đã bị khoá")
if !sword!==Ruby if !swordunlock! geq 6 goto :emeraldnext
pause>nul
goto :shop
:emeraldnext
if !gold! geq 50000 (echo "Bạn vừa mua cây kiếm %esc%[38;5;118m"Ngọc Bảo Bích"%esc%[38;5;255m -50000G") else (echo "Bạn không có đủ tiền")
if !gold! geq 50000 set /a gold=!gold!-50000 & set /p sworddamage= <C:/K0kuSRPG/data/items/emeraldsword/damage.txt & set /p sword= <C:/K0kuSRPG/data/items/emeraldsword/name.txt & set swordunlock=7
pause >nul
goto :shop

:inventory
MODE 120,38
cls
echo             .---------------.
echo   .--------.'     Chest     '.-------
echo   :
echo   : 1. %esc%[38;5;250mCommon Chest%esc%[38;5;255m x!commonchestcount!
echo   :
echo   : 2. %esc%[38;5;14mRare Chest%esc%[38;5;255m x!rarechestcount!
echo   :
echo   : 3. %esc%[38;5;57mEpic Chest%esc%[38;5;255m x!epicchestcount!
echo   :
echo   '-----------------------------------
echo  --
echo  4. Attack Potion x!attackpotioncount!
echo  5. Defend Potion (Coming Soon)
echo  6. EXP Potion    (Coming Soon)
set /p answerinventory=:*
if !answerinventory! ==1 goto :commonchest
if !answerinventory! ==2 goto :rarechest
if !answerinventory! ==3 goto :epicchest
if !answerinventory! ==4 goto :attackpotion
if !answerinventory! ==back goto :save

:misspell
cls
echo Sai câu lệnh
timeout 2 > nul
cls
echo Đang quay trở lại
timeout 2 > nul
goto :inventory

:commonchest
if !commonchestcount! geq 1 goto :opencommonchest  else (echo "Bạn không còn Common Chest")
pause >nul
goto :inventory
:opencommonchest
set /a commonchestcount=!commonchestcount! -1
set /a potionrarity=%random% %%10 +1 & if !potionrarity! ==5 set /a attackpotioncount=!attackpotioncount! +1 & if !potionrarity! ==5 set attackpotion=x1 Attack Potion
echo "Bạn nhận được 100xp, 100G, !attackpotion!"
set attackpotion=x0
set /a gold=!gold! +100
set /a playerexptotal=!playerexptotal! + 100
pause>nul
goto :inventory

:rarechest
if !rarechestcount! geq 1 goto :openrarechest  else (echo "Bạn không còn Rare Chest")
pause >nul
goto :inventory
:openrarechest
set /a rarechestcount=!rarechestcount! -1
set /a potionrarity=%random% %%6 +1 & if !potionrarity! ==3 set /a attackpotioncount=!attackpotioncount! +1 & if !potionrarity! ==3 set attackpotion=x1 Attack Potion
echo "Bạn nhận được 500xp 500G, !attackpotion!"
set attackpotion=x0
set /a gold=!gold! +500
set /a playerexptotal=!playerexptotal! + 500
pause>nul
goto :inventory

:epicchest
if !epicchestcount! geq 1 goto :openepicchest  else (echo "Bạn không còn Epic Chest")
pause >nul
goto :inventory
:openepicchest
set /a epicchestcount=!epicchestcount! -1
set /a potionrarity=%random% %%2 +1 & if !potionrarity! ==1 set /a attackpotioncount=!attackpotioncount! +1 & if !potionrarity! ==1 set attackpotion=x1 Attack Potion
echo "Bạn nhận được 1000xp 1000G, !attackpotion!"
set attackpotion=x0
set /a gold=!gold! +1000
set /a playerexptotal=!playerexptotal! + 1000
pause>nul
goto :inventory

:attackpotion
if !attackpotioncount! geq 1 goto :useattackpotion else (echo "Bạn không còn Attack Potion")
pause >nul
goto :inventory
:useattackpotion
set /a attackpotioncount=!attackpotioncount! -1
echo "Bạn đã sử dụng Attack Potion +20 Sát Thương trong 10 lượt đánh"
set attackpotionactive= 20
set /a attackturn=!attackturn! +10
pause>nul
goto :inventory

:options
cls
echo  .-------Options-------.
echo  : 1. Đổi Tên Nhân Vật :
echo  : 2. Information      :
echo  :                     :
echo  :                     :
echo  :                     :
echo  '---------------------'
set /p optionanswer=:*
if !optionanswer! == 1 goto :changename
if !optionanswer! == 2 goto :info
if !optionanswer! ==back goto :save
pause>nul
goto :options

:misspell
cls
echo Sai câu lệnh
timeout 2 > nul
cls
echo Đang quay trở lại
timeout 2 > nul
goto :inventory

:changename
cd C:/K0kuSRPG/data/scripts
start changename.bat
cd ..
goto :options

:info
cls
cd C:/K0kuSRPG/data/scripts
start info.cmd
goto:gameplay


:exit
taskkill /f -im cscript.exe
exit


