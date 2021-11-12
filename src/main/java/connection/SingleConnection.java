package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {
	
	private static String urlBD = "jdbc:postgresql://ec2-3-221-140-141.compute-1.amazonaws.com:5432/d58ic16512rj2c";
	private static String userBD = "wmfipcblgorahh";
	private static String passwordBD = "d98f307fe94144f8e963d2fd1e8897c366e859fc4d42d6fd8a11d9d40d23f63e";
	private static Connection connection = null; 
	
	public static Connection getConnection() {
		return connection;
	}
	
	static {
		conectar();
	}
	
	public SingleConnection() {
		conectar();
	}
	
	private static void conectar() {
		
		try {
			
			if(connection == null) {
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(urlBD, userBD, passwordBD);
				connection.setAutoCommit(false);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
