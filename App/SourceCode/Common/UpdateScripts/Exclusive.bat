SET EXCLUSIVE_HOME=%APP_HOME%\Updates\CAB\Exclusive
SET UPDATESUCCESS=�ɹ���װ ���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ���³���
SET SECURITYUPDATESUCCESS=�ɹ���װ ���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ���³���
if "%OS_ARCHITECTURE%"=="x86" (
    CALL %APP_HOME%\SourceCode\Common\Utils\InstallCAB.bat %EXCLUSIVE_HOME%\Update "%UPDATESUCCESS%"
    CALL %APP_HOME%\SourceCode\Common\Utils\InstallCAB.bat %EXCLUSIVE_HOME%\SecurityUpdate "%SECURITYUPDATESUCCESS%"
) else (
    CALL %APP_HOME%\SourceCode\Common\Utils\InstallCAB.bat %EXCLUSIVE_HOME%\Update "%UPDATESUCCESS%"
)