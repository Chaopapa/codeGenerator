@echo off
mode con cols=80 lines=30
title ��ӭʹ�ô���������
echo.
echo                            ��ӭʹ�ô���������
echo.
echo ================================================================================
echo.
echo ʹ��˵����ִ�� java -jar CodeGenerator.jar -?
echo.
java -jar CodeGenerator.jar -host 192.168.100.180 -database lecore -module -table
echo.
pause
