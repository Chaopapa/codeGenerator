package com.le;

import com.baomidou.mybatisplus.generator.config.ConstVal;
import com.baomidou.mybatisplus.generator.config.builder.ConfigBuilder;
import com.baomidou.mybatisplus.generator.engine.AbstractTemplateEngine;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Map;

public class TemplateEngine extends AbstractTemplateEngine {
    private Configuration configuration;

    public TemplateEngine() {
    }

    public TemplateEngine init(ConfigBuilder configBuilder) {
        super.init(configBuilder);
        this.configuration = new Configuration(Configuration.getVersion());
        this.configuration.setDefaultEncoding(ConstVal.UTF8);
        try {
            this.configuration.setDirectoryForTemplateLoading(new File("").getAbsoluteFile());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return this;
    }

    public void writer(Map<String, Object> objectMap, String templatePath, String outputFile) throws Exception {
        Template template = this.configuration.getTemplate(templatePath);
        FileOutputStream fileOutputStream = new FileOutputStream(new File(outputFile));
        template.process(objectMap, new OutputStreamWriter(fileOutputStream, ConstVal.UTF8));
        fileOutputStream.close();
        logger.debug("模板:" + templatePath + ";  文件:" + outputFile);
    }

    public String templateFilePath(String filePath) {
        StringBuilder fp = new StringBuilder();
        fp.append(filePath).append(".ftl");
        return fp.toString();
    }
}
