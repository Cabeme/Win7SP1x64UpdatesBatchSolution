@ECHO OFF & PUSHD %~DP0
mode con:cols=94 lines=42
SET MSVC_HOME=%APP_HOME%\Updates\Runtimes\MSVC
SET SUCCESSTIPS=安装  Microsoft Visual C++
ECHO.
ECHO 正在%SUCCESSTIPS%
ECHO.
"%MSVC_HOME%\%OS_ARCHITECTURE%.cmd" /y
ECHO.
ECHO 成功%SUCCESSTIPS%
ECHO.
ECHO.
GOTO :EOF