<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zucker
  Date: 2021/1/13
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>博语</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/editor.md/css/editormd.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css">
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css"/>
<!-- CSS Files -->
<%--<link href="../assets/css/material-dashboard.min.css?v=2.2.2" rel="stylesheet" />--%>
<!-- CSS Just for demo purpose, don't include it in your project -->

<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="margin-left: 30px" href="#">*博 语*</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li style="margin-left: 50px" class="active"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
            </ul>

            <form class="navbar-form navbar-collapse" role="search">
                <div class="form-group">
                    <input style="margin-left: 800px" type="text" class="form-control" placeholder="更多" name="search">
                </div>

                <button type="submit" class="btn btn-default">搜索</button>
                <c:if test="${empty username}">
                    <ul class="nav navbar-nav navbar-right" id="logAndReg">
                        <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                    </ul>
                    <br><br>
                </c:if>
                <c:if test="${!empty username}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="${pageContext.request.contextPath}/static/css/images/user.png"  height="20" />
                                    ${username}
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href='#'>资料修改</a>
                                <li><a href="${pageContext.request.contextPath}/user/${username}">我的博客</a>
                                <li><a href="#">我的收藏</a>
                                <li><a href="#">我的粉丝</a>
                                <li><a href="${pageContext.request.contextPath}/logout" >退出</a>
                            </ul>
                    </ul>
                </c:if>
            </form>
        </div>
    </div>
</nav>
<div style="margin-left: 90px" class="col-md-8">
    <div id="content" >

        <div class="panel panel-default">
            <div class="panel-heading"  style="background: floralwhite">
                <h2>${blog_content.blogTitle}</h2>
                <p>${blog_content.creator}</p>
            </div>
            <div class="panel-body">
                <div id="markdown-editor">
                    <!-- 编辑器的内容 START -->
                    <textarea id="content2" style="display:none;">${blog_content.blogContext}
                    </textarea>
                    <!-- 编辑器的内容 END -->
                </div>
                <button class="btn btn-info" style="margin-left: 800px">收藏</button>
                <button class="btn btn-warning" >关注</button>

            </div>

        </div>
        <div class="panel panel-default">
            <div class="panel-heading"  style="background: floralwhite">
                <h3 class="panel-title">评论</h3>
            </div>
            <div class="panel-body">
                <c:set var = "index" scope = "request" value="0"/>
                <c:forEach var="c" items="${blog_comment}">
                    <c:set var = "index" scope = "request" value="${index+1}" />
                    <ul class="list-group">
                        <li class="list-group-item">
                            第${index}楼
                            <c:if test="${c.commenterId==creator_info.username}">作者</c:if>
                            <a href="${pageContext.request.contextPath}/user/${c.commenterId}">
                                    ${c.commenterName}
                            </a>${c.commentTime}
                            <a style="float: right" href="#">删除</a>
                            <br><br>${c.commentContext}
                        </li>
                    </ul>
                </c:forEach>
                <ul class="list-group">
                    <div class="form-group" id="comment-div">
                        <textarea class="form-control" id="text-comment" rows="3" placeholder="我的评论..."></textarea>
                    </div>
                    <input type="button" id="btn-comment" class="btn-primary" value="提交" />
                    <span><input  name="annoy" id="check-annoy" type="checkbox" value="yes" >是否匿名</span>
                </ul>

            </div>

        </div>
    </div>
</div>
<div class="col-sm-3">
    <div id="content1" >
        <div class="panel panel-default">
            <div class="panel-heading"  style="background: floralwhite">
                <h3 class="panel-title">个人简介</h3>
            </div>
            <div class="panel-body">
                <p>昵称:${creator_info.nickName}
                <p>粉丝:${creator_info.fans}
                <p>关注:${creator_info.favourite}
                <p>邮箱:${creator_info.email}
            </div>

        </div>
        <div class="panel panel-default">
            <div class="panel-heading"  style="background: floralwhite">
                <h3 class="panel-title">最近的文章</h3>
            </div>
            <div class="panel-body">
                <c:forEach var="c" items="${blog_recent}">
                    <li><a href="#">${c.blogTitle}</a></li>
                </c:forEach>
            </div>

        </div>
    </div>
</div>
</div>

</div>
<!-- 这里的引入顺序不能改变，先引入jquery，再引入 editormd，
    否则可能报错 [ ReferenceError: Zepto is not defined ] [ ReferenceError: editormd is not defined ]  -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

<!-- 预览时需要引入marked.js，否则报错 [ ReferenceError: marked is not defined ] -->
<script src="${pageContext.request.contextPath}/static/editor.md/lib/marked.min.js"></script>
<!-- 预览时需要引入prettify.js，否则报错 [ ReferenceError: prettyPrint is not defined ] -->
<script src="${pageContext.request.contextPath}/static/editor.md/lib/prettify.min.js"></script>

<script src="${pageContext.request.contextPath}/static/editor.md/editormd.js"></script>

<script>
        $(document).ready(function () {
        dropdownOpen();
    });

        function dropdownOpen() {
        var $dropdownli = $('li.dropdown');
        $dropdownli.mousemove(function () {
        $(this).addClass('open');
    }).mouseout(function () {
        $(this).removeClass('open');
    });
    };

    let mkEditor
    $(function (){
            mkEditor = editormd.markdownToHTML("markdown-editor", {
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
        });
    })
    $(function (){


        $('#btn-comment').click(function (){
            alert($("input[name='annoy']:checked").val())
            <%--if (""=== $('#text-comment').val())--%>
            <%--    alert("不能提交空白评论")--%>
            <%--else{--%>
            <%--    $.ajax({--%>
            <%--        url: "${pageContext.request.contextPath}/c/${blog_content.blogId}",--%>
            <%--        type: "POST",--%>
            <%--        data: {--%>
            <%--            text_comment: $("#text-comment").val(),--%>
            <%--            annoy:$("#check-annoy").attr('checked')--%>
            <%--        },--%>
            <%--        dataType : 'json',--%>
            <%--        success:function (data){--%>
            <%--            console.log(data);--%>
            <%--            if("ok"===data.msg){--%>
            <%--              --%>
            <%--                window.location.reload()--%>
            <%--                $("#comment-div").scrollIntoView(true);--%>

            <%--                // console.log(data);--%>
            <%--                // console.log(data.comment);--%>
            <%--                &lt;%&ndash;                            ${blog_comment} ;&ndash;%&gt;--%>
            <%--                &lt;%&ndash;                            ${blog_comment}.load(data.comment);&ndash;%&gt;--%>
            <%--                // console.log("点击!!"+$('#text-comment').val());--%>
            <%--                // console.log($('#check-annoy').attr('checked'));--%>
            <%--            }--%>
            <%--            else {--%>
            <%--                alert("未登录!")--%>
            <%--                window.location.href='${pageContext.request.contextPath}/login.jsp';--%>
            <%--            }--%>
            <%--            &lt;%&ndash;window.location.href='${pageContext.request.contextPath}/home'&ndash;%&gt;--%>
            <%--        },--%>
            <%--        error:function (){--%>
            <%--            alert("error")--%>
            <%--        }--%>
            <%--    })--%>
            // }
        })
    })
</script>
</body>
</html>

</body>
</html>