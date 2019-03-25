package com.le;

import com.beust.jcommander.Parameter;
import org.apache.commons.lang3.SystemUtils;

/**
 * @Author 严秋旺
 * @Date 2018-12-06 10:12
 * @Version V1.0
 **/
public class Param {
    @Parameter(names = {"--help", "-help", "-?"}, help = true, description = "选项说明")
    public boolean help;
    @Parameter(names = "-host", description = "数据库地址")
    public String jdbcHost = "192.168.100.180";
    @Parameter(names = "-port", description = "数据库端口")
    public Integer jdbcPort = 3306;
    @Parameter(names = "-database", description = "数据库名称", required = true)
    public String jdbcDatabase;
    @Parameter(names = "-driver", description = "数据库驱动")
    public String jdbcDriver = "com.mysql.jdbc.Driver";
    @Parameter(names = "-username", description = "数据库登录名")
    public String jdbcUsername = "root";
    @Parameter(names = "-password", description = "数据库登录密码")
    public String jdbcPassword = "666666";
    @Parameter(names = "-author", description = "作者，默认获取当前系统的登录名，例如administrator")
    public String author = SystemUtils.USER_NAME;
    @Parameter(names = "-out", description = "文件输出路径/")
    public String out = "build/";
    @Parameter(names = "-package", description = "java包路径")
    public String parent = "com.le";
    @Parameter(names = "-module", description = "模块名称", password = true, echoInput = true, required = true)
    public String module;
    @Parameter(names = "-table", description = "表名", password = true, echoInput = true, required = true)
    public String table;


}
