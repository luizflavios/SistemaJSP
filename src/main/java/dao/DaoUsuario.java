package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import model.ModelTelefone;
import model.ModelUsuario;

public class DaoUsuario {

private Connection connection; 
	
	public DaoUsuario() {
		connection = SingleConnection.getConnection(); 
	}
	
	public boolean validarExistencia(String login) throws Exception {
		
		String sql = "SELECT COUNT(1) > 0 AS existe FROM usuario WHERE UPPER(login) = UPPER('" + login + "')";
		PreparedStatement prepareSql = connection.prepareStatement(sql); 
		ResultSet result = prepareSql.executeQuery();
		
		while (result.next()) {
			return result.getBoolean("existe"); 
		}
		
		return false; 
	}

	public void gravarUsuario(ModelUsuario modelo) throws Exception {
		
		if (modelo.isNew()) {
		
			String sql = "INSERT INTO usuario (login, senha, email, cep, logradouro, numero, bairro, cidade, estado, nivelacesso, sexo, nome, dta_cadastro) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement prepare = connection.prepareStatement(sql);
			
			prepare.setString(1, modelo.getLogin());
			prepare.setString(2, modelo.getSenha());
			prepare.setString(3, modelo.getEmail());
			prepare.setString(4, modelo.getCep());
			prepare.setString(5, modelo.getLogradouro());
			prepare.setString(6, modelo.getNumero());
			prepare.setString(7, modelo.getBairro());
			prepare.setString(8, modelo.getCidade()); 
			prepare.setString(9, modelo.getEstado());
			prepare.setString(10, modelo.getNivelAcesso());
			prepare.setString(11, modelo.getSexo());
			prepare.setString(12, modelo.getNome());
			prepare.setDate(13, modelo.getDtaCadastro());
			
			prepare.executeUpdate(); 
			connection.commit();
			
		} else { 
			
			String sql = "UPDATE usuario SET login=?, senha=?, email=?, sexo=?, cep=?, logradouro=?, numero=?, bairro=?, cidade=?, estado=?, nivelacesso=?, nome=? WHERE id = "+modelo.getId()+"";
			PreparedStatement prepare = connection.prepareStatement(sql);

			prepare.setString(1, modelo.getLogin());
			prepare.setString(2, modelo.getSenha());
			prepare.setString(3, modelo.getEmail());
			prepare.setString(4, modelo.getSexo());
			prepare.setString(5, modelo.getCep());
			prepare.setString(6, modelo.getLogradouro());
			prepare.setString(7, modelo.getNumero());
			prepare.setString(8, modelo.getBairro());
			prepare.setString(9, modelo.getCidade()); 
			prepare.setString(10, modelo.getEstado());
			prepare.setString(11, modelo.getNivelAcesso());
			
			prepare.setString(12, modelo.getNome());
			
			
			prepare.executeUpdate(); 
			connection.commit();


			
		}
		
	}

	public List<ModelUsuario> buscaGeral() throws SQLException {
		
		String sql = "SELECT * FROM usuario ORDER BY id";
		PreparedStatement prepareSql = connection.prepareStatement(sql);
		ResultSet result = prepareSql.executeQuery(); 
		
		List<ModelUsuario> retorno = new ArrayList<ModelUsuario>();
		
		while(result.next()) {
			
			ModelUsuario modelo = new ModelUsuario();
			modelo.setId(result.getLong("id"));
			modelo.setNome(result.getString("nome"));
			modelo.setEmail(result.getString("email"));
			modelo.setSexo(result.getString("sexo"));
			modelo.setNivelAcesso(result.getString("nivelacesso"));
			modelo.setLogin(result.getString("login"));
			modelo.setDtaCadastro(result.getDate("dta_cadastro"));
			
			retorno.add(modelo);
			
		}
		
		return retorno;
	}

	/* Métodos de telefone deveriam estar no DAO TELEFONE*/
	
	public ModelTelefone consultaTelefonesUsuario(String id) throws SQLException {
	
		String sql = "SELECT * FROM telefone_usuario WHERE id_usuario="+id;
		PreparedStatement prepareSql = connection.prepareStatement(sql);
		ResultSet resultado = prepareSql.executeQuery();
		
		ModelTelefone modelo = new ModelTelefone();
		
		while(resultado.next()) {
			modelo.setCelular(resultado.getString("celular"));
			modelo.setComercial(resultado.getString("comercial"));
			modelo.setResidencial(resultado.getString("residencial"));
		}
		
		
		
		return modelo; 
		
	}

	public void gravarTelefone(ModelTelefone modelo) throws SQLException {

		if (validaExistenciaTelefone(modelo.getIdUsuario()) == false) {
		
			
			String sql = "INSERT INTO telefone_usuario(celular, residencial, comercial, id_usuario) VALUES (?, ?, ?, ?)";
			PreparedStatement prepareSql = connection.prepareStatement(sql);
			
			prepareSql.setString(1, modelo.getCelular());
			prepareSql.setString(2, modelo.getResidencial());
			prepareSql.setString(3, modelo.getComercial());
			prepareSql.setLong(4, modelo.getIdUsuario());
			
			prepareSql.executeUpdate();
			connection.commit();
			
		
		} else {
			
			String sql = "UPDATE telefone_usuario SET celular=?, residencial=?, comercial=? WHERE id_usuario=" + modelo.getIdUsuario();
			PreparedStatement prepareSql = connection.prepareStatement(sql);
			
			prepareSql.setString(1, modelo.getCelular());
			prepareSql.setString(2, modelo.getResidencial());
			prepareSql.setString(3, modelo.getComercial());
			
			prepareSql.executeUpdate();
			connection.commit();
			
		}
	
		
	}
	

	public Long consultaId(String nome) throws SQLException {
		
		String sql = "select id from usuario where nome like '%" + nome +"%'";
		
		PreparedStatement prepareSql = connection.prepareStatement(sql);
		ResultSet resultado = prepareSql.executeQuery();
		
		ModelUsuario modelo = new ModelUsuario(); 
		
		while (resultado.next()) {
			modelo.setId(resultado.getLong("id"));
		}
		
		Long retorno = modelo.getId();
		
		return retorno;
	}
	
	

	public ModelUsuario consultaUsuarioId(String id) throws SQLException {
		
		String sql = "SELECT * FROM usuario WHERE id=" + id; 
		PreparedStatement prepareSql = connection.prepareStatement(sql); 
		ResultSet resultado = prepareSql.executeQuery(); 
		
			ModelUsuario modelo = new ModelUsuario(); 
		
			while(resultado.next()) {
				
				modelo.setId(resultado.getLong("id"));
				modelo.setLogin(resultado.getString("login"));
				modelo.setSenha(resultado.getString("senha"));
				modelo.setNome(resultado.getString("nome"));
				modelo.setEmail(resultado.getString("email"));
				modelo.setSexo(resultado.getString("sexo"));
				modelo.setNivelAcesso(resultado.getString("nivelacesso"));
				
				modelo.setLogradouro(resultado.getString("logradouro"));
				modelo.setNumero(resultado.getString("numero"));
				modelo.setBairro(resultado.getString("bairro"));
				modelo.setCidade(resultado.getString("cidade"));
				modelo.setCep(resultado.getString("cep"));
				modelo.setEstado(resultado.getString("estado"));
			}
		
		return modelo;

	}
	
	public boolean validaExistenciaTelefone(Long id) throws SQLException {

		String sql = "SELECT COUNT (1) > 0 AS existe FROM telefone_usuario WHERE id_usuario = " +id ;

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		ResultSet resultSet = preparedStatement.executeQuery();

		if (resultSet.next()) {
			return resultSet.getBoolean("existe");
		}

		return false;

	}

	public ModelUsuario consultaUsuarioLogin(String login) throws Exception {
		
		String sql = "SELECT * FROM usuario WHERE login= ?"; 
		PreparedStatement prepareSql = connection.prepareStatement(sql); 
		prepareSql.setString(1, login);
		ResultSet resultado = prepareSql.executeQuery(); 
		
			ModelUsuario modelo = new ModelUsuario(); 
		
			while(resultado.next()) {
				
				modelo.setId(resultado.getLong("id"));
				modelo.setLogin(resultado.getString("login"));
				modelo.setSenha(resultado.getString("senha"));
				modelo.setNome(resultado.getString("nome"));
				modelo.setEmail(resultado.getString("email"));
				modelo.setSexo(resultado.getString("sexo"));
				modelo.setNivelAcesso(resultado.getString("nivelacesso"));
				
				modelo.setLogradouro(resultado.getString("logradouro"));
				modelo.setNumero(resultado.getString("numero"));
				modelo.setBairro(resultado.getString("bairro"));
				modelo.setCidade(resultado.getString("cidade"));
				modelo.setCep(resultado.getString("cep"));
				modelo.setEstado(resultado.getString("estado"));
			}
		
		return modelo;
		
	}

	public List<ModelUsuario> buscaFiltro (String parametroTexto, String parametroFiltro) throws Exception{
		
		List<ModelUsuario> listaRetorno = new ArrayList<ModelUsuario>();
		String sql = "SELECT * FROM USUARIO WHERE UPPER ("+parametroFiltro+") LIKE UPPER ('%"+parametroTexto+"%')";
		PreparedStatement prepareSql = connection.prepareStatement(sql);
		ResultSet resultado = prepareSql.executeQuery();
		
			while(resultado.next()) {
				
				ModelUsuario modelo = new ModelUsuario();
				modelo.setId(resultado.getLong("id"));
				modelo.setNome(resultado.getString("nome"));
				modelo.setEmail(resultado.getString("email"));
				modelo.setSexo(resultado.getString("sexo"));
				modelo.setNivelAcesso(resultado.getString("nivelacesso"));
				modelo.setLogin(resultado.getString("login"));
				
				listaRetorno.add(modelo);
				
			}
			
			return listaRetorno;
		
	}

	public List<ModelUsuario> buscaFiltroData(String dtaInicial, String dtaFinal) throws Exception{
		
		List<ModelUsuario> listaRetorno = new ArrayList<ModelUsuario>();
		String sql = "SELECT * FROM usuario WHERE dta_cadastro >= ? AND dta_cadastro <= ? ORDER BY ID";
		PreparedStatement prepareSql = connection.prepareStatement(sql); 
		prepareSql.setDate(1, Date.valueOf(dtaInicial));
		prepareSql.setDate(2, Date.valueOf(dtaFinal));
		
		ResultSet resultado = prepareSql.executeQuery();
		
		while(resultado.next()) {
			
			ModelUsuario modelo = new ModelUsuario();
			modelo.setId(resultado.getLong("id"));
			modelo.setNome(resultado.getString("nome"));
			modelo.setEmail(resultado.getString("email"));
			modelo.setSexo(resultado.getString("sexo"));
			modelo.setNivelAcesso(resultado.getString("nivelacesso"));
			modelo.setLogin(resultado.getString("login"));
			modelo.setDtaCadastro(resultado.getDate("dta_cadastro"));
			
			listaRetorno.add(modelo);
			
		}
		
		return listaRetorno; 
		
	}

	public Long consultarIdDoUsuario(String nome) throws Exception {
		
		String sql = "SELECT id FROM clientes WHERE nome=?";
		PreparedStatement prepareSql = connection.prepareStatement(sql);
		prepareSql.setString(1, nome);
		
		ResultSet resultado = prepareSql.executeQuery();
		resultado.next(); 
		
		Long x = resultado.getLong("id"); 
		
		
		return x; 
	}

	
}
