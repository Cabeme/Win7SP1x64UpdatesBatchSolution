::Author:Զ����̳Jay1982
::Blog: https://www.cnblogs.com/1982/
::Github: https://github.com/deanspring/Win7SP1x64UpdatesBatchSolution
::QQ:1438411802
@ECHO OFF&PUSHD %~DP0
CALL :Notice
SetLocal EnableDelayedExpansion
Color 0F
CALL :SystemCheckVariables
mode con:cols=94 lines=42
Color 8F
ECHO.
ECHO.  
ECHO.
ECHO.
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO                                     ���ڳ�ʼ��,���Ժ�... 
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.
ECHO.
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.  
ECHO.
ECHO.
ECHO.  
ECHO.
ECHO.
CALL :DisableUAC >nul 2>&1
CALL :GetAdminRights >nul 2>&1
CALL :SetAPPHOME >nul 2>&1
CALL :Home
exit
::===================================================================================================================
:: ���û�������
::===================================================================================================================
:SetAPPHOME
FOR %%x IN ("%APP_HOME%") DO SET APP_HOME=%%~sx
CALL "%APP_HOME%\SourceCode\Common\Utils\SetPathNow.bat" APP_HOME
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" InitializeVariables
GOTO :EOF
::===================================================================================================================
:Notice
mode con:cols=105 lines=27
ECHO. 
ECHO.
ECHO                           ---------------------------------------------------
ECHO                                              ʹ �� �� ֪
ECHO                           ---------------------------------------------------
ECHO.                                           
ECHO. 
ECHO =========================================================================================================
ECHO   Ϊ���������õ�ʹ�ñ����»���,�б�Ҫ�Ķ����µķ�����ʾ[������ϸ�Ķ�]
ping -n 1 127.0 >nul 2>&1
ECHO.
ECHO   1.�����»���ԭ���Ͻ���֧���ڸոհ�װ�õ�,��û�а�װ���������,���ٷ�ԭ���Win7SP164λ�������İ���ʹ��.
ping -n 1 127.0 >nul 2>&1
ECHO.
ECHO   2.�����ʹ�õ��ǵ�������װ��ϵͳ,����ϵͳ�а�װ�˹ܼ���ʿ�ȵ�������ȫ�������,ĳЩ�������ܻ�ʧ�ܣ�
ping -n 1 127.0 >nul 2>&1
ECHO.
ECHO   �����������,ϵͳ����,�޷����������غ��������������ϵͳ��������������������������رմ˰�װ����.
ping -n 1 127.0 >nul 2>&1
ECHO.
ECHO   3.���ִ��Ҫ�ڲ���������������ϵͳ��ʹ�ã����ȱ������Ĳ���ϵͳȻ����ʹ�ã��м�!!!
ping -n 1 127.0 >nul 2>&1
ECHO.
ECHO   4.��δ��ϸ�Ķ����������������κ�����,����Ը�!!!
ping -n 1 127.0 >nul 2>&1
ECHO. 
ECHO =========================================================================================================
ECHO.
ECHO                  �������ϵͳ������������,�밴 "�����" ����,����,��ֱ�ӹرձ�����.
ECHO.
PAUSE>nul
cls
GOTO :CheckRuntimeEnvironment
::===================================================================================================================
:CheckRuntimeEnvironment
IF EXIST "%ProgramFiles%\Jiangmin\Antivirus\KvPad.exe" CALL :ShowTips ����ɱ�����
IF EXIST "%ProgramFiles(x86)%\Rising\Rav\rsmain.exe" CALL :ShowTips ����ɱ�����
IF EXIST "%ProgramFiles(x86)%\Baidu\BaiduSd" CALL :ShowTips �ٶ�ɱ��
IF EXIST "%ProgramFiles(x86)%\Baidu\BaiduAn" CALL :ShowTips �ٶ���ʿ
IF EXIST "%ProgramFiles(x86)%\kingsoft\kingsoft antivirus\kismain.exe" CALL :ShowTips ��ɽ����
IF EXIST "%ProgramFiles(x86)%\ksafe\KSafe.exe" CALL :ShowTips ��ɽ��ʿ
IF EXIST "%ProgramFiles(x86)%\2345Soft\2345PCSafe\2345MPCSafe.exe" CALL :ShowTips 2345��ȫ��ʿ
IF EXIST "%ProgramFiles(x86)%\360\360Safe\360Safe.exe" CALL :ShowTips 360��ȫ��ʿ
IF EXIST "%ProgramFiles(x86)%\360\360sd\360sd.exe" CALL :ShowTips 360ɱ��
IF EXIST "%ProgramFiles(x86)%\Tencent\QQPCMgr" CALL :ShowTips ���Թܼ�
GOTO :EOF
::===================================================================================================================
:ShowTips
mode con:cols=105 lines=20
ECHO. 
ECHO =========================================================================================================
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO         ��⵽���ĵ����а�װ��%~1��������ڸհ�װ�ã���û�а�װ���������ϵͳ�����д˹��ߡ�
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO. 
ECHO =========================================================================================================
ECHO.
ECHO                                        �� ��������� �˳�
ECHO. 
ECHO =========================================================================================================
ECHO.
PAUSE>NUL
EXIT
GOTO :EOF
::===================================================================================================================
:Home
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" CleanTemp>NUL 2>&1
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" DoAutoDiscard>NUL 2>&1
taskkill /f /IM trustedinstaller.exe>NUL 2>&1
net start trustedinstaller>NUL 2>&1
cls
CALL "%APP_HOME%\SourceCode\Menu\Home.bat"
::===================================================================================================================
:: �ر�UAC,��������������޷�������װ.
::===================================================================================================================
:DisableUAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f
GOTO :EOF
::===================================================================================================================
::����UAC����ԱȨ��,�ڵ����ĶԻ����ϵ���Ǽ���,������˳�.
::===================================================================================================================
:GetAdminRights
SET "params=%*"
cd /d "%~dp0" && ( IF EXIST "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  ECHO SET UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
GOTO :EOF
::===================================================================================================================
:CheckRunningConditions
mode con:cols=68 lines=5
FOR /F "tokens=2 delims==" %%G in ('wmic path Win32_Processor get AddressWidth /value') DO (SET OSArchitecture=%%G)
if %OSArchitecture% NEQ %UpdateToolArchitecture% (
    ECHO.
    ECHO �˸��»��ܰ�Ϊ %UpdateToolArchitecture%λ ����ϵͳ����,�޷����������� %OSArchitecture%λ ����ϵͳ�� ...
    ECHO.
    ECHO ������רΪ %OSArchitecture%λ ����ϵͳ�����ĸ��»��ܰ�����������˳���
    pause>nul
    exit
)
GOTO :EOF
::===================================================================================================================
:SystemCheckVariables
IF EXIST "%APP_HOME%\Updates\KB976932\Windows6.1-KB2533552-x86.cab" (
    SET UpdateToolArchitecture=32
) else (
    SET UpdateToolArchitecture=64
)
CALL :CheckRunningConditions
cls
GOTO :EOF