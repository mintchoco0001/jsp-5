package board;

import common.JDBConnect;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO extends JDBConnect {
   public int selectCount(String items, String text) {
      int totalCount = 0;
      String query = "select count(*) from board";
      if (text != null) {
         query = query + " where " + items + " like '%" + text + "%'";
      }

      try {
         this.stmt = this.con.createStatement();
         this.rs = this.stmt.executeQuery(query);
         this.rs.next();
         totalCount = this.rs.getInt(1);
      } catch (Exception var6) {
         System.out.println("게시물 게수 구하기 오류");
         var6.printStackTrace();
      }

      return totalCount;
   }

   public ArrayList<BoardDTO> getBoardList(String items, String text, int pageSize, int start) {
      ArrayList<BoardDTO> list = new ArrayList();
      String query = "select * from board";
      if (text != null) {
         query = query + " where " + items + " like '%" + text + "%'";
      }

      query = query + " order by num desc";
      query = query + " limit ?, ?";

      try {
         this.psmt = this.con.prepareStatement(query);
         this.psmt.setInt(1, start);
         this.psmt.setInt(2, pageSize);
         this.rs = this.psmt.executeQuery();

         while(this.rs.next()) {
            BoardDTO dto = new BoardDTO();
            dto.setNum(this.rs.getInt("num"));
            dto.setName(this.rs.getString("name"));
            dto.setSubject(this.rs.getString("subject"));
            dto.setContent(this.rs.getString("content"));
            dto.setRegist_day(this.rs.getString("regist_day"));
            dto.setHit(this.rs.getInt("hit"));
            dto.setIp(this.rs.getString("ip"));
            dto.setPassword(this.rs.getString("password"));
            list.add(dto);
         }
      } catch (Exception var8) {
         var8.printStackTrace();
         System.out.println("게시물 가져오기 오류");
      }

      return list;
   }

   public int insertBoard(BoardDTO dto) {
      Date today = new Date();
      SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
      int result = 0;

      try {
         String query = "insert into board(name,subject,content,regist_day,hit,ip,password) values(?,?,?,?,0,?,?)";
         this.psmt = this.con.prepareStatement(query);
         this.psmt.setString(1, dto.getName());
         this.psmt.setString(2, dto.getSubject());
         this.psmt.setString(3, dto.getContent());
         this.psmt.setString(4, sd.format(today));
         this.psmt.setString(5, dto.getIp());
         this.psmt.setString(6, dto.getPassword());
         result = this.psmt.executeUpdate();
      } catch (Exception var6) {
         var6.printStackTrace();
         System.out.println("게시글 추가하기 오류");
      }

      return result;
   }

   public void hitCount(String num) {
      String query = "update board set hit=hit+1 where num=?";

      try {
         this.psmt = this.con.prepareStatement(query);
         this.psmt.setString(1, num);
         this.psmt.executeUpdate();
      } catch (Exception var4) {
         var4.printStackTrace();
         System.out.println("게시물 조회수 증가 오류");
      }

   }

   public BoardDTO selectView(String num) {
      BoardDTO dto = new BoardDTO();
      String query = "select * from board where num=?";

      try {
         this.psmt = this.con.prepareStatement(query);
         this.psmt.setString(1, num);
         this.rs = this.psmt.executeQuery();
         if (this.rs.next()) {
            dto.setNum(this.rs.getInt("num"));
            dto.setName(this.rs.getString("name"));
            dto.setSubject(this.rs.getString("subject"));
            dto.setContent(this.rs.getString("content"));
            dto.setRegist_day(this.rs.getString("regist_day"));
            dto.setHit(this.rs.getInt("hit"));
            dto.setIp(this.rs.getString("ip"));
            dto.setPassword(this.rs.getString("password"));
         }
      } catch (Exception var5) {
         var5.printStackTrace();
         System.out.println("게시물 세부내용 보기 오류");
      }

      return dto;
   }
}
