/*
 * Filtro de autentincação usado para impedir que usuário force a URL
 * Falta corrigir: -BUG DA TELA DE LOGIN
 * 				   -FAZER O FILTRO DAS PAGINAS QUE FAZEM A CHAMADA DA SERVLET NA URL
 * */
package filter;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import connection.SingleConnection;
import dao.DaoVersionadorBanco;


@WebFilter(urlPatterns = { "/pages/view/*"})
public class AutenticationFilter implements Filter {
 
	
	private Connection connection; 
   
    public AutenticationFilter() {
       
    } 

	
	public void destroy() { 
		try {
			connection.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		try {

			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("login");
			String urlParaAutenticar = req.getServletPath(); 

			if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/pages/LoginServlet")) {

				RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp?=url=" + urlParaAutenticar ); 
				request.setAttribute("msg",
						"Por favor, recarregue a pagina e realize o login para poder acessar os conteúdos desta aplicação");
				
				redirecionar.forward(request, response);
				return; /* Para a execução e redireciona para o Login */

			} else {

				chain.doFilter(request, response);

			}
			
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("/pages/erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			
			try {
				connection.rollback();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
		}

		}


	/* Inicia os processos quando o servidor sobe a aplicação */
	public void init(FilterConfig fConfig) throws ServletException {
		
		connection = SingleConnection.getConnection();
		
		DaoVersionadorBanco daoVersionador = new DaoVersionadorBanco();
		String caminhoPastaSql = fConfig.getServletContext().getRealPath("versionadorsql") + File.separator; 
		File[] files = new File(caminhoPastaSql).listFiles();
		
		try {
			
			
			for (File file : files) {
				boolean arquivoProcessado = daoVersionador.arquivoSqlRodado(file.getName());
				
				if(!arquivoProcessado) {
					FileInputStream entrada = new FileInputStream(file); 
					Scanner ler = new Scanner(entrada, "UTF-8"); 
					
					StringBuilder stringBuilder = new StringBuilder();
					
					while(ler.hasNext()) {
						stringBuilder.append(ler.nextLine());
						stringBuilder.append("\n");
					}
					
					connection.prepareStatement(stringBuilder.toString()).execute();
					daoVersionador.gravarSql(file.getName());
					connection.commit();
					ler.close();
					
				}
				
			}
			
			
			
			
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
			
		
	}
	
	}