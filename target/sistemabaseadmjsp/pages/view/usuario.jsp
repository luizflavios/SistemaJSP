<!--
		Tela de cadastro de novos usuários, possui atributos: (id, nome, login, senha, email, sexo, nivel de Acesso, dados de endereço e telefone)
		** Comentários nos blocos	  
-->

<%@page import="model.ModelUsuario"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<jsp:include page="/pages/head.jsp"></jsp:include>
<body>
	<jsp:include page="/pages/sidebar.jsp"></jsp:include>
	<jsp:include page="/pages/topbar.jsp"></jsp:include>


	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 p-r-0 title-margin-right">
						<div class="page-header">
							<div class="page-title">
								<h1>Cadastrar Usuários</h1> <h5 style="text-align: center; color: red;">${msg}</h5> 
							</div>
						</div>
					</div>

					<!-- /# column -->
				</div>
				<!-- /# row -->
				<section id="main-content">
				<form action="<%=request.getContextPath() %>/UsuarioServlet" method="post" id="form_usuario" name="form_usuario">
					<div class="card">
							<div class="card-title">
                               <h4>Dados Pessoais</h4>                                    
                            </div>
							<div class="row">
								<div class="col-lg-6">
									<input type="hidden" name="acao" id="acao" value="">

									<div class="form-group">
										<label>Id</label> <input class="form-control" type="text" name="id" id="id"
											value="${usuario.id}" readonly="">
									</div>
									
									<div class="form-group">
										<label>Nome</label> <input type="text" class="form-control"
											value="${usuario.nome}" name="nome" id="nome" required="required">
									</div>

									<div class="form-group">
										<label>Login</label> <input type="text" class="form-control"
											value="${usuario.login}" name="login" id="login" required="required">
									</div>

									<div class="form-group">
										<label>Password</label> <input class="form-control"
											value="${usuario.senha}" type="password" name="senha" id="senha" required="required">
									</div>


								

								



								</div>
								<div class="col-lg-6">
								
									<div class="form-group">
										<label>Email</label> <input class="form-control" type="email"
											value="${usuario.email}" id="email" name="email" required="required">
									</div>



									
									<div class="form-group">
										<label>Nível de Acesso</label> 
											<select class="form-control" name="nivelAcesso" id="nivelAcesso">
											

										
											<option value="Administracao" >Administracao</option>
											
											<option value="Intermediario">Intermediario</option>
											
											<option value="Basico" selected="selected">Basico</option>
											
										</select>
									</div>
									
										
									<div class="form-group">
										<label>Sexo</label> <select class="form-control" name="sexo" id="sexo">
										
											<option value="Masculino" >Masculino</option>
											
											<option value="Feminino" >Feminino</option>
											
										</select>
									</div>
								</div>

							</div>
							

							</div>
							
							<div class="card">
							
							<div class="card-title">
                               <h4>Dados do Endereço</h4>                                    
                            </div>
							<div class="row">
								<div class="col-lg-6">
								
									<div class="form-group">
										<label>CEP</label> <input class="form-control" type="text"
											value="${usuario.cep}" id="cep" name="cep" onblur="pesquisaCep();" onkeypress="return onlynumber();" required="required">
									</div>
								
									<div class="form-group">
										<label>Logradouro</label> <input class="form-control"
											type="text" id="logradouro" name="logradouro"
											value="${usuario.logradouro}" onclick="teste();" readonly="readonly">
									</div>
									<div class="form-group">
										<label>Numero</label> <input class="form-control" type="text"
											value="${usuario.numero}" id="numero" name="numero" onkeypress="return onlynumber();" required="required">
									</div>

							
								</div>
								
								<div class="col-lg-6">

								<div class="form-group">
										<label>Bairro</label> <input class="form-control" type="text"
											value="${usuario.bairro}" id="bairro" name="bairro"  readonly="readonly">
									</div>
									<div class="form-group">
										<label>Cidade</label> <input class="form-control" type="text"
											value="${usuario.cidade}" id="cidade" name="cidade"  readonly="readonly">
									</div>
									<div class="form-group">
										<label>Estado</label> <input class="form-control" type="text"
											id="uf" name="uf" value="${usuario.estado}"  readonly="readonly">
									</div>
									
								</div>
								
							</div>
							</div>
							
							<div class="card">
							
							<div class="card-title">
                               <h4>Telefones</h4>                                    
                            </div>
							<div class="row">
								<div class="col-lg-6">
								
									<div class="form-group">
										<label>Celular</label> <input class="form-control" type="text" value="${telefone.celular}" 
											id="celular" name="celular" onkeypress="return onlynumber();" >
									</div>
									
									<div class="form-group">
										<label>Residencial</label> <input class="form-control" type="text" value="${telefone.residencial}" 
											id="residencial" name="residencial" onkeypress="return onlynumber();" >
									</div>
									
									<div class="form-group">
										<label>Comercial</label> <input class="form-control" type="text" value="${telefone.comercial}" 
											id="comercial" name="comercial" onkeypress="return onlynumber();" >
									</div>
									
								<div class="form-group">
									<button class="btn btn-success btn-flat btn-lg m-b-10 m-l-5" value="Salvar" style="margin-top: 15px">Salvar</button>
									<button type="button" class="btn btn-warning btn-flat btn-lg m-b-10 m-l-5" style="margin-top: 15px; margin-left: 15px;" onclick="limparFormulario();">Limpar</button>
					
								</div>
							
								</div>
								
								<div class="col-lg-6">


									
								</div>
								
							</div>
							</div>
						</form>
					
					
					


				</section>

				<div class="row">
					<div class="col-lg-12">
						<div class="footer">
							<p>
								2021 © LF Dev. - <a href="#">example.com</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
	
	
	function teste() {
		
		var select = document.getElementById("logradouro").removeAttribute("readonly");
		var select = document.getElementById("bairro").removeAttribute("readonly");

		
	}
	
	
	/* Função para aceitar input apenas de numeros */
	
	function onlynumber(evt) {
		   var theEvent = evt || window.event;
		   var key = theEvent.keyCode || theEvent.which;
		   key = String.fromCharCode( key );
		   //var regex = /^[0-9.,]+$/;
		   var regex = /^[0-9.]+$/;
		   if( !regex.test(key) ) {
		      theEvent.returnValue = false;
		      if(theEvent.preventDefault) theEvent.preventDefault();
		   }
		}
	
	/* Função para pesquisa de cep via API */
	
	function pesquisaCep() {
		var cep = $("#cep").val();

		$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
				function(dados) {
					if (!("erro" in dados)) {

						//Atualiza os campos com os valores da consulta.
						$("#cep").val(dados.cep);
						$("#logradouro").val(dados.logradouro);
						$("#bairro").val(dados.bairro);
						$("#cidade").val(dados.localidade);
						$("#uf").val(dados.uf);

					} else {
						//CEP pesquisado não foi encontrado.
						//limpa_formulário_cep();
						alert("CEP não encontrado.");
					}
				});

	}
	

	
	/* Função para limpar formulário */
	
	function limparFormulario() {
		var elementos = document.getElementById("form_usuario").elements; /*RETORNA OS ELEMENTOS HTML DO FORM*/
		for (p = 0; p < elementos.length; p++) {
			elementos[p].value = '';
		}
	}
	
	</script>
	<jsp:include page="/pages/javascript.jsp"></jsp:include>
</body>
</html>