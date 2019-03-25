@echo off
mode con cols=80 lines=30
title 欢迎使用代码生成器
echo.
echo                            欢迎使用代码生成器
echo.
echo ================================================================================
echo.
echo 使用说明请执行 java -jar CodeGenerator.jar -?
echo.
java -jar CodeGenerator.jar -host 192.168.100.180 -database lecore -module -table
echo.
pause
