package board;

public class BoardDTO {
   private int num;
   private String name;
   private String subject;
   private String content;
   private String regist_day;
   private int hit;
   private String ip;
   private String password;
   private int vNum;

   public int getvNum() {
      return this.vNum;
   }

   public void setvNum(int vNum) {
      this.vNum = vNum;
   }

   public int getNum() {
      return this.num;
   }

   public void setNum(int num) {
      this.num = num;
   }

   public String getName() {
      return this.name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getSubject() {
      return this.subject;
   }

   public void setSubject(String subject) {
      this.subject = subject;
   }

   public String getContent() {
      return this.content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getRegist_day() {
      return this.regist_day;
   }

   public void setRegist_day(String regist_day) {
      this.regist_day = regist_day;
   }

   public int getHit() {
      return this.hit;
   }

   public void setHit(int hit) {
      this.hit = hit;
   }

   public String getIp() {
      return this.ip;
   }

   public void setIp(String ip) {
      this.ip = ip;
   }

   public String getPassword() {
      return this.password;
   }

   public void setPassword(String password) {
      this.password = password;
   }
}
