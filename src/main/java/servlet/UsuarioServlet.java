/*
 * SERVLET CRIADA PARA AÇÕES INERENTES AO MODELO USUÁRIO
 * 
 * */
package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoUsuario;
import model.ModelTelefone;
import model.ModelUsuario;


@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DaoUsuario daoUsuario = new DaoUsuario(); 

   
    public UsuarioServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
		String acao = request.getParameter("acao");
		
		
		if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUsuarios")) {

			List<ModelUsuario> listUser = daoUsuario.buscaGeral();

//			request.setAttribute("msg", "Usuários carregados");
			request.setAttribute("listaUsuarios", listUser);			
			request.getRequestDispatcher("pages/view/lista.jsp").forward(request, response);

		} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarTelefone")) {
			
			String id = request.getParameter("id"); 
			
			ModelTelefone modelo = daoUsuario.consultaTelefonesUsuario(id);
			
			ObjectMapper mapper = new ObjectMapper();

			String json = mapper.writeValueAsString(modelo);
			
			response.getWriter().write(json);
			
			
		} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEndereco")) {
			
			String id = request.getParameter("id"); 
			
			ModelUsuario modelo = daoUsuario.consultaUsuarioId(id);
			
			ObjectMapper mapper = new ObjectMapper();

			String json = mapper.writeValueAsString(modelo);
			
			response.getWriter().write(json);
			
			
		} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("editarDados")) {
			
			String id = request.getParameter("id"); 
			
			ModelUsuario modeloUsuario = daoUsuario.consultaUsuarioId(id);
			ModelTelefone modelTelefone = daoUsuario.consultaTelefonesUsuario(id);
			
			request.setAttribute("msg", "Edite o usuário");
			request.setAttribute("usuario", modeloUsuario);
			request.setAttribute("telefone", modelTelefone);
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("pages/view/usuario.jsp");
			redirecionar.forward(request, response);
	
		} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("filtrar")) {
								
			String parametroFiltro = request.getParameter("parametroFiltro");
			List<ModelUsuario> listUser = null;
			
			if(parametroFiltro.equalsIgnoreCase("Data de Cadastro")) {
			
				 
				String dtaInicial = request.getParameter("dtaInicial");	
				String dtaFinal = request.getParameter("dtaFinal");	
				
				listUser = daoUsuario.buscaFiltroData( dtaInicial, dtaFinal); 
			
			} else {
			
				String parametroTexto = request.getParameter("parametroTexto");				
				
				
				if ((parametroFiltro.isEmpty() || parametroFiltro == null) || (parametroTexto.isEmpty() || parametroTexto == null)) {
					
					listUser = daoUsuario.buscaGeral();
					
				} else {
					
					listUser = daoUsuario.buscaFiltro(parametroTexto, parametroFiltro);
					
				}
			
			}

			request.setAttribute("listaUsuarios", listUser);			
			request.getRequestDispatcher("pages/view/lista.jsp").forward(request, response);			

		}
		
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("pages/erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
			String msg = "Operação realizada com sucesso!";
			
			String id = request.getParameter("id"); 
			String login = request.getParameter("login"); 
			String senha = request.getParameter("senha"); 
			String nome = request.getParameter("nome"); 
			String email = request.getParameter("email");
			String nivelAcesso = request.getParameter("nivelAcesso"); 
			String sexo = request.getParameter("sexo"); 
			
			String cep = request.getParameter("cep"); 
			String logradouro = request.getParameter("logradouro"); 
			String numero = request.getParameter("numero"); 
			String bairro = request.getParameter("bairro"); 
			String cidade = request.getParameter("cidade"); 
			String estado = request.getParameter("uf"); 
			

			String celular = request.getParameter("celular");
			String residencial = request.getParameter("residencial"); 
			String comercial = request.getParameter("comercial"); 
			
				ModelUsuario modelo = new ModelUsuario();
				modelo.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
				modelo.setLogin(login);
				modelo.setSenha(senha);
				modelo.setEmail(email);
				modelo.setNome(nome);
				modelo.setCep(cep);
				modelo.setLogradouro(logradouro);
				modelo.setNumero(numero);
				modelo.setBairro(bairro);
				modelo.setCidade(cidade);
				modelo.setEstado(estado);
				modelo.setNivelAcesso(nivelAcesso);
				modelo.setSexo(sexo);
				java.util.Date data = new java.util.Date();  
				java.sql.Date dataSql = new java.sql.Date(data.getTime());
				modelo.setDtaCadastro(dataSql);


					
					if (modelo.isNew()) {
						msg = "Usuario gravado com sucesso"; 
					} else {
						msg = "Atualizado com sucesso";
					}
					
					daoUsuario.gravarUsuario(modelo);
					
					
					Long idUsuario = daoUsuario.consultaId(modelo.getNome()); 
					
					ModelTelefone modeloTelefone = new ModelTelefone(); 
					modeloTelefone.setCelular(celular);
					modeloTelefone.setResidencial(residencial);
					modeloTelefone.setComercial(comercial);
					modeloTelefone.setIdUsuario(idUsuario);
					
					daoUsuario.gravarTelefone(modeloTelefone);
					request.setAttribute("msg", msg);
					request.setAttribute("usuario", modelo);
					request.setAttribute("telefone", modeloTelefone);
					request.getRequestDispatcher("pages/view/usuario.jsp").forward(request, response);
					
					} catch (Exception e){
					e.printStackTrace();
					RequestDispatcher redirecionar = request.getRequestDispatcher("pages/erro.jsp");
					request.setAttribute("msg", e.getMessage());
					redirecionar.forward(request, response);
				}
				
	}
				
	 
	}


