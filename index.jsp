<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    This is my index file.${name}
    <div>
        <div>搜索条件：</div>
        <div>
            <span>条件1：<input type="text"></span>
            <span>条件1：<input type="text"></span>
            <span>条件1：<input type="text"></span>
            <span>条件1：<input type="text"></span>
            <span>条件1：<input type="text"></span>
        </div>
        <button type="button" id="bt1">定时刷新</button>
        <button type="button" id="bt2">停止刷新</button>
    </div>
    <div>
        <div>搜索结果：</div>
        <%--<div><span>职业｜</span><span>|</span><span>|</span><span>|</span><span>|</span><span>|</span></div>--%>
        <div>合格卡：</div>
        <div id="hege">
            <div>
                <span>力：敏：体：意：法：精：｜</span><span>价格：｜</span><span>地址：</span></span><span class="remove">无效排除</span>
            </div>
        </div>
        <div>其他卡：</div>
        <div id="fightcard">
            <div><span>力：敏：体：意：法：精：｜</span><span>价格：｜</span><span>地址：</span><span class="remove">无效排除</span></div>
        </div>
    </div>
</body>

<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<script src="/js/jquery.timers-1.2.js"></script>

<script type="application/javascript">
    //提交json数据
    $(document).ready(function () {

        //ajax
        $("#bt1").click(function(){

            //停止所有定时任务
            $('body').stopTime();

            //执行新定时任务
            check();
        });

        function check() {
            // $("#bt1").attr("disabled", true);
            // $("#bt1").val("正在提交，请稍等3秒.....");
            //定时任务
            $('body').everyTime('3s','A',function(){
                ajaxpost();
            });
        }


        //ajax请求
        function ajaxpost() {

            $.ajax({
                type: "POST",
                url: "/json/data",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"name":"yd","pwd":"123456"}),
                dataType: "json",
                success:function (message) {
                    console.log("提交成功："+JSON.stringify(message));
                },
                error:function (message) {
                    alert("提交失败："+JSON.stringify(message));
                }
            });
        }

    });
</script>
</html>
