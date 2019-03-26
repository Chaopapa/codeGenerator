<!DOCTYPE html>
<html>
[@le.head _title="${table.comment}"]
[/@le.head]
[@le.body]
<body class="container-fluid">
<section class="content">
    <div class="box">
        <div class="box-header with-border">
            <div class="box-title">${table.comment}列表</div>
        </div>
        <div class="box-body">
            <form id="form" class="form-inline">
                <ul class="tablePanel">
                    <div class="form-group">
                        <label>用户账号:</label>
                        <input type="text" class="form-control" name="username" placeholder="请输入用户账号"/>
                    </div>
                    <div class="form-group">
                        <label>名称:</label>
                        <input type="text" class="form-control" name="name" placeholder="请输入名称"/>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-success" onclick="m_search();">
                            <i class="glyphicon glyphicon-search"></i> 搜索
                        </button>
                        <button type="button" class="btn btn-primary" onclick="m_reset();">
                            <i class="glyphicon glyphicon-remove"></i> 重置
                        </button>
                    </div>
                </ul>
            </form>
            <table id="table"
                   component="table"
                   class="table table-striped"
                   table-url = "page"
                   data-search-from="form"
                   data-search="false"
                   data-show-refresh="true"
                   data-show-toggle="true"
                   data-show-columns="true"
                   data-show-export="false"
                   data-refresh-callback="refresh"
                   data-load-callback="loadback"
                   data-height="100%"
                   dataType="1"
                   data-dataList="json"
                   data-page-list="[5,10]"
                   data-ajaxType="json"
                   data-remove-callback="remove"
                   data-checkbox="true"
                   data-search-callback=""
                   data-BeforeDel="beforeDel"
                   data-add-callback="add"
                   data-operation='{"remove":{icon:"remove","event":"click",class:"remove",eventFun:"removeEve"}}'>
                <thead>
                <tr>
                    <#list table.fields as field>
                    <th data-field="${field.propertyName}" data-align='center'>${field.comment}</th>
                </#list>
                <th data-field="operate" data-formatter="operateFormatter" data-events="operateEvents"
                    data-align='center'>操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</section>
<script type="text/javascript">
    //所有的js执行程序必须在webReady执行之后才能执行
    var webReady = function(){

    };

    function m_search(){
        var $table = System.getComponent('#table');
        $table.quickSearch();
    }

    function m_reset(){
        var $table = System.getComponent('#table');
        $table.quickReset();
    }

    //添加
    function add(){
        System.openWindow({
            id:'add',
            title:'添加信息',
            url:'edit',
            width:'60%',
            height:'60%',
            maxmin:true
        });
    }

    //删除
    function remove(data) {
        var checkNodes = '';
        for(var i = 0; i < data.length; i++) {
            if(checkNodes == '') {
                checkNodes = data[i].id;
            } else {
                checkNodes = checkNodes + ',' + data[i].id;
            }
        }
        System.confirm({
            title: '系统提示',
            text: '是否确认删除?',
            type: 'warning',
            callback: function(bool) {
                if(bool) {
                    $.ajax({
                        url: "del",
                        data: {ids: checkNodes},
                        successAuto: function (data) {
                            System.alert({
                                title: '提示信息',
                                text: '删除成功',
                                type: 'success'
                            });
                            refreshData();
                        }
                    });
                }
            }
        })
    }

    //操作栏
    function operateFormatter(value, row, index) {
        var list = [];
        list.push('<a class="edit" href="javascript:void(0)" title="修改"><i class="fa fa-edit"></i>修改</a>  ');
        return list.join('');
    }

    /*点击操作按钮时候的获取当前行数据的事件*/
    window.operateEvents = {
        'click .edit': function(e, value, row, index) {
            System.openWindow({
                id: 'modify',
                title: '修改',
                url: 'edit?id=' + row.id + "&",
                width: '60%',
                height: '60%',
                maxmin: true
            });
        }
    };

    //刷新数据
    function refreshData(){
        $("#table").bootstrapTable("refresh");
    }
</script>
[/@le.body]
</html>
