package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoUsuario;
import model.ModelUsuario;
import util.ReportUtil;

@WebServlet("/RelatorioServlet")
public class RelatorioServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DaoUsuario dao = new DaoUsuario();

    public RelatorioServlet() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String acao = request.getParameter("acao"); 
			
			if (acao.equalsIgnoreCase("gerarPdf")) {
				
				String parametroRelatorio = request.getParameter("parametroRelatorio");
				List<ModelUsuario> listaRetorno = null; 
				
				if(parametroRelatorio.equalsIgnoreCase("Data de Cadastro")) {
					
					String dtaInicial = request.getParameter("dtaInicial"); 
					String dtaFinal = request.getParameter("dtaFinal");
					listaRetorno = dao.buscaFiltroData(dtaInicial, dtaFinal);
					
				} else {
					
					listaRetorno = dao.buscaGeral();
					
				}
				
				byte[] relatorio = new ReportUtil().gerarRelatorioPDF(listaRetorno, "relatorio-usuario", getServletContext()) ;
				response.setHeader("Content-Disposition", "attachment;filename=arquivo.pdf");
				response.getOutputStream().write(relatorio);
				
				
			} else if (acao.equalsIgnoreCase("gerarExcel")) {
				
				
				
			}
			
/*			RequestDispatcher redirecionar = request.getRequestDispatcher("pages/view/relatorio.jsp");
			redirecionar.forward(request, response);*/
			
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("pages/erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
