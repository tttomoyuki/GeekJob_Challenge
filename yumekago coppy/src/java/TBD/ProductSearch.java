/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TBD;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;
import net.arnx.jsonic.JSON;

/**
 *
 * @author taked
 */


public class ProductSearch {
    private static final String APP_ID = "dj00aiZpPUVnTElmclluckdLQSZzPWNvbnN1bWVyc2VjcmV0Jng9YjQ-";

    private static final String BASE_URI = "https://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch";
    
    ArrayList<ProductDataBeans> PDB_List = new ArrayList<ProductDataBeans>();
    
    public ArrayList<ProductDataBeans> ProductSearch(String key) throws MalformedURLException, IOException{
    //URL接続のための処理
            try{URL url = new URL(BASE_URI+"?appid="+APP_ID+"&query="+key);
            
            HttpURLConnection urlconn = (HttpURLConnection)url.openConnection();
            
            urlconn.setRequestMethod("GET");
            
            urlconn.setInstanceFollowRedirects(false);
            
            urlconn.connect();
            
            //urlから中の情報を取り出す処理（json）
            BufferedReader reader =new BufferedReader(new InputStreamReader(urlconn.getInputStream()));
 
            StringBuffer responseBuffer = new StringBuffer();
               while (true){
                   String line = reader.readLine();
                   if ( line == null ){
                       break;
                   }
                   responseBuffer.append(line);
               }
               reader.close();
               
               urlconn.disconnect();
 
               String jsonText= responseBuffer.toString();
               Map<String, Map<String, Object>> json = JSON.decode(jsonText);
               
               
               
              @SuppressWarnings("unchecked")
                      Map<String, Object> resultnumber = ((Map<String, Object>)(
                     (Map<String, Map<String,Object>>)json.get("ResultSet").get("0")).get("Result"));    
                  
              
                int num =0;
                for(num=0 ; num<10 ; num++){
                  String number=String.valueOf(num);
              @SuppressWarnings("unchecked")
                      Map<String, Object> price = ((Map<String, Object>)(
                     (Map<String, Map<String, Map<String,Object>>>)json.get("ResultSet").get("0")).get("Result").get("0").get("Price"));
              
              @SuppressWarnings("unchecked")
                      Map<String, Object> review = ((Map<String, Object>)(
                     (Map<String, Map<String, Map<String,Object>>>)json.get("ResultSet").get("0")).get("Result").get("0").get("Review"));
              
              @SuppressWarnings("unchecked")
                      Map<String, Object> result = ((Map<String, Object>)(
                     (Map<String, Map<String, Object>>)json.get("ResultSet").get("0")).get("Result").get(number));
              
              @SuppressWarnings("unchecked")
              
                      String imageUrl = ((Map<String, Object>)result.get("Image")).get("Medium").toString();
                      String name = result.get("Name").toString();
                      String description = result.get("Description").toString();
                      String rate = review.get("Rate").toString();
                      String code = result.get("Code").toString();
                      
              
              //searchjspにリクエストスコープで送るためにProductDataBeansインスタンスに格納する。
              ProductDataBeans PDB = new ProductDataBeans();
              
              PDB.setName(name);
              PDB.setUrl(imageUrl);
              PDB.set_value(price.get("_value").toString());
              PDB.setKensakuWord(key);
              PDB.setDescription(description);
              PDB.setRate(rate);
              PDB.setCode(code);
              PDB_List.add(PDB);
              }
                return PDB_List;
            }catch(Exception e){
                return PDB_List;
            }
    } 
    
}
