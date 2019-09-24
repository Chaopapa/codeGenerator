<!DOCTYPE html>
<html>
[@cc.head _title="${table.comment!}编辑"]
[/@cc.head]
[@cc.body]
<section class="content">
    <div class="box">
        <div class="box-header with-border">
            <div class="box-title">${table.comment}信息</div>
        </div>
        <div class="box-body">
            <form id="form" method="post" action="editData" component="bootstrapvalidator"
                  class="form-horizontal row form-col2" bv-success="bvSuccess" bv-success-callback="bvSuccessCallback">
                <input type="hidden" name="id" class="form-control" value="$${"{entity.id}"}">
                <#list table.fields as field>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="control-label col-sm-4">${field.comment}:</label>
                        <div class="col-sm-8">
                            <#switch field.propertyType>
                            <#case "Long">
                            <#case "Integer">
                            <input type="number" class="form-control" name="${field.propertyName}" value="$${"{entity." + field.propertyName + "}"}" placeholder="请输入${field.comment}" required />
                            <#break>
                            <#case "Date">
                            <input type="text" class="form-control" name="${field.propertyName}" value="$${"{entity." + field.propertyName + "}"}" placeholder="请输入${field.comment}" component="dateTime"
                                   required maxlength="19" />
                            <#break>
                            <#default>
                            <input type="text" class="form-control" name="${field.propertyName}" value="$${"{entity." + field.propertyName + "}"}" placeholder="请输入${field.comment}" required />
                            </#switch>
                        </div>
                    </div>
                </div>
                </#list>
                <div class="clearfix"></div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <div class="col-sm-8 col-sm-offset-4">
                            <button type="submit" id="add" class="btn btn-primary">提交</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<script type="text/javascript">
    //所有的js执行程序必须在webReady执行之后才能执行
    var webReady = function () {

    };
</script>
[/@le.body]
</html>
