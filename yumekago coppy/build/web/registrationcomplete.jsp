<%-- 
    Document   : registartioncomplete
    Created on : 2017/11/20, 11:32:26
    Author     : taked
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession hs = request.getSession();
    UserDataBeans UDB =(UserDataBeans)hs.getAttribute("UDB");
    String login; String log="ログイン";
    String user;  String us="ゲスト";
    
    Loginhellper hellper = new Loginhellper();
    login=(String)hellper.hellper("");
    user=(String)hellper.user("");
    if(session.getAttribute("login")!=null){
    login=(String)hellper.hellper("ok");
    String id =(String)hs.getAttribute("key");
    UserDataBeans UD =(UserDataBeans)hs.getAttribute(id);
    user =(String)hellper.user(UDB.getName());
    log ="ログアウト";
    us =UD.getName()+"さん";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登録結果</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
        <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
        <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a><br><br>
        <h3>登録結果</h3><br>
        <お名前><br>
        <%=UDB.getName()%><br><br>
        <パスワード>
        <%=UDB.getpassword()%>
        <メールアドレス><br>
        <%=UDB.getmail()%><br><br>
        <ご住所><br>
        <%=UDB.getaddress()%><br><br><br>
        上記の内容で登録しました。
    </body>
</html>
