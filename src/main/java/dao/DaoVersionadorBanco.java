package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnection;

public class DaoVersionadorBanco implements Serializable {


	private static final long serialVersionUID = 1L;
	
	
	private Connection connection = null; 
	
	public DaoVersionadorBanco() {
		connection = SingleConnection.getConnection();
	}
	
	public boolean arquivoSqlRodado(String nome_do_arquivo) throws Exception {

		
		
		String sql = "SELECT COUNT(1) > 0 as processado FROM versionadorbanco WHERE arquivo_sql=? ";
		PreparedStatement prepare = connection.prepareStatement(sql);
		prepare.setString(1, nome_do_arquivo);
		ResultSet resultado = prepare.executeQuery();
		
		resultado.next();
		
		return resultado.getBoolean("processado"); 
		
	}
	
	public void gravarSql(String nome_do_arquivo) throws Exception {
		
		String sql = "INSERT INTO versionadorbanco (arquivo_sql) VALUES (?)";
		PreparedStatement prepare = connection.prepareStatement(sql);
		prepare.setString(1, nome_do_arquivo);
		prepare.executeUpdate();
		connection.commit();
		
	}
	
	
}