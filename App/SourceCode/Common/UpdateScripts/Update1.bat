SET OPTIONAL_HOME=%APP_HOME%\Updates\CAB\OptionalUpdate
SET OTHERS_HOME=%APP_HOME%\Updates\CAB\OthersUpdate
SET "SUCCESSTIPS=���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ���³���"
CALL %APP_HOME%\SourceCode\Common\Utils\InstallCAB.bat %OPTIONAL_HOME% "%SUCCESSTIPS%"
%DISM% /online /Add-Package /PackagePath:"%APP_HOME%\Updates\ServicingStack\Windows6.1-KB3177467-%OS_ARCHITECTURE%.cab" /norestart /quiet
ECHO �ɹ���װ ���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ���³��� (KB3177467)