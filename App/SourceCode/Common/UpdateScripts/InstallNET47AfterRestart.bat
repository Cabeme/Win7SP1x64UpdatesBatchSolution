@ECHO OFF & PUSHD %~DP0
mode con:cols=94 lines=42
CALL "%APP_HOME%\SourceCode\Common\Header\HeaderOfIndex.bat"
SET NET470_HOME=%APP_HOME%\Updates\Runtimes\NDP47
echo.
echo                        ---------------------------------------------------
echo                                Microsoft .NET Framework 4.7 ��װ��
echo                        ---------------------------------------------------
echo.
echo.
echo.
ECHO                         ��װ.NET Framework 4.7��ҪһЩʱ��,���Ժ�......
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
"%NET470_HOME%\NDP47-KB3186497-x86-x64-AllOS-ENU\Setup.exe" /passive /norestart
ECHO.
ECHO.
ECHO.
ECHO.
echo                     �ɹ���װ  Microsoft .NET Framework 4.7 ��ʽ�� (KB3186497)
ECHO.
ECHO.
ECHO.
ECHO.
"%NET470_HOME%\NDP47-KB3186497-x86-x64-AllOS-CHS.exe" /passive /norestart
echo                     �ɹ���װ  Microsoft .NET Framework 4.7 ���԰� (KB3186497)
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
pause >nul
CALL "%APP_HOME%\SourceCode\Menu\UpdateWindowsFromLocalDrive.bat"
del /f /q %0