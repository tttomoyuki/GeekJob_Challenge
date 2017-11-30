<%-- 
    Document   : item
    Created on : 2017/11/16, 17:10:09
    Author     : taked
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page import="TBD.ProductDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession hs = request.getSession();
    ProductDataBeans PDB =(ProductDataBeans)hs.getAttribute("PDB");
    
    String login; String log="ログイン";
    String user;  String us="ゲスト";
    
    Loginhellper hellper = new Loginhellper();
    login=(String)hellper.hellper("");
    user=(String)hellper.user("");
    if(session.getAttribute("login")!=null){
    login=(String)hellper.hellper("ok");
    String id =(String)hs.getAttribute("key");
    UserDataBeans UDB =(UserDataBeans)hs.getAttribute(id);
    user =(String)hellper.user(UDB.getName());
    log ="ログアウト";
    us =UDB.getName()+"さん";
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=PDB.getName()%></title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
       <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
       <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a><br><br><br>
        <form action="Search_" method="GET">
            <input type="text" name="product" placeholder="検索ワードを入力" value="">
            <input class="btn-primary" type="submit" name="btnsubmit" value="検索">
         </form><br><br>
        <p><img src="<%=PDB.getUrl()%>"width="300" height="200" border="0"></p><br>
        <form action="Add" method="POST">
            <input type="submit" name="btnsubmit" value="商品をカートに追加する" class="btn btn-primary">
                    <input type="hidden" name="ProductName" value="<%=PDB.getName()%>">
        </form><br>
                <div class="alert alert-success" role="alert"><%=PDB.getName()%></div>
                <div class="alert alert-info" role="alert">価格:<%=PDB.get_value()%>円</div>
                <div class="alert alert-info" role="alert">この商品の評価は:<%=PDB.getRate()%>！</div>
                <div class="alert alert-info" role="alert"><%=PDB.getDescription()%></div><br><br>
                </a>
    </body>
</html>

