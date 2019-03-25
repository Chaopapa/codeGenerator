+ 程序包含三个部分：run.bat、CodeGenerator.jar、templates
    + run.bat     启动脚本，设置了常用参数
    + CodeGenerator.jar   java主程序
    + templates   生成代码时使用的模板文件
+ 查看程序的详细参数说明，执行命令：java -jar CodeGenerator.jar -?
# Options:
* ##--help, -help, -?
    选项说明
* ##-author
      作者，默认获取当前系统的登录名，例如administrator
      Default: Administrator
* ##-database
      数据库名称
* ##-driver
      数据库驱动
      Default: com.mysql.jdbc.Driver
* ##-host
      数据库地址
      Default: 192.168.100.180
* ##-module
      模块名称
* ##-out
      文件输出路径/
      Default: build/
* ##package
      java包路径
      Default: com.le
* ##-password
      数据库登录密码
      Default: 666666
* ##-port
      数据库端口
      Default: 3306
* ##-table
      表名
* ##-username
      数据库登录名
      Default: root

