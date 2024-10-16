package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
   public Connection con;
   public Statement stmt;
   public PreparedStatement psmt;
   public ResultSet rs;

   public JDBConnect() {
      try {
         Class.forName("com.mysql.jdbc.Driver");
         String url = "jdbc:mysql://localhost:3306/boardtest";
         String id = "manager";
         String pwd = "1234";
         this.con = DriverManager.getConnection(url, id, pwd);
         System.out.println("DB 접속 성공");
      } catch (Exception var4) {
         System.out.println("DB 접속 실패");
         var4.printStackTrace();
      }

   }

   public void close() {
      try {
         if (this.rs != null) {
            this.rs.close();
         }

         if (this.stmt != null) {
            this.stmt.close();
         }

         if (this.psmt != null) {
            this.psmt.close();
         }

         if (this.con != null) {
            this.con.close();
         }

         System.out.println("DB 종료 성공");
      } catch (Exception var2) {
         System.out.println("DB 종료 실패");
         var2.printStackTrace();
      }

   }
}
