@ECHO OFF & PUSHD %~DP0
mode con:cols=94 lines=42
echo.
echo                        ---------------------------------------------------
echo                                Microsoft .NET Framework 4.7 ��װ��
echo                        ---------------------------------------------------
echo.
SET NET470_HOME=%APP_HOME%\Updates\Runtimes\NDP47

CALL :CheckWhetherNDP47Exist >NUL 2>&1

:CheckWhetherNDP47Exist
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\"  /v Version>NUL 2>&1
if  not %errorlevel% leq 0 (
    REM CALL :InstallNDP47Prepare
    CALL :InstallNDP47
    GOTO :CheckWhetherNDP47CHSExist >NUL 2>&1
) else (
    GOTO :GetNDPVersion
)
GOTO :EOF

:GetNDPVersion
SET regquery=reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full"  /v Version
FOR /F "tokens=3" %%a in ('%regquery%') DO (
  FOR /F "tokens=1 delims= " %%b in ("%%a") DO (
    SET NDPVersion=%%b
  )
)
if "%NDPVersion%" EQU "4.7.02053" (
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO                 ����ϵͳ���Ѿ���װ��Microsoft .NET Framework 4.7,�������°�װ.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    GOTO :CheckWhetherNDP47CHSExist
) else (
    REM CALL :InstallNDP47Prepare
    CALL :InstallNDP47
    GOTO :CheckWhetherNDP47CHSExist >NUL 2>&1
)
GOTO :EOF

:CheckWhetherNDP47CHSExist
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\2052"  /v Version>NUL 2>&1
if  not %errorlevel% leq 0 (
    CALL :InstallNDP47CHS
    GOTO :EOF
) else (
    goto :GetNDPCHSVersion
)
GOTO :EOF

:GetNDPCHSVersion
SET RegqueryCHS=reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\2052"  /v Version>NUL 2>&1
FOR /F "tokens=3" %%a in ('%RegqueryCHS%') DO (
  FOR /F "tokens=1 delims= " %%b in ("%%a") DO (
    SET NDPCHSVersion=%%b
  )
)
if "%NDPCHSVersion%" EQU "4.7.02053" (
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO          ����ϵͳ���Ѿ���װ��Microsoft .NET Framework 4.7�����������԰�,�������°�װ.
    ECHO.
    ECHO.
    ECHO.
    GOTO :EOF
) else (
    GOTO :InstallNDP47CHS
)
GOTO :EOF



:InstallNDP47
"%NET470_HOME%\NDP47-KB3186497-x86-x64-AllOS-ENU.exe" /passive /norestart
ECHO.
ECHO.
ECHO.
ECHO                      �ɹ���װ  Microsoft .NET Framework 4.7 ��ʽ�� (KB3186497)
ECHO.
ECHO.
ECHO.
GOTO :EOF

:InstallNDP47CHS
"%NET470_HOME%\NDP47-KB3186497-x86-x64-AllOS-CHS.exe" /passive /norestart
ECHO.
ECHO.
ECHO.
ECHO                      �ɹ���װ  Microsoft .NET Framework 4.7 ���԰� (KB3186497)
ECHO.
ECHO.
ECHO.
GOTO :EOF

::======���ϵͳ�汾==========================
:SystemCheckVariables
FOR /F "tokens=6 delims=[]. " %%G in ('ver') do SET win=%%G
GOTO :EOF

:InstallNDP47Prepare
CALL :SystemCheckVariables
if "%win%" equ "7601" (
    IF NOT EXIST "%WINDIR%\System32\D3DCompiler_47.dll" (
        REM %DISM% /Online /add-package /packagepath:"%NET470_HOME%\Windows6.1-KB4019990-%OS_ARCHITECTURE%.cab" /NoRestart /Quiet
        ECHO.
        ECHO.
        ECHO                      ���ڰ�װ Microsoft .NET Framework 4.7 �������.
        ECHO.
        ECHO.
        SET RollupFixTip=������� .NET Framework v4.7 ����ĸ���
        CALL %APP_HOME%\SourceCode\Common\Utils\InstallCAB.bat !APP_HOME!\Updates\RollupFix "!RollupFixTip!">NUL 2>&1
        ECHO.
        ECHO                   Microsoft .NET Framework 4.7 ���������������ɰ�װ.
        ECHO. 
        copy /y "%APP_HOME%\SourceCode\Common\UpdateScripts\InstallNET47AfterRestart.bat" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" > NUL
        ECHO.
        ECHO                               �밴 "�����" �������ļ����.....
        PAUSE > nul
        CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" Restart
        GOTO :EOF
    ) else (
        GOTO :CheckWhetherNDP47Exist >NUL 2>&1
    )
)
GOTO :EOF