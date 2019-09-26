package ${package.Controller};

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};
import com.cc.core.rest.R;
import com.cc.core.util.HttpContextUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Slf4j
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("/admin<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>
<#assign serviceName=table.serviceName[1..]?uncap_first >
<#assign entityName=entity?uncap_first >
    @Autowired
    private ${table.serviceName} ${serviceName};

    /**
     * 跳转${table.comment!}首页
     *
     * @param model
     * @return
     */
    @RequestMapping({"/index", "/"})
    @RequiresPermissions("${package.ModuleName}:${table.entityPath}:view")
    public String index(ModelMap model) {
        return "admin/${package.ModuleName}/${table.entityPath}/index";
    }

    /**
     * 获取${table.comment!}分页数据
     *
     * @param search 搜索条件
     * @return
     */
    @RequestMapping("/page")
    @ResponseBody
    @RequiresPermissions("${package.ModuleName}:${table.entityPath}:view")
    public R page(${entity} search) {
        Page<${entity}> page = HttpContextUtils.getPage();
        return ${serviceName}.findPage(page, search);
    }

    /**
     * 跳转${table.comment!}信息页
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/edit")
    @RequiresPermissions("${package.ModuleName}:${table.entityPath}:view")
    public String edit(ModelMap model, Long id) {
        if (id != null) {
            ${entity} ${entityName} = ${serviceName}.getById(id);
            model.put("entity", ${entityName});
        }
        return "admin/${package.ModuleName}/${table.entityPath}/edit";
    }

    /**
     * 添加或者更新${table.comment!}
     *
     * @param ${entityName}
     * @return
     */
    @RequestMapping("/editData")
    @ResponseBody
    @RequiresPermissions("${package.ModuleName}:${table.entityPath}:edit")
    public R editData(@Valid ${entity} ${entityName}) {
        return ${serviceName}.editData(${entityName});
    }

    /**
     * 删除${table.comment!}
     *
     * @param ids
     * @return
     */
    @RequestMapping("/del")
    @ResponseBody
    @RequiresPermissions("${package.ModuleName}:${table.entityPath}:edit")
    public R del(@RequestParam("ids") List<Long> ids){
        ${serviceName}.removeByIds(ids);
        return R.success();
    }
}
</#if>
