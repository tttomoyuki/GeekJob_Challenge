/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TBD;

import base.DBManager;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author taked
 */
public class UserDataDAO {
    Connection con = null;
    PreparedStatement st = null;
    
    
    public static UserDataDAO getInstance(){
        UserDataDAO UDD = new UserDataDAO();
        return UDD;
    }
    
    public static void insert(UserDataBeans udb) throws SQLException{
        
        Connection con = null;
    PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st =  con.prepareStatement("INSERT INTO user_t (name,password,mail,address,newDate) values(?,?,?,?,?)");
            st.setString(1,udb.getName());
            st.setString(2, udb.getpassword());
            st.setString(3,udb.getmail());
            st.setString(4,udb.getaddress());
            st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            st.executeUpdate();
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            con.close();
    }
    }
    
    public static void insert_buy(ProductDataBeans pdb, String type, String key) throws SQLException{
        Connection con = null;
    PreparedStatement st = null;
        try{
            
            con = DBManager.getConnection();
            st =  con.prepareStatement("INSERT INTO buy_t (userID,itemCode,type,buyDate,money) values(?,?,?,?,?)");
            st.setString(1,key);
            st.setString(2,pdb.getCode());
            st.setString(3,type);
            st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            st.setInt(5,pdb.get_value());
            
            st.executeUpdate();
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            con.close();
    }
    }
    public static UserDataBeans search(UserDataBeans udb) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st =con.prepareStatement("select * from user_t where name=? and password=?");
            st.setString(1, udb.getName());
            st.setString(2, udb.getpassword());
            
            ResultSet rs = st.executeQuery();
            
            rs.next();
            udb.setuserID(rs.getInt("userID"));
            udb.setName(rs.getString("name"));
            udb.setpassword(rs.getString("password"));
            udb.setmail(rs.getString("mail"));
            udb.setaddress(rs.getString("address"));
            udb.settotal(rs.getInt("total"));
            udb.setnewDate(rs.getTimestamp("newDate"));
            udb.setdeleteflg(rs.getInt("deleteFlg"));
            
            return udb;
        }catch(SQLException e){
            System.out.println(e.getMessage());   
            return udb;
        }finally{
            con.close();
        }
    }
    public static ArrayList<ProductDataBeans> search_buy(String key) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
         ArrayList<ProductDataBeans> PDB_List = new ArrayList<ProductDataBeans>();
        try{
            
            con = DBManager.getConnection();
            st =con.prepareStatement("select * from buy_t where userID=?");
            st.setInt(1, Integer.parseInt(key));
            
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
            ProductDataBeans pdb = new ProductDataBeans();
            pdb.setbuyID(rs.getInt("buyID"));
            pdb.setuserID(rs.getInt("userID"));
            pdb.setCode(rs.getString("itemCode"));
            pdb.settype(rs.getInt("type"));
            pdb.setnewDate(rs.getTimestamp("buyDate"));
            pdb.set_value(String.valueOf(rs.getInt("money")));
            PDB_List.add(pdb);
            }
            return PDB_List;
        }catch(SQLException e){
            System.out.println(e.getMessage());   
            return PDB_List;
        }finally{
            con.close();
        }
    }
   public static void deleteflg(UserDataBeans udb) throws SQLException{
        
        Connection con = null;
    PreparedStatement st = null;
        try{
            con = DBManager.getConnection();
            st =  con.prepareStatement("UPDATE user_t set deleteflg=1 where userID=?");
            st.setInt(1,udb.getuserID());
            st.executeUpdate();
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            con.close();
    }
    }
   public static void update(UserDataBeans udb, String key) throws SQLException{
        
        Connection con = null;
    PreparedStatement st = null;
        try{
            con = DBManager.getConnection();//UPDATE	表名SET	列名 = 値,列名 = 値...WHERE	条件
            st =  con.prepareStatement("UPDATE user_t set name=?,password=?,mail=?,address=? where userID=?");
            st.setString(1,udb.getName());
            st.setString(2, udb.getpassword());
            st.setString(3,udb.getmail());
            st.setString(4,udb.getaddress());
            st.setInt(5,Integer.parseInt(key));
            st.executeUpdate();
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            con.close();
    }
    }
   public void update_total(ProductDataBeans pdb,String key)throws SQLException{
            Connection con = null;
            PreparedStatement st = null;
          try{
            con = DBManager.getConnection();
            st =  con.prepareStatement("UPDATE user_t SET total = total+? WHERE userID=? ");
       
            st.setInt(1,pdb.get_value());
            st.setString(2,key);
            st.executeUpdate();
   }catch (SQLException e){
          System.out.println(e.getMessage());  
   }finally{
            con.close();
   }
}
   public int select_total(String key)throws SQLException{
            Connection con = null;
            PreparedStatement st = null;
   try{
       con = DBManager.getConnection();
       st = con.prepareStatement("SELECT * FROM user_t where userID = ?");
   
            st.setString(1,key);
            ResultSet rs = st.executeQuery();
            
            rs.next();
            int i = rs.getInt("total");
            return i;
   }catch(Exception e){
       return 0;
   }
}
}
