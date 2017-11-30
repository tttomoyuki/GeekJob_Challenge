<%-- 
    Document   : inde
    Created on : 2017/11/22, 14:56:18
    Author     : taked
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="TBD.ProductDataBeans"%>
<%@page import="TBD.ProductSearch"%>
<%@page import="TBD.UserDataBeans"%>
<%@page import="base.Loginhellper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <%
        String URL="login.jsp?url=index.jsp";   String link="login.jsp?url=index.jsp";
        String user ="ゲスト";                  String hellper ="ログイン";
        
        if(session.getAttribute("login")!=null){
        URL="Logout";
        hellper ="ログアウト";
        }
        if(session.getAttribute("login")!=null){
            String key =(String)session.getAttribute("key");
            UserDataBeans UDB =(UserDataBeans)session.getAttribute(key);
            link ="mydata.jsp";
            user =UDB.getName()+"さん";
        }
        
    %>
    
    
    <head>
        <title>ゆめかごTop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body class="text-left">
        <form action="Search_" method="GET">
            
            <a href="<%=URL%>" class="well well-sm bg-success pull-left"><%=hellper%></a>
            <a href="<%=link%>" class="well well-sm bg-success pull-left"><%=user%></a>
            <a href="Cart" class="well well-sm bg-success pull-left">カート</a>
            <a href="Myhistory"class="well well-sm bg-success pull-left">購入履歴</a>
            <a href="Mydata"class="well well-sm bg-success pull-left">登録情報の確認</a><br><br>
            
            <div class="text-primary"><h1>かごゆめ<small class="text-primary">kagoyume</small></h1></div><br><br>
                                     
            <input type="text" name="product" placeholder="検索ワードを入力" value="">
            <input class="btn-primary" type="submit" name="btnsubmit" value="検索">
        </form>
            <h3>「かごゆめ」は買い物した気になれるジョークサイトです。<br><br>
                 どれだけ買い物をしても値段が無料のまさに夢のようなサイトです。<br><br>
                 心ゆくまでお買い物（の真似）をお楽しみください。</h3><br><br>
                 
</body>
</html>
