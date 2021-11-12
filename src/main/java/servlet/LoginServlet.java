/*
 * SERVLET CRIADA PARA AÇÕES INERENTES AO LOGIN
 * 
 * */
package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoLogin;
import dao.DaoUsuario;
import model.ModelUsuario;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DaoLogin daoLogin = new DaoLogin();
	private DaoUsuario daoUsuario = new DaoUsuario(); 

    public LoginServlet() {
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
			
			request.getSession().invalidate(); //Invalida a sessão. 
			RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
			redirecionar.forward(request, response);
			
		} else {
		
		doPost(request, response);	
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
		
			String login = request.getParameter("login"); 
			String senha = request.getParameter("senha");
			String url = request.getParameter("url"); 
										
					ModelUsuario modelUsuario = new ModelUsuario(); 
					modelUsuario.setLogin(login);
					modelUsuario.setSenha(senha);
					
					if(daoLogin.validarLogin(modelUsuario)) {
						
						modelUsuario = daoUsuario.consultaUsuarioLogin(login);
						
						request.getSession().setAttribute("login", modelUsuario.getLogin());
						request.getSession().setAttribute("nivelAcesso", modelUsuario.getNivelAcesso());
						request.getSession().setAttribute("qntdUsuarios", daoLogin.qntdUsuarios());
						
						
						if (url == null || url.equals("null")) {
							url = "/pages/view/home.jsp";
							
						}
						
						
						RequestDispatcher redirect = request.getRequestDispatcher(url);
						redirect.forward(request, response);
						
					} else {
						RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp");
						request.setAttribute("msg", "Usuário e/ou Senha não existem!");
						redirecionar.forward(request, response);
					}
					
				
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("/pages/erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
		
	}

}
