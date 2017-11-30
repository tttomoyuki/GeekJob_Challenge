<%-- 
    Document   : login
    Created on : 2017/11/17, 10:54:57
    Author     : taked
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  String url =request.getParameter("url");
  if(url==null){
      url=(String)request.getAttribute("url");
  }
  HttpSession hs = request.getSession();
  hs.setAttribute("url",url);
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
        <title>ログイン・新規登録</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
        <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
        <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a><br><br>
        <h3>ユーザー名とパスワードを入力して下さい。</h3><br><br>
        <form action="Login" method="POST">
            <p class="label label-primary">お名前</p>
            <input type="text" name="Name" value=""><br><br>
            <p class="label label-primary">パスワード</p>
            <input type="text" name="password" value=""><br><br>
            <input type="submit" name="btnsubmit" value="ログイン" class="btn btn-primary">
        </form>
        <br><br>
        <a href="registration.jsp" class="btn btn-primary">会員登録はこちら</a>
    </body>
</html>
