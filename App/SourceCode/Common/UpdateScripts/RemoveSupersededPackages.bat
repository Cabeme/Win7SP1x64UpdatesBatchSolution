@ECHO OFF
setlocal ENABLEEXTENSIONS
SET versionNumber=3
SET regquery=reg query "HKLM\Software\Microsoft\Internet Explorer" /v svcVersion
FOR /F "tokens=3" %%a in ('%regquery%') DO (
  FOR /F "tokens=1 delims=." %%b in ("%%a") DO (
    if %%b GEQ 10 (
       SET versionNumber=%%b
    )
  )
)
if "%versionNumber%" LSS 10 (
  SET regquery=reg query "HKLM\Software\Microsoft\Internet Explorer" /v Version
  FOR /F "tokens=3" %%a in ('%regquery%') DO (
    FOR /F "tokens=1 delims=." %%b in ("%%a") DO (
      SET versionNumber=%%b
    )
  )    
)
IF "%versionNumber%" EQU "8" (
    rem �Ƴ���IE8�ĸ���ȡ����KB2900986
    dism /online /Remove-Package /PackageName:Package_for_KB2900986~31bf3856ad364e35~%PROCESSOR_ARCHITECTURE%~~6.1.1.1 /norestart > NUL 2>&1
) ELSE (
    rem �Ƴ��������IE���.(���͵�����ϸһ��,�Ƴ�֮��,��ʹ�㲻ϲ��IE11,��ж�ص���ԭ��IE8,Ҳ������Ӱ��.�ǿ����������˻�IE8��.�˺�֮��,�����밲װIE11��,����ϲ����װIE9 IE10 ,�����������İ�װ.��˼��������Ƴ���ȫû�з���,�ǰ�ȫ��.)
    dism /online /Remove-Package /PackageName:Microsoft-Windows-IE-Troubleshooters-Package~31bf3856ad364e35~%PROCESSOR_ARCHITECTURE%~~6.1.7601.17514 /norestart>NUL 2>&1
    dism /online /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~%PROCESSOR_ARCHITECTURE%~~8.0.7601.17514 /norestart>NUL 2>&1
)