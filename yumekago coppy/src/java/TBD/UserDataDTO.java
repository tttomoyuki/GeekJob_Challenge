/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TBD;
//ユーザー情報用のjavabeans
//データベースのカラムと型に対応させている。

import java.sql.Timestamp;
import java.util.Date;

//DBに送るデータ、DBから受け取るデータ、どちらもこのクラスのインスタンスを使用する。
/**
 *
 * @author guest1Day
 */
public class UserDataDTO {
   private int UserID;
   private String Name;
   private String passward;
   private String mail;
   private String address;
   private int total;
   private Timestamp datetime;
   private int deleteflg;
   
   public int getUserID() {
       return UserID;
   }
   public void setUserID(int userID) {
       this.UserID =userID;
   }

   public String getName() {
       return Name;
   }
   public void setName(String Name) {
       this.Name =Name;
   }
   public String getpassward() {
       return passward;
   }
   public void setpassward(String passward) {
       this.passward =passward;
}
   public String getmail() {
       return mail;
   }
   public void setmail(String mail) {
       this.mail =mail;
   }
   
   public String address() {
       return address;
   }
   public void setaddress(String address) {
       this.address =address;
   }
   
   public int gettotal() {
       return total;
   }
   public void settotal(int total) {
       this.total =total;
   }
   
   public Timestamp getdatetime() {
        return datetime;
    }
    public void setNewDate(Timestamp datatime) {
        this.datetime = datatime;
    }
    
    public int setdeleteflg() {
       return deleteflg;
   }
   public void setdeleteflg(int deleteflg) {
       this.deleteflg =deleteflg;
   }
}
   






