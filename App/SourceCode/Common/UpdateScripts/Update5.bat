SET UPDATES2ND_HOME=%APP_HOME%\Updates\CAB\Updates2nd
SET "SUCCESSTIPS=���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ���³���"
SET "KB2533552TIPS=�ɹ���װ ������ %OS_ARCHITECTURE% ϵͳ�� Windows 7 Service Pack 1"
CALL %APP_HOME%\SourceCode\Common\Utils\InstallCAB.bat %UPDATES2ND_HOME% "%SUCCESSTIPS%"
%DISM% /online /Add-Package /PackagePath:"%APP_HOME%\Updates\KB976932\Windows6.1-KB2533552-%OS_ARCHITECTURE%.cab" /norestart /quiet
ECHO �ɹ���װ ������ %OS_ARCHITECTURE% ϵͳ�� Windows 7 Service Pack 1 (KB2533552)
%DISM% /online /Add-Package /PackagePath:"%APP_HOME%\Updates\ServicingStack\Windows6.1-KB3172605-%OS_ARCHITECTURE%.cab" /norestart /quiet
ECHO �ɹ���װ ���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 ���³��� (KB3172605)