<%-- 
    Document   : mydata
    Created on : 2017/11/21, 15:36:23
    Author     : taked
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  String key =(String)hs.getAttribute("key");
  UserDataBeans UDB =(UserDataBeans)hs.getAttribute(key);
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
        <title>登録情報</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
       <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
        <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a>
        <a href="Myupdate" class="well well-sm bg-success pull-left"><登録情報の更新></a>
        <a href="Mydelete" class="well well-sm bg-success pull-left"><削除></a><br><br><br>
        
        <p class="label label-primary">お名前</p>
        <div class="alert alert-success" role="alert">
        <%=UDB.getName()%></div>
        
        <p class="label label-primary">メールアドレス</p>
        <div class="alert alert-success" role="alert">
        <%=UDB.getmail()%></div>
        
        <p class="label label-primary">ご住所</p>
        <div class="alert alert-success" role="alert">
        <%=UDB.getaddress()%></div>
        <p class="label label-primary">これまでの購入金額</p>
        <div class="alert alert-success" role="alert">
        <%=UDB.gettotal()%></div>
        
        <p class="label label-primary">登録日時</p>
        <div class="alert alert-success" role="alert">
        <%=UDB.getnewDate()%></div>
    </body>
</html>
