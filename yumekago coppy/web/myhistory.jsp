<%-- 
    Document   : myhistory
    Created on : 2017/11/21, 17:08:58
    Author     : taked
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="TBD.ProductDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession hs = request.getSession();
    ArrayList<ProductDataBeans>PDB_List = new ArrayList<ProductDataBeans>();
    PDB_List=(ArrayList<ProductDataBeans>)request.getAttribute("history");
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
        <title>購入履歴</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
        <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
        <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a><br><br>
        <h3>これまでの購入履歴</h3>
        <%for(int i =0; i<PDB_List.size(); i++){%>
        <div class="alert alert-success" role="alert">
        商品コード:
        <%=PDB_List.get(i).getCode()%>
        値段:
        <%=PDB_List.get(i).get_value()%><br>
        </div>
        <%}%>
    </body>
</html>
