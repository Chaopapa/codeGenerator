package com.le;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.beust.jcommander.JCommander;

import java.util.ArrayList;
import java.util.List;

public class CodeGenerator {
//    public static final String jdbcUrl = "jdbc:mysql://192.168.100.180:3306/mqzhny?useUnicode=true&useSSL=false&characterEncoding=utf8";
//    public static final String jdbcDriver = "com.mysql.jdbc.Driver";
//    public static final String jdbcUsername = "root";
//    public static final String jdbcPassword = "666666";
//
//    public static final String author = "严秋旺";
//
//    public static final String projectPath = "build/";
//
//    public static final String parent = "com.le";

    /**
     * <p>
     * 读取控制台内容
     * </p>
     */
//    public static String scanner(String tip) {
//        Scanner scanner = new Scanner(System.in);
//        StringBuilder help = new StringBuilder();
//        help.append("请输入" + tip + "：");
//        System.out.println(help.toString());
//        if (scanner.hasNext()) {
//            String ipt = scanner.next();
//            if (StringUtils.isNotEmpty(ipt)) {
//                return ipt;
//            }
//        }
//        throw new MybatisPlusException("请输入正确的" + tip + "！");
//    }
    public static void main(String[] args) {
        Param param = new Param();
        JCommander commander = JCommander.newBuilder().addObject(param).build();
        commander.parse(args);
        if(param.help){
            commander.usage();
            return;
        }
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir(param.out + "src/main/java");
        gc.setAuthor(param.author);
        gc.setOpen(false);
        gc.setBaseResultMap(true);
        gc.setBaseColumnList(true);
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        String jdbcUrl = String.format("jdbc:mysql://%s:%d/%s?useUnicode=true&useSSL=false&characterEncoding=utf8",
                param.jdbcHost, param.jdbcPort, param.jdbcDatabase);
        dsc.setUrl(jdbcUrl);
        // dsc.setSchemaName("public");
        dsc.setDriverName(param.jdbcDriver);
        dsc.setUsername(param.jdbcUsername);
        dsc.setPassword(param.jdbcPassword);
        mpg.setDataSource(dsc);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName(param.module);
        pc.setParent(param.parent);
        mpg.setPackageInfo(pc);

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };
        List<FileOutConfig> focList = new ArrayList<>();
        focList.add(new FileOutConfig("/templates/mapper.xml.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return param.out + "/src/main/java/com/cc/" + pc.getModuleName() + "/mapper/xml/" + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }
        });
        focList.add(new FileOutConfig("/templates/index.ftl.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return param.out + "/src/main/resources/templates/admin/" + pc.getModuleName() + "/" + tableInfo.getEntityPath() + "/index.html";
            }
        });
        focList.add(new FileOutConfig("/templates/edit.ftl.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return param.out + "/src/main/resources/templates/admin/" + pc.getModuleName() + "/" + tableInfo.getEntityPath() + "/edit.html";
            }
        });
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);
        mpg.setTemplate(new TemplateConfig().setXml(null));

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setSuperEntityClass("com.cc.core.base.SuperEntity");
        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
        //strategy.setSuperControllerClass("com.baomidou.ant.common.BaseController");
        strategy.setInclude(param.table);
        strategy.setSuperEntityColumns("id", "create_date", "modify_date");
        strategy.setControllerMappingHyphenStyle(true);
        strategy.setTablePrefix(pc.getModuleName() + "_");
        strategy.setRestControllerStyle(false);
        mpg.setStrategy(strategy);
        mpg.setTemplateEngine(new TemplateEngine());
        mpg.execute();
    }

}
