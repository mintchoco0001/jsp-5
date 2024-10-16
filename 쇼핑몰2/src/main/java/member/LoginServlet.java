package member;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.ApplicationBufferHandler;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.JDBConnect;
import member.MemberDAO;
import member.MemberDTO;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberDAO dao;

	public void init(ServletConfig config) throws ServletException {
		dao = new MemberDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		int last = uri.lastIndexOf("/");
		String commandStr = uri.substring(last);

		if (commandStr.equals("/loginprocess.login")) {
			loginpro(request, response);
		} else if (commandStr.equals("/addMemberProcess.login")) {
			addmem(request, response);
		}
	}

	void loginpro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		MemberDTO dto = dao.getMemberDTO(id, password);

		if (dto.getId() != null) {
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserName", dto.getName());
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		} else {
			response.sendRedirect("login.jsp?addError=1");
		}
	}

	void addmem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = getServletContext().getRealPath("/sources/images");

		MultipartRequest multi = new MultipartRequest(request, url, 10 * 1024 * 1024, "utf-8",
				new DefaultFileRenamePolicy());

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String filename = multi.getFilesystemName("personImage");
		int re = dao.addMemberDTO(id, password, name, filename);

		if (re == 1) {
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		} else {
			response.sendRedirect("addMember.jsp?error=1");
		}
	}

	public void destroy() {
		dao.close();
	}

}
