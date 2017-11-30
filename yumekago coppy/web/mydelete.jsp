<%-- 
    Document   : mydelete
    Created on : 2017/11/22, 11:36:39
    Author     : taked
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession hs = request.getSession();
    UserDataBeans UDB =(UserDataBeans)request.getAttribute("UDB");
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
        <title>削除の確認</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
       <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
       <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
        <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a><br><br>
        <h3>このユーザーをマジで削除しますか？</h3>
        <p class="label label-primary">ユーザーID</p>
        <%=UDB.getuserID()%><br><br>
        <p class="label label-primary">お名前</p>
        <%=UDB.getName()%><br><br>
        <p class="label label-primary">メールアドレス</p>
        <%=UDB.getmail()%><br><br>
        <p class="label label-primary">ご住所</p>
        <%=UDB.getaddress()%><br><br>
        <p class="label label-primary">これまでの購入金額</p>
        <%=UDB.gettotal()%><br><br>
        <p class="label label-primary">登録日時</p>
        <%=UDB.getnewDate()%><br><br>
        <a href="Mydeleteresult" class="btn btn-primary">はい</a>
        <a href="mydata.jsp" class="btn btn-primary">いいえ</a>
    </body>
</html>
