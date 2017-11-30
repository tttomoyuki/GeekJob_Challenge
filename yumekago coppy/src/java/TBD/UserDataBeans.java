/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TBD;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author taked
 */
public class UserDataBeans {
    private int userID;
    private String Name;
    private String password;
    private String mail;
    private String address;
    private int total;
    private Timestamp  newDate;
    private int deleteflg;
    
 public void setuserID(int id){
        userID=id;
    }
public int getuserID(){
    return userID;
}
public void setName(String name){
    Name = name;
}
public String getName(){
    return Name;
}
public void  setpassword(String pass){
    password =  pass;
}
public String  getpassword(){
     return password ;
}
public void setmail(String mail){
    this.mail=mail;
}
public String getmail(){
    return mail;
}
public void setaddress(String add){
    address = add;
}
public String getaddress(){
    return address;
}
public void settotal(int total){
    this.total=total;
}
public int gettotal(){
    return total;
}
public void setnewDate(Timestamp stamp){
    newDate = stamp;
}
public Timestamp getnewDate(){
    return newDate;
}
public void setdeleteflg(int flg){
    deleteflg = flg;
}
public int getdeleteflg(){
    return deleteflg;
}





}
