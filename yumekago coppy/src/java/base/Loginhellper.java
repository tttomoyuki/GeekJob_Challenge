/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package base;

/**
 *
 * @author taked
 */
public class Loginhellper {
    
    public static Loginhellper getinstance(){
        return new Loginhellper();
    }
    
   /*public static String hellper(String ID){
        String URL="login.jsp?url=index.jsp";
        String hellper ="<a href=\""+URL+"\"><ログイン></a>";
        
        if(!ID.equals("")){
        URL="Logout";
        hellper ="<a href=\""+URL+"\"><ログアウト></a>";
        return hellper;
        }else{
            return hellper;
        }
}*/
    public static String hellper(String ID){
        String URL="login.jsp?url=index.jsp";
        if(!ID.equals("")){
        URL="Logout";
        
        return URL;
        }else{
            return URL;
        }
}
    /*public static String user(String name){
        String link="login.jsp?url=index.jsp";
        String user ="<a href=\""+link+"\"><ゲスト></a>";
        
        if(!name.equals("")){
            
            link ="mydata.jsp";
            user ="<a href=\""+link+"\"><ようこそ"+name+"さん></a>";
    }
        return user;
    }
}*/
    public static String user(String name){
        String link="login.jsp?url=index.jsp";
    
        if(!name.equals("")){
            link ="mydata.jsp";
    }
        return link;
    }
}



