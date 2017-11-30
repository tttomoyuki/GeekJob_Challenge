<%-- 
    Document   : signup
    Created on : 2017/11/17, 10:56:58
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
        <title>新規登録</title>
    </head>
    <body>
       <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
        <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
        <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a><br><br>
        ユーザー情報を入力してください。<br><br>
        <form action="Registration" method="POST">
            <お名前><br>
            <input type="text" name="Name" value="<%if(UDB!=null){%><%=UDB.getName()%><%}%>"><br><br>
            <パスワード><br>
            <input type="text" name="password" value="<%if(UDB!=null){%><%=UDB.getpassword()%><%}%>"><br><br>
            <メールアドレス><br>
            <input type="text" name="mail" value="<%if(UDB!=null){%><%=UDB.getmail()%><%}%>"><br><br>
            <住所><br>
            <input type="text" name="address" value="<%if(UDB!=null){%><%=UDB.getaddress()%><%}%>"><br><br>
            <input type="submit" name="btnsubmit" value="登録"><br>
            
            
        </form>
    </body>
</html>
