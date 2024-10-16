package member;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
   public MemberDTO getMemberDTO(String id, String password) {
      MemberDTO dto = new MemberDTO();
      String query = "select * from member where id=? and password=?";

      try {
         this.psmt = this.con.prepareStatement(query);
         this.psmt.setString(1, id);
         this.psmt.setString(2, password);
         this.rs = this.psmt.executeQuery();
         if (this.rs.next()) {
            dto.setId(this.rs.getString(1));
            dto.setPassword(this.rs.getString(2));
            dto.setName(this.rs.getString(3));
            dto.setGender(this.rs.getString(4));
            dto.setBirth(this.rs.getString(5));
            dto.setMail(this.rs.getString(6));
            dto.setPhone(this.rs.getString(7));
            dto.setAddress(this.rs.getString(8));
            dto.setRegist_day(this.rs.getString(9));
         }
      } catch (Exception e) {
         System.out.println("DB 연결 실패");
      }

      return dto;
   }

   public int addMemberDTO(String id, String password, String name, String filename) {
      int result = 0;
      String query1 = "select * from member";

      String query2;
      try {
         this.psmt = this.con.prepareStatement(query1);
         this.rs = this.psmt.executeQuery();

         while(this.rs.next()) {
            query2 = this.rs.getString(1);
            if (id.equals(query2)) {
               result = 2;
               break;
            }
         }
      } catch (Exception var9) {
         System.out.println("회원 검색 실패");
      }

      if (result == 0) {
         query2 = "insert into member(id,password,name) values(?,?,?,?)";

         try {
            this.psmt = this.con.prepareStatement(query2);
            this.psmt.setString(1, id);
            this.psmt.setString(2, password);
            this.psmt.setString(3, name);
            this.psmt.setString(4, filename);
            result = this.psmt.executeUpdate();
         } catch (Exception e) {
            System.out.println("DB 연결 실패");
         }
      }

      return result;
   }

   public int deleteMemberDTO(String id, String password) {
      int result = 0;
      String query1 = "select * from member where id=? and password=?";

      String query2;
      try {
         this.psmt = this.con.prepareStatement(query1);
         this.psmt.setString(1, id);
         this.psmt.setString(2, password);
         this.rs = this.psmt.executeQuery();

         while(this.rs.next()) {
            query2 = this.rs.getString(2);
            if (password.equals(query2)) {
               result = 1;
            }
         }
      } catch (Exception e) {
         System.out.println("회원 탈퇴에서 회원검색 실패");
      }

      if (result == 1) {
         query2 = "delete from member where id=? and password=?";

         try {
            this.psmt = this.con.prepareStatement(query2);
            this.psmt.setString(1, id);
            this.psmt.setString(2, password);
            result = this.psmt.executeUpdate();
         } catch (Exception e) {
            System.out.println("회원 삭제 실패");
         }
      }

      return result;
   }
}
