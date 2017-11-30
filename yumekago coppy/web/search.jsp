<%-- 
    Document   : search
    Created on : 2017/11/15, 10:39:49
    Author     : guest1Day
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="TBD.ProductDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession hs = request.getSession();
    ArrayList<ProductDataBeans> PDB_List = (ArrayList<ProductDataBeans>)hs.getAttribute("PDB_List");
    
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
        <title>検索結果</title>
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
        <h3><%=PDB_List.get(0).getKensakuWord()%>の検索結果</h3><br><br><br>
        <%for(int i=0 ; i<PDB_List.size() ;i++){%>
            <img src="<%=PDB_List.get(i).getUrl()%>"><br>
           　<!--<form action="" method="POST">-->
            <div class="alert alert-success" role="alert">
            <a href="Item?id=<%=i%>"><img src="" alt="
              <%out.println(i+1+":"+PDB_List.get(i).getName());
                out.println(PDB_List.get(i).get_value()+"円");%>
                "width="233" height="165" border="0"/>
            </a></div><br>
            <%}%>
    </body>
</html>
