SET ROLLUP_HOME=%APP_HOME%\Updates\RollupFix
SET "SUCCESSTIPS=���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ���³���"
ECHO.
ECHO ���ڰ�װ���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ���³�����¶��ۻ�����...
ECHO.
CALL %APP_HOME%\SourceCode\Common\Utils\InstallCAB.bat %ROLLUP_HOME% "%SUCCESSTIPS%"