SET IE8_HOME=%APP_HOME%\Updates\IE\IE8
SET IE8_MSG=�ɹ���װ  ���ڻ��� %OS_ARCHITECTURE% ϵͳ�� Windows 7 �� Internet Explorer 8
dism /Online /add-package /PackagePath:"%IE8_HOME%\Windows6.1-KB2598845-%OS_ARCHITECTURE%.cab" /ignorecheck /norestart /quiet
ECHO %IE8_MSG% ��������ͼ�б�ĸ��³��� (KB2598845)
dism /Online /add-package /PackagePath:"%IE8_HOME%\Windows6.1-KB3124275-%OS_ARCHITECTURE%.cab" /ignorecheck /norestart /quiet
ECHO %IE8_MSG% ���ۻ���ȫ���³��� (KB3124275)