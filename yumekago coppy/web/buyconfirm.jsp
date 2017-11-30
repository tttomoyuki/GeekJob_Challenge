<%-- 
    Document   : buyconfirm.jsp
    Created on : 2017/11/20, 17:36:25
    Author     : taked
--%>

<%@page import="base.Loginhellper"%>
<%@page import="TBD.UserDataBeans"%>
<%@page import="java.util.ArrayList"%>
<%@page import="TBD.ProductDataBeans"%>
<%@page import="TBD.ProductDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession hs = request.getSession();
    ArrayList <ProductDataBeans> mycart=new ArrayList <ProductDataBeans>();
    mycart=(ArrayList<ProductDataBeans>)hs.getAttribute("mycart");
    int value = 0;
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
        <title>カート</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript" ></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="<%=login%>" class="well well-sm bg-success pull-left"><%=log%></a>
       <a href="<%=user%>" class="well well-sm bg-success pull-left"><%=us%></a>
        <a href="index.jsp" class="well well-sm bg-success pull-left">トップ</a><br><br>
        <h3>カートの商品</h3><br><br>
        
        <%for(int i=0; i<mycart.size(); i++){%>
        <div class="alert alert-success" role="alert">
        <%=i+1%>:
        <%=mycart.get(i).getName()%>
        <%=mycart.get(i).get_value()%><br><br>
        </div>
        <%}%>
        <div class="alert alert-info" role="alert">合計金額:
        <%for(int n=0; n<mycart.size(); n++){
            value=value+mycart.get(n).get_value();
        }%>
        <%=value%></div><br><br>
        <form action="Buyconfirm" method="POST">
            <input type="radio" name="shipping" value="1">佐川急便
            <input type="radio" name="shipping" value="2">クロネコヤマト
            <input type="radio" name="shipping" value="3">日本郵便<br>
            <input type="submit" name="btnsubmit" value="購入する" class="btn btn-primary">
        </form><br>
        <form action="/cart.jsp" method="POST">
            <input type="submit" name="btnsubmit" value="カートに戻る" class="btn btn-primary">
        </form>
    </body>
</html>
