@ECHO OFF&PUSHD %~DP0
if defined %~1 GOTO %~1 else GOTO :OnlineMenu
::===================================================================================================================
:: ��ҳ
::===================================================================================================================
:OnlineMenu
mode con:cols=94 lines=42
Color 3F
SET input=null
cls            
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" DisplayAppName
ECHO.
ECHO.
ECHO   1. ��װ [ϵͳ����,IE11,.NET Framework v4.7,Visual C++���п�,DirectX9.0c] (�Ƽ�)
ECHO.
ECHO.
ECHO   2. ��װ [ϵͳ����,IE11,.NET Framework v4.7]          
ECHO.                                                       
ECHO.                                                       
ECHO   3. ��װ [ϵͳ����,IE11]                              
ECHO.                                                             *******************************
ECHO.                                                             *       �汾:%LastUpdateDate%       *
ECHO   4. ��װ [ϵͳ����,����IE8,.NET Framework v4.7]             *******************************
ECHO.                                                             *   ������: Զ����̳Jay1982   *
ECHO.                                                             *******************************
ECHO   5. ��װ [ϵͳ����,����IE8]                                 *       QQ: 1438411802        *
ECHO.                                                             *******************************
ECHO.                                                             *   ����,�޹��,�����ƹ����  *
ECHO   6. ����װ ΢�� DirectX9.0c ���հ�                          *******************************
ECHO.                                                             *            ��Դ             *
ECHO.                                                             *******************************
ECHO   7. ����װ Microsoft Visual C++[2005-2017]���п�            
ECHO.
ECHO.
ECHO   8. ����ȫ���Ƴ��ķ�װ���ɸ��µ��ٷ�������ģ��
ECHO.
ECHO.
ECHO   00. ����.. (�����ڴ�...)                            0. ������ҳ
ECHO.
ECHO.
SET /p input=*  ��������Ҫѡ�������:
IF "%input%"=="0" (CALL "%APP_HOME%\SourceCode\Menu\Home.bat")
IF "%input%"=="00" (start http://t.cn/RtOmdw5
GOTO OnlineMenu)
IF "%input%"=="1" (Goto U1)
IF "%input%"=="2" (Goto U2)
IF "%input%"=="3" (GOTO U3)
IF "%input%"=="4" (GOTO U4)
IF "%input%"=="5" (GOTO U5)
IF "%input%"=="6" (GOTO U6)
IF "%input%"=="7" (GOTO U7)
IF "%input%"=="8" (CALL "%APP_HOME%\SourceCode\Menu\BuildNewISOWithUpdates.bat" ISOMenu)
if %input% GTR 8 (
    ECHO.
    ECHO ������һ����Ч������
)
ECHO.
PAUSE
cls
GOTO OnlineMenu
::===================================================================================================================
:U1
mode con:cols=87 lines=28
:: �Ķ���װ��֪
CALL "%APP_HOME%\SourceCode\Common\Utils\Readme.bat"
copy /y "%APP_HOME%\SourceCode\InstallOption\UpdatesAIO\1.bat" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" > NUL
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" Restart
::===================================================================================================================
:U2
:: �Ķ���װ��֪
CALL "%APP_HOME%\SourceCode\Common\Utils\Readme.bat"
copy /y "%APP_HOME%\SourceCode\InstallOption\UpdatesWithIE11AndDotNET47\1.bat" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" > NUL
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" Restart
:U3
:: �Ķ���װ��֪
CALL "%APP_HOME%\SourceCode\Common\Utils\Readme.bat"
copy /y "%APP_HOME%\SourceCode\InstallOption\UpdatesWithIE11\1.bat" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" > NUL
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" Restart
::===================================================================================================================
:U4
:: �Ķ���װ��֪
CALL "%APP_HOME%\SourceCode\Common\Utils\Readme.bat"
copy /y "%APP_HOME%\SourceCode\InstallOption\UpdatesWithIE8AndDotNET47\1.bat" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" > NUL
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" Restart
::===================================================================================================================
:U5
:: �Ķ���װ��֪
CALL "%APP_HOME%\SourceCode\Common\Utils\Readme.bat"
copy /y "%APP_HOME%\SourceCode\InstallOption\UpdatesWithIE8\1.bat" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" > NUL
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" Restart
::===================================================================================================================
:U6
CALL "%APP_HOME%\SourceCode\Common\Header\HeaderOfIndex.bat"
CALL "%APP_HOME%\SourceCode\Common\UpdateScripts\InstallDirectX.bat"
CALL :PAUSETIP
cls
GOTO OnlineMenu
::===================================================================================================================
:U7
CALL "%APP_HOME%\SourceCode\Common\Header\HeaderOfIndex.bat"
CALL "%APP_HOME%\SourceCode\Common\UpdateScripts\InstallVC.bat"
CALL :PAUSETIP
cls
GOTO OnlineMenu
::===================================================================================================================
:U8
CALL "%APP_HOME%\SourceCode\Common\Header\HeaderOfIndex.bat"
CALL "%APP_HOME%\SourceCode\Common\UpdateScripts\InstallNET47.bat"
CALL :PAUSETIP
cls
GOTO OnlineMenu
::===================================================================================================================
:PAUSETIP
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
ECHO   ==========================================================================================
ECHO.  
ECHO                                     �� ��������� �˳�
ECHO.  
ECHO   ==========================================================================================
ECHO.
PAUSE>NUL
GOTO :EOF