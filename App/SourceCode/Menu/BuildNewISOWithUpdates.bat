@ECHO OFF&PUSHD %~DP0
CALL "%APP_HOME%\SourceCode\Common\Header\HeaderOfIndex.bat"
setLocal EnableDelayedExpansion
SET wim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\install.wim
CALL "%APP_HOME%\SourceCode\Common\Utils\SupportIamgeList.bat"
if defined %~1 GOTO %~1 else GOTO :ISOMenu
:ISOMenu
mode con:cols=94 lines=42
Color 0F
SET input=null
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" DisplayAppName
ECHO.
ECHO   �밴��ע����ִ������Ĳ���,��ѡ�Ŀ�����:
ECHO.
ECHO   1.  [��1��:�����������д���] ׼����װ���л���
ECHO. 
ECHO   2.  [ע��:2��3ֻ��2ѡ1]������Ӹ��µ�install.wim[����IE11]
ECHO.
ECHO   3.  [ע��:2��3ֻ��2ѡ1]������Ӹ��µ�install.wim[����IE8]
ECHO.
ECHO   4.  [��ѡ]��� ΢��.NET Framework v4.7 ��ʽ�汾
ECHO.            
ECHO   5.  [��ѡ]��� ΢�� DirectX9.0c ���հ�
ECHO.            
ECHO   6.  [��ѡ]��� Microsoft Visual C++[2005-2017]���п�
ECHO.            
ECHO   7.  [�Ƽ�]ͬʱ ��� 4��5��6 [�������4,5,6,����ѡ�����]
ECHO.            
ECHO   8.  [�Ƽ�]��� ������������ [Win7ԭ�澵���Դ�����������ȫ������ӿ����޷�����] 
ECHO.
ECHO   9.  [��ѡ]��� USB3 ����[����USB3�ӿ�,������Ӵ��� ,����װ����ܻ�����]
ECHO.
ECHO.  10. [��ѡ]��� NVMe ����[����M.2�ӿڹ�̬Ӳ��,������Ӵ���]
ECHO.
ECHO   11. [�Ƽ�]Ϊ�����������ֵ�ذ�װ����,ͬʱ����ʵ���ע����Ż�[��Administrator��¼,��α�Ż�]
ECHO.
ECHO   12. [��ѡ]����ٷ����²�����Ryzen��7�������������ʹ��Win7������[��Ryzen��7�����,����ѡ]
ECHO.
ECHO   13. [���ִ�д���]Ϊ������ȫ�µ�֧��BIOS��UEFI˫ģʽ������ISO
ECHO.
ECHO   14. �ҵĲ���       15.  Github����ҳ��         00. ����֧��              0. ������ҳ
ECHO.
ECHO.
SET /p input=*  ��������Ҫѡ�������:
if "%input%"=="0" (CALL "%APP_HOME%\SourceCode\Menu\Home.bat")
if "%input%"=="00" (
    START /B %APP_HOME%\Packs\RewardMe\RewardMe.png
    rem START http://t.cn/RStk2bP
    GOTO ISOMenu
)
if "%input%"=="1" (GOTO :PREPARE)
if "%input%"=="2" (CALL :InstallUpdateToWIMWith IE11)
if "%input%"=="3" (CALL :InstallUpdateToWIMWith IE8Update)
if "%input%"=="4" (CALL :AddToInstall NetFX47)
if "%input%"=="5" (CALL :AddToInstall DirectX9c)
if "%input%"=="6" (CALL :AddToInstall RuntimePack)
if "%input%"=="7" (CALL :AddPacksToInstall)
if "%input%"=="8" (CALL :AddingNetworkDriverToISO)
if "%input%"=="9" (CALL :AddSupport USB3)
if "%input%"=="10" (CALL :AddSupport NVMe)
if "%input%"=="11" (CALL :AddUnattendToWIM Admin)
if "%input%"=="12" (GOTO :AddNewCPUSupportPatch)
if "%input%"=="13" (GOTO :CreateISO)
if "%input%"=="di" (GOTO :AutoDiscard)
if "%input%"=="slim" (CALL :AddSupport slim)
if "%input%"=="re" (GOTO :RebuildCurrentInstallWIM)
if "%input%"=="info" (GOTO :GetCurrentImageInfo)
if "%input%"=="os" (GOTO :OneStep)
if "%input%"=="swi" (GOTO :SetWimInfoUser)
if "%input%"=="14" (START http://t.cn/RStk2bP)
if "%input%"=="15" (START http://t.cn/Ro0s9FK)
if %input% GTR 15 (
    ECHO.
    ECHO ������һ����Ч������
)
ECHO.
PAUSE
cls
GOTO ISOMenu
GOTO :EOF
::===================================================================================================================
::OneStep  
::===================================================================================================================
:OneStep
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" KillRelatedProcess
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
ECHO.
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\install.wim
ECHO OneStep UpdateALL START
CALL :AddSupport UpdateALL
ECHO OneStep UpdateALL END
ECHO Win7SP1 3in1 full.wim �������
GOTO :EOF
::===================================================================================================================
::1.  [��1��:�����������д���] ׼����װ���л���
::===================================================================================================================
:PREPARE
CALL :DoPrepare
CALL :SucessPause ������Ӹ��µĹ��������Ѿ�׼������.
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:DoPrepare
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" KillRelatedProcess
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
ECHO.
ECHO ��ʾ:�������ʵ���������,Aֻ��һ������.ע�ⲻҪ����Ŀ¼��·��,�����Ƿ����̷��ĸ�·��.
ECHO.
ECHO ֻ�������̷�����ĸ����,��Ҫ����":" , "\"����������,��������޷���ȷ���С�
GOTO :InputWorkHome

::-------------------------------------------------------------------------------------------------------------------

:InputWorkHome
rem �ȴ��û�����
SET WORK_HOME=
ECHO.
SET /p WORK_HOME=����һ��ʣ��ռ����30G�ķ����̷�,������ð��.^(���� D ^>

rem ȥ������ֵǰ��Ŀո�
:Trim
FOR /F "tokens=* delims= " %%a in ("!WORK_HOME!") do SET WORK_HOME=%%a
for /l %%a in (1,1,100) do if "!WORK_HOME:~-1!"==" " SET WORK_HOME=!WORK_HOME:~0,-1!
GOTO :CheckWhetherInputIsEmpty

rem ���������̷��Ƿ�Ϊ��
:CheckWhetherInputIsEmpty
IF "!WORK_HOME!" EQU "" (
    ECHO.
    ECHO ����û�������̷�,����������.
    GOTO :InputWorkHome
) ELSE (
    ECHO.
    rem �����Ϊ��,��ȥУ��������̷��Ƿ����
    GOTO :CheckInputLetter
)
GOTO :EOF

rem ��������̷�ת�ɴ�д��ĸ
:toUpperCase
FOR /F "usebackq delims=" %%I in (`powershell "\"%1\".toUpper()"`) do SET "WORK_HOME=%%~I"
GOTO :EOF

:CheckInputLetter
CALL :toUpperCase "!WORK_HOME!"

rem fsutil fsinfo drives ������Ի�õ�ǰ���ԵĴ��ڵ��̷�
FOR /F "tokens=1,* delims= " %%a in ('fsutil fsinfo drives') DO (
    for %%c in (%%~b) DO (
        SET Drive=%%c
        SET Drive=!Drive:~0,-2!
        rem ѭ���ж�,�����ֵ,�뵱ǰ���Դ��ڵ��̷��Ƿ���ƥ���
        if "!Drive!"=="!WORK_HOME!" (
            rem ���������ƥ�����,����ִ��ʣ��ռ�ļ��
            rem ͬʱ�� FLAG��־����Ϊ1
            SET /A FLAG=1
            CALL :CheckFreeSpace !WORK_HOME!
            GOTO :EOF
        )
        rem ���������̷�һֱ�޷��ڵ�ǰ���Դ��ڵ��̷�ƥ��,��ֵFLAG���ֵΪ0
        if "!Drive!" NEQ "!WORK_HOME!" SET /A FLAG=0
	)
)

rem ͨ�������ѭ�����,���FLAGֵ����1,˵��������̷�������
IF "!FLAG!" NEQ "1" (
    ECHO.
    ECHO ������ķ���������,����������.
    ECHO.    
    GOTO :InputWorkHome
) ELSE (
    CALL :CheckFreeSpace !WORK_HOME!
)
SET /A FLAG=0
SET WORK_HOME=
GOTO :EOF

rem ��������̷���Ӧ������ʣ��ռ�
:CheckFreeSpace
FOR /F "usebackq delims== tokens=2" %%v IN (`wmic logicaldisk where "DeviceID='%1:'" get FreeSpace /format:value`) DO SET "FreeSpace=%%v"
FOR /F "usebackq delims=" %%v IN (`powershell -noprofile "& {[math]::truncate(%FreeSpace%/ 1GB)}"`) DO SET /A "FreeSpace=%%v"
if %FreeSpace% lss 30 (
    ECHO.    
    ECHO ʣ��ռ� С�� 30GB,������һ��ʣ��ռ����30GB�ķ����̷�
    GOTO :InputWorkHome
) else (
    GOTO :SetWorkHome
)
GOTO :EOF

:SetWorkHome
CALL "!APP_HOME!\SourceCode\Common\Utils\SetPathNow.bat" WORK_HOME
IF NOT EXIST !WORK_HOME!:\UPDATE_HOME\ MD !WORK_HOME!:\UPDATE_HOME\
IF NOT EXIST !WORK_HOME!:\UPDATE_HOME\ISO\ MD !WORK_HOME!:\UPDATE_HOME\ISO\
IF NOT EXIST !WORK_HOME!:\UPDATE_HOME\NEW_ISO\ MD !WORK_HOME!:\UPDATE_HOME\NEW_ISO\
IF NOT EXIST !WORK_HOME!:\UPDATE_HOME\INSTALL_MOUNT\ MD !WORK_HOME!:\UPDATE_HOME\INSTALL_MOUNT\
IF NOT EXIST !WORK_HOME!:\UPDATE_HOME\BOOT_MOUNT\ MD !WORK_HOME!:\UPDATE_HOME\BOOT_MOUNT\
IF NOT EXIST !WORK_HOME!:\UPDATE_HOME\Temp\ MD !WORK_HOME!:\UPDATE_HOME\Temp\
SET WimMountDir=!WORK_HOME!:\UPDATE_HOME\INSTALL_MOUNT
CALL "!APP_HOME!\SourceCode\Common\Utils\SetPathNow.bat" WimMountDir
GOTO :DoPrepareEnd

:DoPrepareEnd
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
GOTO :CheckAndExtractImage

:CheckAndExtractImage
CALL "%APP_HOME%\SourceCode\Common\Utils\CheckAndExtractImage.bat"
GOTO :ISOMenu
::===================================================================================================================
:CheckWhetherWorkHomeIsEmpty
if "%WORK_HOME%"=="" (
    mode con:cols=94 lines=42
    ECHO.
    ECHO �������� [��1��:�����������д���] ׼����װ���л���
    ECHO.
    pause
    CALL :DoPrepare
    GOTO :EOF
)
GOTO :EOF
::===================================================================================================================
::2.  [ע��:2��3ֻ��2ѡ1]������Ӹ��µ�install.wim[����IE11]
::3.  [ע��:2��3ֻ��2ѡ1]������Ӹ��µ�install.wim[����IE8]
::===================================================================================================================
:InstallUpdateToWIMWith
CALL :DoInstallUpdateToWIMWith %~1
CALL :SucessPause �ɹ���...
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:DoInstallUpdateToWIMWith
mode con:cols=105 lines=42
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" KillRelatedProcess
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
CALL :CheckWhetherWorkHomeIsEmpty
CALL :AutoStartMount
CALL :InstallUpdateToWIM
CALL :Install%~1
CALL :InstallRollupFix
CALL :AddNecessarySetupScripts
CALL :DoCleanup
CALL :CommitWIM
CALL :RebuildWimCurrentIndex install
GOTO :EOF
::===================================================================================================================
::4.  [��ѡ]��Install.wim ����� ΢��.NET Framework v4.7 ��ʽ�汾
::5.  [��ѡ]��Install.wim ����� ΢�� DirectX9.0c ���հ�
::6.  [��ѡ]��Install.wim ����� Microsoft Visual C++[2005-2017]���п�
::===================================================================================================================
:AddToInstall
cls
CALL :CheckWhetherWorkHomeIsEmpty
SET WimMountDir=!WORK_HOME!:\UPDATE_HOME\INSTALL_MOUNT
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\Install.wim
FOR /F "tokens=2 delims=: " %%a in ('!DISM! /Get-WimInfo /WimFile:!InstallWim! ^| find /i "Index"') DO (
    SET WimIndexNo=%%~a
    for /d %%b in (!WimIndexNo!) DO (IF NOT EXIST "!WimMountDir!\%%b" MD "!WimMountDir!\%%b")&&(!DISM! /mount-wim /wimfile:"%InstallWim%" /index:%%b /mountdir:"!WimMountDir!\%%b")
    CALL :AddPack %~1
    for /d %%c in (!WimIndexNo!) DO (!DISM! /unmount-wim /mountdir:"!WimMountDir!\%%c" /commit /checkintegrity)
    for /d %%c in (!WimIndexNo!) DO (rd /s /q "!WimMountDir!\%%c")
)
CALL :RebuildWim install
CALL :SucessPause ��ӳɹ���
GOTO :EOF
::===================================================================================================================
::7.  [��ѡ]��Install.wim��ͬʱ�������� 4��5��6
::===================================================================================================================
:AddPacksToInstall
cls
CALL :CheckWhetherWorkHomeIsEmpty
SET WimMountDir=!WORK_HOME!:\UPDATE_HOME\INSTALL_MOUNT
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\Install.wim
FOR /F "tokens=2 delims=: " %%a in ('!DISM! /Get-WimInfo /WimFile:!InstallWim! ^| find /i "Index"') DO (
    SET WimIndexNo=%%~a
    for /d %%b in (!WimIndexNo!) DO (IF NOT EXIST "!WimMountDir!\%%b" MD "!WimMountDir!\%%b")&&(!DISM! /mount-wim /wimfile:"%InstallWim%" /index:%%b /mountdir:"!WimMountDir!\%%b")
    CALL :AddPack NetFX47
    CALL :AddPack RuntimePack
    CALL :AddPack DirectX9c
    for /d %%c in (!WimIndexNo!) DO (!DISM! /unmount-wim /mountdir:"!WimMountDir!\%%c" /commit /checkintegrity)
    for /d %%c in (!WimIndexNo!) DO (rd /s /q "!WimMountDir!\%%c")
)
CALL :RebuildWim install
CALL :SucessPause ��ӳɹ���
GOTO :EOF
::===================================================================================================================
::8.  [��ѡ]��ISO����� ������������[�Ƽ�����] 
::===================================================================================================================
:AddingNetworkDriverToISO
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
CALL :CheckWhetherWorkHomeIsEmpty
(IF NOT EXIST "!WORK_HOME!:\UPDATE_HOME\ISO\sources\$OEM$\$1\drv" MD "!WORK_HOME!:\UPDATE_HOME\ISO\sources\$OEM$\$1\drv")&&(XCOPY "%APP_HOME%\Packs\Drivers\drv\*.*" "!WORK_HOME!:\UPDATE_HOME\ISO\sources\$OEM$\$1\drv\" /y /s /e /h /q  >NUL 2>&1)
CALL :SucessPause �����������������ɹ���
GOTO :EOF
::===================================================================================================================
::9.  [��ѡ]���� USB3 ����[�þ���֧��ԭ���޷���װWIN7��������]
::10. [��ѡ]���� NVMe ����[����NVMe��̬Ӳ��,ѡ������Ƕ����]
::===================================================================================================================
:AddSupport
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER

if "%~1"=="USB3" CALL :AddingSupport %~1 boot
if "%~1"=="NVMe" CALL :AddingSupport %~1 boot

CALL :AddingSupport %~1 install
if "%~1"=="slim" (
    ECHO.
    ECHO ����ɹ�. . .
    ECHO.
) else (
    ECHO �ɹ����%~1֧��. . .
)
CALL :SucessPause
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:AddingSupport
CALL :CheckWhetherWorkHomeIsEmpty
SET WimMountDir=!WORK_HOME!:\UPDATE_HOME\%~2_MOUNT
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\%~2.wim
SET DRIVERHOME=!APP_HOME!\Packs\Drivers\%~1\!OS_ARCHITECTURE!
if "%~1" NEQ "slim" (
    ECHO ����Ϊ%~2.wim���%~1֧��. . .
    ECHO.
)
if "%~1"=="NVMe" (
    XCOPY "%APP_HOME%\Packs\ISOPrepare\NVMe\*.*"  "!WORK_HOME!:\UPDATE_HOME\ISO\" /y /e /h /q>NUL 2>&1
)
FOR /F "tokens=2 delims=: " %%a in ('!DISM! /Get-WimInfo /WimFile:!InstallWim! ^| find /i "Index"') DO (
    SET WimIndexNo=%%~a
    for /d %%b in (!WimIndexNo!) DO (IF NOT EXIST "!WimMountDir!\%%b" MD "!WimMountDir!\%%b")&&(!DISM! /mount-wim /wimfile:"%InstallWim%" /index:%%b /mountdir:"!WimMountDir!\%%b")
    if "%~1"=="UpdateALL" (
        if "%~2"=="install" (
            mode con:cols=105 lines=42
            CALL :InstallUpdateToWIM
            CALL :InstallIE11
            CALL :InstallRollupFix
            CALL :AddPack NetFX47
            CALL :AddPack RuntimePack
            CALL :AddPack DirectX9c
            CALL :AddNecessarySetupScripts
            CALL :DoCleanup
        )
    ) else (
        if "%~1"=="slim" (
            ECHO ����Ϊ%~2.wim�����������. . .
            CALL :AddPack NetFX47
            CALL :AddPack RuntimePack
            CALL :AddPack DirectX9c
            CALL :DoCleanup
            ECHO �ɹ����� !InstallWim! ������!WimIndexNo!�е�ӳ��. . .
        ) else (
            for /d %%c in (!WimIndexNo!) DO (
                !DISM! /image:"!WimMountDir!\%%c" /add-driver /driver:"!DRIVERHOME!" /forceunsigned /Recurse >NUL 2>&1
                ECHO.
                ECHO �ɹ����%~1������ !InstallWim!��ӳ������!WimIndexNo!��. . .
                ECHO.
            )
            if "%~1"=="NVMe" (
                for /d %%c in (!WimIndexNo!) DO (!DISM! /Image:"!WimMountDir!\%%c" /add-package /packagepath:"!APP_HOME!\Updates\NVMe\Windows6.1-KB2990941-v3-!OS_ARCHITECTURE!.cab" /NoRestart) >NUL 2>&1
                for /d %%c in (!WimIndexNo!) DO (!DISM! /Image:"!WimMountDir!\%%c" /add-package /packagepath:"!APP_HOME!\Updates\NVMe\Windows6.1-KB3087873-v2-!OS_ARCHITECTURE!.cab" /NoRestart) >NUL 2>&1
                ECHO.                    
                ECHO �ɹ����%~1������ !InstallWim!��ӳ������!WimIndexNo!��. . .
                ECHO.
            )     
        )
    )
    mode con:cols=94 lines=42
    for /d %%c in (!WimIndexNo!) DO (
        !DISM! /unmount-wim /mountdir:"!WimMountDir!\%%c" /commit /checkintegrity
        ECHO.
    )
    for /d %%c in (!WimIndexNo!) DO (rd /s /q "!WimMountDir!\%%c")
)
CALL :RebuildWim %~2
GOTO :EOF
::===================================================================================================================
:FIX
SET "SetupCompleteFile=%APP_HOME%\SourceCode\Configuration\SetupConfig\Common\Windows\Setup\Scripts\SetupComplete.cmd"
rem IF EXIST "!WimMountDir!\!WimIndexNo!\Windows\Setup\Scripts\Tweaks.reg" 
XCOPY "%SetupCompleteFile%"  "!WimMountDir!\!WimIndexNo!\Windows\Setup\Scripts\" /y /s /e /h /q
rem CALL :AddNecessarySetupScripts
GOTO :EOF
::===================================================================================================================
:AddSetupConfig
CALL :AddSomeOEMCertificates
XCOPY "%APP_HOME%\SourceCode\Configuration\SetupConfig\Common\*.*" "!WimMountDir!\!WimIndexNo!\" /y /s /e /h /q
IF NOT EXIST "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Updates\" MD "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Updates"
XCOPY "%APP_HOME%\Updates\ServicingStack\*.*" "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Updates\" /y /s /e /h /q
XCOPY "%APP_HOME%\Updates\KB976932\*.*" "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Updates\" /y /s /e /h /q
::CALL :AddingUnattendToWIM admin
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:AddFlashPlayer
IF NOT EXIST "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Apps\" MD "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Apps"
XCOPY "%APP_HOME%\Packs\FlashPlayer\*.*" "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Apps\" /y /s /e /h /q >NUL 2>&1
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:AddUserUattend
IF EXIST "!WimMountDir!\!WimIndexNo!\Windows\Ultimate.xml" (
    XCOPY "!APP_HOME!\SourceCode\Configuration\Panther\!OS_ARCHITECTURE!\User\Ultimate\*.*" "!WimMountDir!\!WimIndexNo!\Windows\" /y /s /e /h >NUL 2>&1
) else (
    XCOPY "!APP_HOME!\SourceCode\Configuration\Panther\!OS_ARCHITECTURE!\User\NotUltimate\*.*" "!WimMountDir!\!WimIndexNo!\Windows\" /y /s /e /h >NUL 2>&1
)
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:AddThemePatch
XCOPY "%APP_HOME%\Packs\ThemePatch\!OS_ARCHITECTURE!\*.*" "!WimMountDir!\!WimIndexNo!\Windows\System32\" /y /s /e /h /q >NUL 2>&1
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:AddSomeOEMCertificates
XCOPY "%APP_HOME%\Packs\OEM" "!WimMountDir!\!WimIndexNo!\Windows\System32\OEM\" /y /s /e /h /q >NUL 2>&1
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:AddNecessarySetupScripts
IF NOT EXIST "!WimMountDir!\!WimIndexNo!\Windows\Setup\Scripts" MD "!WimMountDir!\!WimIndexNo!\Windows\Setup\Scripts" >NUL 2>&1
XCOPY "%APP_HOME%\SourceCode\Configuration\SetupConfig\Common\Windows\Setup\Scripts\SetupComplete.cmd" "!WimMountDir!\!WimIndexNo!\Windows\Setup\Scripts" /y /s /e /h /q >NUL 2>&1
XCOPY "%APP_HOME%\SourceCode\Configuration\SetupConfig\Common\Windows\System32\FirstLogon.bat" "!WimMountDir!\!WimIndexNo!\Windows\System32\" /y /s /e /h /q >NUL 2>&1
XCOPY "%APP_HOME%\SourceCode\Configuration\SetupConfig\Common\Windows\System32\drivers\etc\hosts" "!WimMountDir!\!WimIndexNo!\Windows\System32\drivers\etc\" /y /s /e /h /q >NUL 2>&1
IF NOT EXIST "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Updates\" MD "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Updates" >NUL 2>&1
XCOPY "%APP_HOME%\Updates\ServicingStack\*.*" "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Updates\" /y /s /e /h /q >NUL 2>&1
XCOPY "%APP_HOME%\Updates\KB976932\*.*" "!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Updates\" /y /s /e /h /q >NUL 2>&1
CALL :AddUserUattend >NUL 2>&1
GOTO :EOF
::===================================================================================================================
::11. [��ѡ]Ϊ�����������ֵ�ذ�װ����[ʹ��Admin�û���¼]
::===================================================================================================================
:AddUnattendToWIM
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
CALL :CheckWhetherWorkHomeIsEmpty
SET WimMountDir=!WORK_HOME!:\UPDATE_HOME\INSTALL_MOUNT
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\Install.wim
FOR /F "tokens=2 delims=: " %%a in ('!DISM! /Get-WimInfo /WimFile:!InstallWim! ^| find /i "Index"') DO (
    SET WimIndexNo=%%~a
    for /d %%b in (!WimIndexNo!) DO (IF NOT EXIST "!WimMountDir!\%%b" MD "!WimMountDir!\%%b")&&(!DISM! /mount-wim /wimfile:"%InstallWim%" /index:%%b /mountdir:"!WimMountDir!\%%b")
    CALL :AddSetupConfig >NUL 2>&1
    CALL :AddingUnattendToWIM %~1
    for /d %%c in (!WimIndexNo!) DO (!DISM! /unmount-wim /mountdir:"!WimMountDir!\%%c" /commit /checkintegrity)
    for /d %%c in (!WimIndexNo!) DO (rd /s /q "!WimMountDir!\%%c")
)
CALL :RebuildWim install
CALL :SucessPause ��ӳɹ���
GOTO :EOF
::------------------------------------------------------------------------------------------------------------------
:AddingUnattendToWIM
for /d %%a in (!WimIndexNo!) DO (
    IF EXIST "!WimMountDir!\%%a\Windows\Ultimate.xml" (
        SET "COPYFROM=!APP_HOME!\SourceCode\Configuration\Panther\!OS_ARCHITECTURE!\%~1\Ultimate\*.*"
        SET "COPYTO=!WimMountDir!\%%a\Windows"
        XCOPY  !COPYFROM! !COPYTO! /y /s /e /h /q >NUL 2>&1
    ) else (
        SET "COPYFROM=!APP_HOME!\SourceCode\Configuration\Panther\!OS_ARCHITECTURE!\%~1\NotUltimate\*.*"
        SET "COPYTO=!WimMountDir!\%%a\Windows"
        XCOPY  !COPYFROM! !COPYTO! /y /s /e /h /q >NUL 2>&1
    )
)
ECHO.
ECHO �ɹ�Ϊ�����������ֵ�ذ�װ���� ...
GOTO :EOF
::===================================================================================================================
::12.[��ѡ]����ٷ����²�����Ryzen��7�������������ʹ��Win7������[��Ryzen��7�����,���Ƽ�]
::===================================================================================================================
:AddNewCPUSupportPatch
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
CALL :CheckWhetherWorkHomeIsEmpty
SET WimMountDir=!WORK_HOME!:\UPDATE_HOME\INSTALL_MOUNT
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\Install.wim
FOR /F "tokens=2 delims=: " %%a in ('!DISM! /Get-WimInfo /WimFile:!InstallWim! ^| find /i "Index"') DO (
    SET WimIndexNo=%%~a
    for /d %%b in (!WimIndexNo!) DO (IF NOT EXIST "!WimMountDir!\%%b" MD "!WimMountDir!\%%b")&&(!DISM! /mount-wim /wimfile:"%InstallWim%" /index:%%b /mountdir:"!WimMountDir!\%%b")
    CALL :AddingNewCPUSupportPatch
    for /d %%c in (!WimIndexNo!) DO (!DISM! /unmount-wim /mountdir:"!WimMountDir!\%%c" /commit /checkintegrity)
    for /d %%c in (!WimIndexNo!) DO (rd /s /q "!WimMountDir!\%%c")
)
CALL :RebuildWim install
CALL :SucessPause �ɹ�����ٷ����²�����Ryzen��7�������������ʹ��Win7������ ...
GOTO :EOF
::-------------------------------------------------------------------------------------------------------------------
:AddingNewCPUSupportPatch
XCOPY "%APP_HOME%\Packs\NewCPUSupportPatch\!OS_ARCHITECTURE!\*.*" "!WimMountDir!\!WimIndexNo!\Windows\System32\" /y /s /e /h /q >NUL 2>&1
XCOPY "%APP_HOME%\Packs\NewCPUSupportPatch\install_wufuc.bat" "!WimMountDir!\!WimIndexNo!\Windows\System32\" /y /s /e /h /q >NUL 2>&1
GOTO :EOF
::===================================================================================================================
::13. [���ִ�д���]Ϊ������ȫ�µ�ISO
::===================================================================================================================
:CreateISO
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
CALL :CheckWhetherWorkHomeIsEmpty
ECHO.
ECHO ���������µ�֧��BIOS��UEFI˫������ISO����. . .
CALL "!APP_HOME!\SourceCode\Common\Utils\ISOPrepare.bat" >NUL 2>&1
CALL :TimeUtil
CALL :NameUtil
SET "ISOCreateTime=%MM%/%dd%/%yyyy%,%HH%:%Min%:%Sec%"
SET "ISONameTimeStamp=%yyyy%%MM%%dd%%HH%%Min%"
SET ISOFinalName=Win7SP1!OS_ARCHITECTURE!!ISONAME!WithUpdate!ISONameTimeStamp!.iso
!oscdimg! -bootdata:2#p0,e,b!etfsboot!#pEF,e,b!efisys! -o -u2 -udfver102 -lWIN7SP1_CN_DVD_%yyyy%%MM% -t!ISOCreateTime! !WORK_HOME!:\UPDATE_HOME\ISO !WORK_HOME!:\UPDATE_HOME\NEW_ISO\!ISOFinalName!
cls
ECHO.
ECHO �ɹ������µ�֧��BIOS��UEFI˫������ISO����. . .
ECHO.
ECHO �����ɵ�ISO�����ļ�λ��!WORK_HOME!:\UPDATE_HOME\NEW_ISO\!ISOFinalName!
ECHO.
ECHO ǿ�ҽ�����������а�װ����һ�������ɵ�ISO������û����������ʵ���ϰ�װ��
ECHO.
ECHO ������һ�����޷���װ����������˷������౦���ʱ�䡣
ECHO.
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
ECHO �� "�����" ���´�����ISO���ڵ�Ŀ¼
PAUSE >nul
START/max "" explorer.exe /n,"!WORK_HOME!:\UPDATE_HOME\NEW_ISO\"
GOTO :ISOMenu
GOTO :EOF
cls
::===================================================================================================================
:InstallUpdateToWIM
cls
ECHO  ============================================================================================
ECHO.
ECHO          ������Ӹ��µ��ѹ��ص�!WimMountDir!\!WimIndexNo!��ϵͳӳ����,���Ժ� ...
ECHO.
ECHO  ============================================================================================
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" CleanTemp
SET "TipUpdate=���ڻ��� !OS_ARCHITECTURE! ��ϵͳ�� Windows 7 ���³���"
SET "TipNet351=���� Windows 7 SP1 !OS_ARCHITECTURE! �ϵ� Microsoft .NET Framework 3.5.1 �İ�ȫ���³���"
SET "TipSecurityUpdate=���ڻ��� !OS_ARCHITECTURE! ��ϵͳ�� Windows 7 ��ȫ���³���"
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\CAB\OptionalUpdate "!TipUpdate!"
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\CAB\NET351 "!TipNet351!"
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\CAB\Updates1st "!TipUpdate!"
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\CAB\SecurityUpdate "!TipSecurityUpdate!"
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\CAB\Updates2nd "!TipUpdate!"
CALL :InstallExclusive%OS_ARCHITECTURE%
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" CleanTemp
GOTO :EOF
::===================================================================================================================
:InstallIE11
ECHO ������� IE11
SET "IE11_HOME=!APP_HOME!\Updates\IE\IE11"
for /d %%a in (!WimIndexNo!) do !DISM! /Image:"!WimMountDir!\%%a" /add-package /PackagePath:!IE11_HOME!\temp\IE11-neutral.Downloaded.cab /NoRestart /Quiet
for /d %%a in (!WimIndexNo!) do !DISM! /Image:"!WimMountDir!\%%a" /add-package /PackagePath:!IE11_HOME!\temp\IE11_%PROCESSOR_ARCHITECTURE%_zh-CN.cab /NoRestart /Quiet
for /d %%a in (!WimIndexNo!) do !DISM! /Image:"!WimMountDir!\%%a" /add-package /PackagePath:!IE11_HOME!\temp\Spelling_en\Windows6.3-KB2849696-x86.cab /NoRestart /Quiet
for /d %%a in (!WimIndexNo!) do !DISM! /Image:"!WimMountDir!\%%a" /add-package /PackagePath:!IE11_HOME!\temp\Hyphenation_en\Windows6.3-KB2849697-x86.cab /NoRestart /Quiet
ECHO �ɹ���� IE11
GOTO :EOF
::===================================================================================================================
:InstallIE8Update
ECHO ������� IE8�İ�ȫ����
SET "IE8_HOME=!APP_HOME!\Updates\IE\IE8"
for /d %%a in (!WimIndexNo!) do !DISM! /Image:"!WimMountDir!\%%a" /add-package /PackagePath:!IE8_HOME!\Windows6.1-KB2598845-%OS_ARCHITECTURE%.cab /NoRestart /Quiet
for /d %%a in (!WimIndexNo!) do !DISM! /Image:"!WimMountDir!\%%a" /add-package /PackagePath:!IE8_HOME!\Windows6.1-KB3124275-%OS_ARCHITECTURE%.cab /NoRestart /Quiet
ECHO �ɹ���� IE8�İ�ȫ����
GOTO :EOF
::===================================================================================================================
:InstallExclusivex64
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\CAB\Exclusive\Update "!TipUpdate!" 
GOTO :EOF
:InstallExclusivex86
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\CAB\Exclusive\Update "!TipUpdate!" 
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\CAB\Exclusive\SecurityUpdate "!TipSecurityUpdate!"
GOTO :EOF
::===================================================================================================================
:InstallRollupFix
SET RollupFixTip=�����ڻ��� !OS_ARCHITECTURE! ��ϵͳ�� Windows 7 �¶Ȱ�ȫ��������
for /d %%a in (!WimIndexNo!) do !StartPlus! !APP_HOME!\SourceCode\Common\Utils\OfflineInstallCAB.bat !APP_HOME!\Updates\RollupFix "!RollupFixTip!"
GOTO :EOF
::===================================================================================================================
:AutoMount
cls
SET wim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\install.wim
ECHO.
ECHO ��ǰWIM�Ĵ��·��Ϊ:%wim%
ECHO.----------------------------------------------------------
ECHO ���ڲ�����install.wim�е�ӳ�����Ϣ����:
ECHO.----------------------------------------------------------
CALL :GetWimInfo
ECHO.----------------------------------------------------------
ECHO    ***************************************************************************
ECHO    *   С��ʾ��                                                              *
ECHO    *   1.����ı�ű�����������б��д���,������Ϊ��.                        *
ECHO    *   2.����ı�ű���������,��Χ��1�������ŵ����ֵ,�������ֵ.          *
ECHO    *   3.�����������,�����Ĳ���һ�������.                                  *
ECHO    ***************************************************************************
ECHO:
CALL :InputIndexNo
CALL :IndexNotNullLoop
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
GOTO :EOF
::===================================================================================================================
:CommitWIM
ECHO.
ECHO ���ڱ�����ĵ�WIM��...
ECHO.
ECHO ������ĵ�WIM�п�����ҪһЩʱ��,���Ժ�...
ECHO.
for /d %%a in (!WimIndexNo!) do !DISM! /unmount-wim /mountdir:"!WimMountDir!\%%a" /commit
for /d %%a in (!WimIndexNo!) DO (rd /s /q "!WimMountDir!\%%a") >NUL 2>&1
ECHO.
ECHO �ɹ�������ĵ�WIM��...
GOTO :EOF
::===================================================================================================================
:GetWimInfo
ECHO ========================
ECHO ����         ����
ECHO ========================
FOR /F "tokens=1,* delims= " %%a in ('!DISM! /Get-WimInfo /WimFile:!WORK_HOME!:\UPDATE_HOME\ISO\sources\install.wim') DO (
    if "%%~a"=="Index" (
        endlocal
        SET IndexSize=%%~b
        SET IndexSize=!IndexSize:~2,2!
    )
    if "%%~a"=="Name" (
        SET IndexName=%%~b
        SET IndexName=!IndexName:~2,20!
        ECHO  !IndexSize!   !IndexName!
    )
)
CALL "!APP_HOME!\SourceCode\Common\Utils\SetPathNow.bat" IndexSize
GOTO :EOF
::===================================================================================================================
:IndexNotNullLoop
if "!WimIndexNo!"=="" (
    ECHO.
    ECHO �־�ı�Ų���Ϊ��,����������.
    ECHO.
    CALL :InputIndexNo
    GOTO :IndexNotNullLoop
)
if "!WimIndexNo!"=="none" (
    ECHO.
    ECHO �־�ı�Ų���Ϊ��,����������.
    ECHO.
    CALL :InputIndexNo
    GOTO :IndexNotNullLoop
)
if not !WimIndexNo!=="" (
    if not !WimIndexNo!=="none" (
        GOTO :IndexNotExistLoop
    ))
GOTO :EOF
::===================================================================================================================
:IndexNotExistLoop
for /l %%g in (1, 1, !IndexSize!) DO (
    if !WimIndexNo!==%%g (
        SET flag=true
        GOTO :IndexNotExistLoopEnd
    )
    if not !WimIndexNo!==%%g (
        SET flag=false
        if %%g==!IndexSize! GOTO :IndexNotExistLoopEnd
    )
)
GOTO :EOF
::===================================================================================================================
:IndexNotExistLoopEnd
if "!flag!"=="false" (
    SET WimIndexNo=none
    ECHO.
    ECHO �����������ֵ������,����������.
    ECHO.
    CALL :InputIndexNo
    GOTO :IndexNotNullLoop
)
if "!flag!"=="true" (
    GOTO :StartMount
)
GOTO :EOF
::===================================================================================================================
:StartMount
cls
ECHO.
ECHO ��ʼ��װ�����ļ���!WimMountDir!\!WimIndexNo!Ŀ¼��
ECHO.
for /d %%a in (!WimIndexNo!) DO (IF NOT EXIST "!WimMountDir!\%%a" MD "!WimMountDir!\%%a")&&(!DISM! /mount-wim /wimfile:"%wim%" /index:%%a /mountdir:"!WimMountDir!\%%a")
ECHO �ɹ���װ�����ļ���!WimMountDir!\!WimIndexNo!Ŀ¼��
ECHO.
GOTO :EOF
::===================================================================================================================
:InputIndexNo
SET /p WimIndexNo=����Ҫ���صķ־�ı��[������1��!IndexSize!֮���������] : ^>
CALL "!APP_HOME!\SourceCode\Common\Utils\SetPathNow.bat" WimIndexNo
GOTO :EOF
::===================================================================================================================
:HEADER
ECHO.----------------------------------------------------------
ECHO %~1
ECHO %~2
ECHO.----------------------------------------------------------
ECHO:
GOTO :EOF
::===================================================================================================================
:MENUHEADER
ECHO.----------------------------------------------------------
ECHO %~1
ECHO.----------------------------------------------------------
ECHO:
GOTO :EOF
::===================================================================================================================
:TITLE
title ������Ӹ��µ� WIM
GOTO :EOF
::===================================================================================================================
:TimeUtil
FOR /F "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do SET "dt=%%a"
SET "YY=%dt:~2,2%" & SET "YYYY=%dt:~0,4%" & SET "MM=%dt:~4,2%" & SET "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & SET "Min=%dt:~10,2%" & SET "Sec=%dt:~12,2%"
GOTO :EOF
::===================================================================================================================
:NameUtil
SET "UltimateFlag=!WORK_HOME!:\UPDATE_HOME\ISO\sources\install_Windows 7 ULTIMATE.clg"
SET "EnterpriseFlag=!WORK_HOME!:\UPDATE_HOME\ISO\sources\install_Windows 7 ENTERPRISE.clg"
SET "ProfessionalFlag=!WORK_HOME!:\UPDATE_HOME\ISO\sources\install_Windows 7 PROFESSIONAL.clg"
IF EXIST "!ULTIMATEFlag!" (
    SET ISONAME=Ultimate
) else (
    IF EXIST "!EnterpriseFlag!" (
        SET ISONAME=Enterprise
    )    
    IF EXIST "!ProfessionalFlag!" (
        SET ISONAME=Professional
    )
)
GOTO :EOF
::===================================================================================================================
:RebuildWim
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\%~1.wim
SET TempFile=!WORK_HOME!:\UPDATE_HOME\ISO\sources\%~1rebuild.wim
FOR /F "tokens=1,* delims= " %%a in ('!DISM! /Get-WimInfo /WimFile:!InstallWim!') DO (
    if "%%~a"=="Index" (
        endlocal
        SET IndexLength=%%~b
        SET IndexLength=!IndexLength:~2,2!
    )
)
del /f /q /a !TempFile!>NUL 2>&1
for /l %%g in (1, 1, !IndexLength!) DO (
    !DISM! /Export-Image /SourceImageFile:!InstallWim! /SourceIndex:%%g /DestinationImageFile:!TempFile! /Compress:Max
)
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" KillRelatedProcess
del /f /q /a !InstallWim!
ren !TempFile! %~1.wim>NUL 2>&1
GOTO :EOF
::===================================================================================================================
:RebuildWimCurrentIndex
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\%~1.wim
SET TempFile=!WORK_HOME!:\UPDATE_HOME\ISO\sources\%~1temp.wim
del /f /q /a !TempFile!>NUL 2>&1
!DISM! /Export-Image /SourceImageFile:!InstallWim! /SourceIndex:!WimIndexNo! /DestinationImageFile:!TempFile! /Quiet /Compress:Max
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" KillRelatedProcess
del /f /q /a !InstallWim!>NUL 2>&1
ren !TempFile! %~1.wim>NUL 2>&1
GOTO :EOF
::===================================================================================================================
:MountWim
SET InstallWim=!WORK_HOME!:\UPDATE_HOME\ISO\sources\%~1.wim
SET WimIndexNo=1
for /d %%a in (!WimIndexNo!) DO (IF NOT EXIST "!WimMountDir!\%%a" MD "!WimMountDir!\%%a")&&(!DISM! /mount-wim /wimfile:"!InstallWim!" /index:%%a /mountdir:"!WimMountDir!\%%a")
GOTO :EOF
::===================================================================================================================
:AddAboveALLToWIM
SET "FROM=%APP_HOME%\Updates\Runtimes\*.*"
SET "TO=!WimMountDir!\!WimIndexNo!\Windows\Setup\Files\Runtimes\"
(IF NOT EXIST "!TO!" MD "!TO!")&&(XCOPY "!FROM!" "!TO!" /y /s /e /h /q)
GOTO :EOF
::===================================================================================================================
:AddWanDrvLiteToWIM
(IF NOT EXIST "!WimMountDir!\!WimIndexNo!\drv" MD "!WimMountDir!\!WimIndexNo!\drv")&&(XCOPY "%APP_HOME%\Packs\Drivers\drv\*.*" "!WimMountDir!\!WimIndexNo!\drv\" /y /s /e /h /q  >NUL 2>&1)
GOTO :EOF
::===================================================================================================================
:AutoDiscard
cls
CALL :MENUHEADER " ����ǰ���صľ����Ҳ��ύ֮ǰ�Ծ�����κ��޸ġ�"
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" DoAutoDiscard
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
PAUSE
GOTO :ISOMenu
GOTO :EOF
::===================================================================================================================
:SucessPause
if "%~1"=="" (
    ECHO.
) else (
    ECHO.
    ECHO %~1
    ECHO.
)
ECHO ��"�����"�����ϲ�˵�,��������. . .
PAUSE >nul
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
GOTO :ISOMenu
GOTO :EOF
::===================================================================================================================
:GetIndexInstalled
FOR /F "tokens=1,* delims=: " %%a in ('%DISM% /Get-WimInfo /WimFile:"!WORK_HOME!:\UPDATE_HOME\ISO\sources\install.wim"') DO (
    if "%%~a"=="Index" (
        SET IndexSize=%%~b
    )
)
if "%IndexSize%"=="1" (
    SET WimIndexNo=1
)
GOTO :EOF
::===================================================================================================================
:AutoStartMount
IF EXIST !WimMountDir! (
    CALL :DoAutoDiscard >nul
) else (
    MD "!WimMountDir!"  
)
CALL :GetIndexInstalled
IF "!MountedState!"=="Ok" (
    GOTO :EOF
)else (
    if "!WimIndexNo!"=="1" (
        for /d %%a in (!WimIndexNo!) DO (IF NOT EXIST "!WimMountDir!\%%a" MD "!WimMountDir!\%%a")&&(!DISM! /mount-wim /wimfile:"!wim!" /index:%%a /mountdir:"!WimMountDir!\%%a") 
    )else (
        CALL :AutoMount
    )
    GOTO :EOF
)
::-------------------------------------------------------------------------------------------
:AddPack
ECHO.
ECHO ���ڽ�%~1���ļ����뵽�ѹ��ص�ϵͳ������
SET "Pack=%APP_HOME%\Packs\%~1"
CALL :ApplyWim "%Pack%\%~1_%OS_ARCHITECTURE%.esd", 1, "!WimMountDir!\!WimIndexNo!"
if "%~1" == "NetFX47" CALL :ApplyWim "%Pack%\%~1_CHS_%OS_ARCHITECTURE%.esd", 1, "!WimMountDir!\!WimIndexNo!"
CALL :MountWIMRegistry "!WimMountDir!\!WimIndexNo!"
if "%~1" == "NetFX47" CALL :TakeRegistryOwnerShip "HKLM\WIM_Software\Classes\CLSID\{FEDB2179-2335-48F1-AA28-5CDA35A2B36D}\InprocServer32"
ECHO.
ECHO ��%~1�����ע������ߵ��뵽�ѹ��ص�ע�����
CALL :ImportReg2WIM "%Pack%\%~1_%OS_ARCHITECTURE%.reg"
if "%~1" == "NetFX47" CALL :ImportReg2WIM "%Pack%\%~1_CHS_%OS_ARCHITECTURE%.reg"
CALL :UnMountWIMRegistry
GOTO :EOF
::-------------------------------------------------------------------------------------------
:ApplyWim
%DISM% /Apply-Image /ImageFile:%~1 /Index:%~2 /ApplyDir:%~3\ /CheckIntegrity /Verify
GOTO :EOF
::-------------------------------------------------------------------------------------------
:MountWIMRegistry
ECHO.
ECHO ���ص�ǰ���ؾ����ע������õ�Ԫ
reg load HKLM\WIM_Software "%~1\Windows\System32\config\software" >nul
reg load HKLM\WIM_System "%~1\Windows\System32\config\system" >nul
reg load HKLM\WIM_Current_User "%~1\Users\Default\ntuser.dat" >nul
reg load HKLM\WIM_User_Default "%~1\Windows\System32\config\default" >nul
GOTO :EOF
::-------------------------------------------------------------------------------------------
:UnMountWIMRegistry
ECHO.
ECHO ж���ѹ��ص�ע������õ�Ԫ.
reg unload HKLM\WIM_Software >nul
reg unload HKLM\WIM_System >nul
reg unload HKLM\WIM_Current_User >nul
reg unload HKLM\WIM_User_Default >nul
GOTO :EOF
::-------------------------------------------------------------------------------------------
:ImportReg2WIM
reg import %~1 >NUL 2>&1
GOTO :EOF
::-------------------------------------------------------------------------------------------
:TakeRegistryOwnerShip
SET "SetACL=%APP_HOME%\Bin\%PROCESSOR_ARCHITECTURE%\SetACL.exe"
ECHO.
ECHO ����WIMע���������Ȩ.
"%SetACL%" -on "%~1" -ot reg -actn setowner -ownr "n:S-1-5-32-544;s:y" -rec yes >nul
ECHO.
ECHO ����WIMע�����Ȩ��
"%SetACL%" -on "%~1" -ot reg -actn ace -ace "n:S-1-5-32-544;s:y;p:full" -rec yes >nul
GOTO :EOF
::===================================================================================================================
:DoCleanup
cls
CALL %APP_HOME%\SourceCode\Common\Utils\CleanMountedImage.bat %WimMountDir%\%WimIndexNo% CleanUpLevelOne
cls
GOTO :EOF
::===================================================================================================================
:RebuildCurrentInstallWIM
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" FOOTER
CALL :AutoStartMount
ECHO.
ECHO �����ؽ�install.wim . . .
CALL :RebuildWimCurrentIndex install
CALL :SucessPause �ɹ��ؽ�install.wim . . .
GOTO :EOF
::===================================================================================================================
:GetCurrentImageInfo
cls
!DISM! /Get-MountedImageInfo
CALL :SucessPause
GOTO :EOF