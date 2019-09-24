package ${package.Service};

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ${package.Entity}.${entity};
import ${superServiceClassPackage};
import com.cc.core.rest.R;

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {

    /**
     * 后台${table.comment!}分页
     *
     * @param pagination 分页参数
     * @param search     搜索条件
     * @return
     */
    R findPage(Page<${entity}> pagination, ${entity} search);

    /**
     * 添加或修改${table.comment!}
     *
     * @param ${entity?uncap_first} 数据实体
     * @return
     */
    R editData(${entity} ${entity?uncap_first});
}
</#if>
