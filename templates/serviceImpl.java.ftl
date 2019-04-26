package ${package.ServiceImpl};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import com.le.core.rest.R;
import org.springframework.stereotype.Service;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {

    @Override
    public R findPage(Page<${entity}> pagination, ${entity} search) {
        QueryWrapper<${entity}> qw = new QueryWrapper<>();

        IPage<${entity}> page = baseMapper.selectPage(pagination, qw);
        return R.success(page);
    }

    public R editData(${entity} ${entity?uncap_first}) {
        saveOrUpdate(${entity?uncap_first});
        return R.success();
    }
}
</#if>
