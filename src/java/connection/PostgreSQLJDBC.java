/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

/**
 *
 * @author Dell
 */


import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Vector;

public class PostgreSQLJDBC {
    private ResultSetMetaData rsm=null;
    private Connection con = null;
    private Statement stmt = null;
    private Vector rowData=null;  
    private ResultSet rs=null;
    public PostgreSQLJDBC(){
        try
        {
            if(con==null)
            {
                System.out.println("postconnection");
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/collegemanagementsystem",
                "postgres", "11222431");
                stmt= con.createStatement();
                System.out.println("postconnection"+con);
                System.out.println("post"+stmt);
            } 
        }        
        catch(Exception er)
        {
            System.out.println("DB Access failed.."+er);
        }
    }
    
    public int putData(String qry){
       try{
           return stmt.executeUpdate(qry);
       }catch(Exception e){
           System.out.println("Access failed..eeee"+e);
       }
       return 0;
    }
    public Vector getData(String qry){
        try{            
            rowData=new Vector();
            rs=stmt.executeQuery(qry);
            rsm=rs.getMetaData();
            int colCount=rsm.getColumnCount();
            while(rs.next()){
                Vector colVector=new Vector();
                for(int i=0;i<colCount;i++){
                    colVector.add(rs.getString((i+1)));
                }
                rowData.add(colVector);
            }  
            System.out.println( "rowData = " +rowData );
            return rowData;
        }catch(Exception e){
            System.out.println("Access failed..");
        }
        
        return rowData;
    }
    
    public Connection getConnection (){
            return con;
        }
        
}


