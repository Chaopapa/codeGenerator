package com.le;

import com.beust.jcommander.Parameter;

/**
 * @Author 严秋旺
 * @Date 2018-12-06 10:12
 * @Version V1.0
 **/
public class Param {
    @Parameter(names = {"--help", "-help", "-?"}, help = true, description = "选项说明")
    public boolean help;
    @Parameter(names = "-host", description = "数据库地址")
    public String jdbcHost = "127.0.0.1";
    @Parameter(names = "-port", description = "数据库端口")
    public Integer jdbcPort = 3306;
    @Parameter(names = "-database", description = "数据库名称", required = true ,echoInput = true,password = true)
    public String jdbcDatabase;
    @Parameter(names = "-driver", description = "数据库驱动")
    public String jdbcDriver = "com.mysql.jdbc.Driver";
    @Parameter(names = "-username", description = "数据库登录名")
    public String jdbcUsername = "root";
    @Parameter(names = "-password", description = "数据库登录密码")
    public String jdbcPassword = "cc123456";
    @Parameter(names = "-author", description = "作者，默认获取当前系统的登录名，例如administrator")
    public String author = "陈超";
    @Parameter(names = "-out", description = "文件输出路径/")
    public String out = "build/";
    @Parameter(names = "-package", description = "java包路径")
    public String parent = "com.cc";
    @Parameter(names = "-module", description = "模块名称", password = true, echoInput = true, required = true)
    public String module;
    @Parameter(names = "-table", description = "表名", password = true, echoInput = true, required = true)
    public String table;


}
