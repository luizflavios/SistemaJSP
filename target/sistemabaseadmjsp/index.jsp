<!-- 
		Index do sistema: Contém formulário de tela de login (login, senha e submit)
		/* Ainda tem que implementar o registre-se */
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Login </title>
    
    <!-- Favicon icon -->
    
    <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath() %>/assets/images/favicon.png">
    <link href="<%= request.getContextPath() %>/assets/css/style2.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/assets/css/lib/bootstrap.min.css" rel="stylesheet">
</head>

<body class="h-100">
    <div class="authincation h-100" >
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center" style="background-color: #343957">
                <div class="col-md-4">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form" >
                                    <h4 class="text-center mb-3">Realize o Login</h4>
                                    <input type="hidden" value="<%=request.getParameter("url")%>" name="url">
                                    <form action="LoginServlet" method="post">
                                        <div class="form-group">
                                            <label><strong>Login</strong></label>
                                            <input type="text" class="form-control" placeholder="digite seu usuário de login" id="login" name="login" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Senha</strong></label>
                                            <input type="password" class="form-control" placeholder="digite sua senha" id="senha" name="senha" required="required">
                                        </div>

                                        <div class="text-center">
                                            <button type="submit" class="btn btn-dark btn-lg m-b-10 m-l-5" style="width: 30%; background-color: #343957">Logar</button>
                                            
                                        </div>
                                       
                                    </form>

                                </div>
                                <h4 style="text-align: center; color: red;">${msg}</h4> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

		
    <script src="<%= request.getContextPath() %>/assets/js/lib/bootstrap.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/global.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/quixnav-init.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/custom.min.js"></script>

</body>

</html>