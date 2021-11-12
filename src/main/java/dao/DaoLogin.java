package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnection;
import model.ModelUsuario;

public class DaoLogin {
	
private Connection connection; 
	
	public DaoLogin() {
		connection = SingleConnection.getConnection(); 
	}

	public boolean validarLogin(ModelUsuario modelo) throws Exception {
		
		String sql = "SELECT * FROM usuario WHERE login=? AND senha=?";
		PreparedStatement prepareSql = connection.prepareStatement(sql); 
		
		prepareSql.setString(1, modelo.getLogin());
		prepareSql.setString(2, modelo.getSenha());
		
		ResultSet resultado = prepareSql.executeQuery(); 
		
		while(resultado.next()) {
			return true; 
		}
		
		return false; 
	}
	
	public int qntdUsuarios() throws Exception{
		
		String sql = "SELECT COUNT (login) AS quantidade FROM usuario";
		PreparedStatement prepareSql = connection.prepareStatement(sql); 
		ResultSet resultado = prepareSql.executeQuery(); 
		int retorno = 0; 
		
		while(resultado.next()) {
			retorno = resultado.getInt("quantidade"); 
		}
		
		return retorno; 
	}

}
