@ECHO OFF
Color 3F
mode con:cols=120 lines=25
Title ��������װ���¹������ɵ���ʱ�����ļ�.......
taskkill /IM sysprep.exe /F >nul 2>&1
rem ͨ�������Windows Update,���Զ�������.
ECHO ��������װ���¹������ɵ���ʱ�����ļ�.......
start /B /wait cleanmgr /d %SystemDrive% /sagerun:65535
ping -n 3 -w 1000 8.8.8.1 >nul 2>&1
ECHO Ϊ���Զ���Windows Update����,ִ�����߸���,��װʣ��Ĳ���.
ECHO.
ECHO ΢��ÿ�¶����Ƴ��µĸ���,ͬʱһЩ�ɵĲ���Ҳ�ᱻ�µĸ��������.
ECHO.
ECHO ��ܰ��ʾ:���Ƽ���װ����4������,���ڿ�ѡ�����б���,����Ҽ�,ѡ�����ظ���.
ECHO.
ECHO 1. KB2952664 :������ Windows 10 �ļ����Ը���
ECHO 2. KB3021917 :���� Windows �ͻ�������Ƽƻ� (CEIP),����������ͻ� Microsoft��
ECHO 3. KB3068708 :���� Windows �ͻ�������Ƽƻ� (CEIP),����������ͻ� Microsoft��
ECHO 4. KB3080149 :�˸��°������û������� Windows CEIP �ƻ���ң�����.
ECHO.
start /B /wait wuauclt /ShowWUAutoScan
ping -n 10 -w 1000 8.8.8.1 >nul 2>&1
start /B /wait mshta vbscript:CreateObject("Wscript.Shell").popup("��л����ʹ��,�ټ�.^_^",15,"��ܰ��ʾ")(window.close)
CALL %APP_HOME%\SourceCode\Common\Utils\RestorePath.bat > NUL 2>&1
del /f /q %0
exit