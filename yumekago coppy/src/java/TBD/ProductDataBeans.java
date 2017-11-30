/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TBD;

import java.sql.Timestamp;

/**
 *
 * @author guest1Day
 */
public class ProductDataBeans {
    
    private String Name;
    
    private String Description;
    
    private String kensakuWord;
    
    private int _value;
    
    private String Url;
    
    private String Rate;
    
    private String Code;
    
    private int buyID;
    
    private int userID;
    
    private Timestamp newDate;
    
    private int type;
    
    
    
    
public String getName(){
    return Name;
}    
public String getDescription(){
    return Description;
}    
public String getKensakuWord(){
    return kensakuWord;
}
public int get_value(){
    return _value;
}
public String getUrl(){
    return Url;
}
public String getRate(){
    return Rate;
}

public String getCode(){
    return Code;
}

public void setName(String name){
    Name=name;
}
public void setDescription(String description){
    Description=description;
}
public void setKensakuWord(String word){
    kensakuWord=word;
}
public void set_value(String value){
   //受けたString型をIntegerに変換して_valueに格納
    _value=(Integer.parseInt(value));
}
public void setUrl(String url){
    Url=url;
}

public void setRate(String rate){
    Rate=rate;
}

public void setCode(String code){
    Code=code;
}
public int getbuyID(){
    return buyID;
}
public void setbuyID(int buy){
    buyID=buy;
}
public int getuserID(){
    return userID;
}
public void setuserID(int user){
    userID=user;
}
public int gettype(){
    return type;
}
public void settype(int tp){
    type=tp;
}
public Timestamp getnewDate(){
    return newDate;
}
public void setnewDate(Timestamp stamp){
    newDate = stamp;
}
}
