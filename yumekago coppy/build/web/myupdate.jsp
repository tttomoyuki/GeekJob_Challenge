<%-- 
    Document   : myupdate
    Created on : 2017/11/22, 10:29:59
    Author     : taked
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession hs = request.getSession();
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
        <title>登録情報の更新</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
        <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
        <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a><br><br><br>
        <form action="Myupdateresult" method="POST">
            <p class="label label-primary">お名前</p>
            <input type="text" name="Name" value=""><br><br>
            <p class="label label-primary">パスワード</p>
            <input type="text" name="password" value=""><br><br>
            <p class="label label-primary">メールドレス</p>
            <input type="text" name="mail" value=""><br><br>
            <p class="label label-primary">住所</p>
            <input type="text" name="address" value=""><br><br>
            <input type="submit" name="btnsubmit" value="更新"><br>
        </form>
</body>
</html>
