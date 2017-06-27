@ECHO off
mode con:cols=94 lines=42
:: ͨ���ಽѭ����⣬�ж��������ק���ļ��Ƿ�Ϊ������֧�ֵĹٷ�ԭ�澵��
:: ������֧�ֵĹٷ�ԭ�澵���SHA1ֵ

SET SHA1_PROFESSIONAL=9b57e67888434c24dd683968a3ce2c72755ab148
SET SHA1_PROFESSIONAL_VL=647b26479a3a46c078f5b1364a89003a31f4aada
SET SHA1_ENTERPRISE=9ba5e85596c2f25be59f7e96139d83d4cb261a62
SET SHA1_ULTIMATE=2ce0b2db34d76ed3f697ce148cb7594432405e23

SET "Zip=%APP_HOME%\Bin\%PROCESSOR_ARCHITECTURE%\7z.exe"
SET "DVDFolder=%WORK_HOME%:\UPDATE_HOME\ISO\"

CALL :prompt
GOTO :EOF

:prompt
cls
SET ISOFullPathAndName=
ECHO.
ECHO ===============================================================================
ECHO            ������ISO�ļ���·����֧�ֵĹٷ�ISO������ק���˴���
ECHO.  
ECHO        ��ע��:�������ק��ɺ�,�������һ�±�����,�ٰ��س�������...
ECHO ===============================================================================
ECHO.
SET /p ISOFullPathAndName=
set "ISOFullPathAndName=%ISOFullPathAndName:"=%"
FOR %%x IN ("%ISOFullPathAndName%") DO SET ISOFullPathAndName=%%~sx
if [%ISOFullPathAndName%]==[] (
    ECHO.
    ECHO ������Ч,������ISO�ļ���·����֧�ֵĹٷ�ISO������ק���˴���
    ECHO.
    GOTO :prompt
)
if "%ISOFullPathAndName::\=%"=="%ISOFullPathAndName%" (
    ECHO.    
    ECHO ��������,������ISO�ļ���·����֧�ֵĹٷ�ISO������ק���˴���
    ECHO.
    pause
    GOTO :prompt
)
if /i "%ISOFullPathAndName:~-4%" neq ".iso" (
  ECHO.
  ECHO ��ȷ���������ק���ļ�·����iso��β
  ECHO.
  pause
  GOTO :prompt
)

GOTO :CheckWhetherISOFileIsTheOfficialImageBeingSupport
GOTO :EOF
:: ����ͨ�� certutil -hashfile "�ļ�·��" sha1 �����ָ���ļ���sha1ֵ
:: ѭ�����Ŀ���ļ��Ƿ�Ϊ֧�ֵĹٷ�ԭ�澵��
:CheckWhetherISOFileIsTheOfficialImageBeingSupport
ECHO.
ECHO ����У�����ľ����Ƿ�Ϊ������֧�ֵĹٷ�ԭ�澵��
ECHO.
ECHO У�龵����Ҫ���1����ʱ��,���Ժ�...
ECHO.
CALL :CalculateSha1OfImageFile %ISOFullPathAndName%
if "%SHA1_IMAGE%"=="%SHA1_PROFESSIONAL%" (
    ECHO ������ľ����� 64λ��Windows7SP1��������רҵ�� �ٷ�����
    GOTO :ExtractISOImageContentsToDVDFolder
)
if "%SHA1_IMAGE%"=="%SHA1_PROFESSIONAL_VL%" (
    ECHO ������ľ����� 64λ��Windows7SP1��������רҵ���ͻ���Ȩ�� �ٷ�����
    GOTO :ExtractISOImageContentsToDVDFolder
)
if "%SHA1_IMAGE%"=="%SHA1_ENTERPRISE%" (
    ECHO ������ľ����� 64λ��Windows7SP1����������ҵ�� �ٷ�����
    GOTO :ExtractISOImageContentsToDVDFolder
)
if "%SHA1_IMAGE%"=="%SHA1_ULTIMATE%" (
    ECHO ������ľ����� 64λ��Windows7SP1���������콢�� �ٷ�����
    GOTO :ExtractISOImageContentsToDVDFolder
) else (
    ECHO ������ͣ: ������ľ����Ǳ�����֧�ֵ�64λ��Windows7SP1�������Ĺٷ�����
    PAUSE >nul
    GOTO :prompt
)
GOTO :EOF


:: �������ISOĿ¼�еľ����sha1ֵ
:CalculateSha1OfImageFile
SET hashfile=%temp%\hash.out
certutil -hashfile %~1 SHA1 | find /v "SHA1" | find /v "CertUtil" >%hashfile%
SET /p SHA1_IMAGE=<%hashfile%
SET SHA1_IMAGE=%SHA1_IMAGE: =%
erase %hashfile%
GOTO :EOF
:: ��ѹ����ָ����Ŀ¼��
:ExtractISOImageContentsToDVDFolder
IF NOT EXIST "%DVDFolder%" (
	ECHO.
    ECHO ��⵽: Ŀ��·�����ļ��в�����
    PAUSE >nul
    MD %DVDFolder%
) else (
    GOTO :CheckWhetherDVDFolderIsEmpty
)
GOTO :EOF

:CheckWhetherDVDFolderIsEmpty
FOR /F %%i in ('dir /b /s /a "%DVDFolder%\*.*" 2^>nul ^| find /v /c ""') DO (
    if "%%i" NEQ "0" (
  		ECHO.
        ECHO ������ͣ: ��⵽ %DVDFolder% ���Ѿ������ļ�,
        ECHO.
        ECHO ��Ҫ�رձ�����,�뽫�ļ�ɾ����ת�ƺ�,�����������...
    	PAUSE >nul
        GOTO :CheckWhetherDVDFolderIsEmpty
  	) else (
        GOTO :ExtractingISOImageContentsToDVDFolder
    )
)
GOTO :EOF

:ExtractingISOImageContentsToDVDFolder
ECHO.
ECHO ���ڽ�ѹ�������ݵ� %DVDFolder% ��...
ECHO.
ECHO ��ѹ������ҪһЩʱ��,���Ժ�...
%Zip% x -y "%ISOFullPathAndName%" -o"%DVDFolder%" >nul
ECHO.    
ECHO �ɹ���ѹ�������ݵ� %DVDFolder% ��...
ECHO.  
ECHO. 
ECHO.
ECHO   ==========================================================================================
ECHO.  
ECHO                        �� "�����" �����ϼ��˵����������������. . .
ECHO.  
ECHO   ==========================================================================================
ECHO.
PAUSE >nul
GOTO :EOF