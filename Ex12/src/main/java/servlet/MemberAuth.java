package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.memberDAO;
import membership.memberDTO;

public class MemberAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;

	memberDAO dao;

	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();

		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");

		dao = new memberDAO(driver, connectUrl, oId, oPass);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id");

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		memberDTO dto = dao.getMemberDTO(id, pass);

		String memberName = dto.getName();
		if (memberName != null) {
			request.setAttribute("authMessage", memberName + " 회원님 안녕하세요.");
		} 
		else {
			if (admin_id.equals(id)) {
				request.setAttribute("authMessage", admin_id + " 님은 최고 관리자 입니다");
			} else {
				request.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
			}
		}
		request.getRequestDispatcher("MemberAuth.jsp").forward(request, response);
	}

	public void destroy() {
		dao.close();
	}

}
