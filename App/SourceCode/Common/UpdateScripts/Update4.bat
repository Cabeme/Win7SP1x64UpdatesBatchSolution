SET SECURITYUPDATE_HOME=%APP_HOME%\Updates\CAB\SecurityUpdate
SET "SUCCESSTIPS=���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ��ȫ���³���"
CALL %APP_HOME%\SourceCode\Common\Utils\InstallCAB.bat %SECURITYUPDATE_HOME% "%SUCCESSTIPS%"