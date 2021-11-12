
<!-- 
		Tela vizualização/pesquisa de usuários e chamada para edição dos dados. 
		/* Falta implementar pesquisa, filtro ou paginação da lista de resultados */
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<h1>Pesquisa de Usuários</h1>
							</div>

						</div>
					</div>
				</div>
				<section id="main-content">

					<div class="col-lg-12">
					
						<div class="card">

							<div class="card-body">
							
								<div class="basic-elements">
                                        <form id="form_pesquisa" name="form_pesquisa" action="<%=request.getContextPath()%>/UsuarioServlet">
                                        	<input type="hidden" id="acao" name="acao" value="filtrar">
                                            <div class="row">
                                            	<div class="col-lg-6">                                           	
                                            	
                                                    <div class="form-group">
                                                        <label>Parâmetros de pesquisa</label>
                                                        <select class="form-control" id="parametroFiltro" name="parametroFiltro" onchange="teste();">
                                                        	<option></option>
															<option>Nome</option>
															<option>Data de Cadastro</option>
					
														</select>
                                                    </div>
                                                    
                                                    
											
											
                                                    <div class="form-group" id="divDemais">
                                                                                                   
													 </div>
											
                                                    <div class="form-group">
                                                    	<button  class="btn btn-success btn-flat btn-lg m-b-10 m-l-5"  style="margin-top: 15px" >Pesquisar</button>
                                                    </div>

                                                 </div>
											</div>
										</form>
								</div>
						</div>
						</div>
						<div class="card">

							<div class="card-body">
								<input type="hidden" id="nomeBusca"
									value="<%=request.getContextPath()%>/UsuarioServlet">
								<div class="table-responsive">
									<table class="table table-bordered" id="tabelaGeral">
										<thead>
											<tr>
												<th>Id</th>
												<th>Name</th>
												<th>Login</th>

												<th>Nível de Acesso</th>
												<th>Telefones</th>
												<th>Endereço</th>
												<th>Editar</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach items='${listaUsuarios}' var='listaUsuarios'>
												<tr>

													<td><c:out value="${listaUsuarios.id}"></c:out></td>

													<td><c:out value="${listaUsuarios.nome}"></c:out></td>
													<td><c:out value="${listaUsuarios.login}"></c:out></td>

													<td><c:out value="${listaUsuarios.nivelAcesso}"></c:out></td>
													<td><button class="ti-headphone"
															onclick="buscarTelefones('${listaUsuarios.id}');"
															data-toggle="modal" data-target="#telefoneModal"></button></td>
													<td><button class="ti-map-alt"
															onclick="buscarEndereco('${listaUsuarios.id}');"
															data-toggle="modal" data-target="#enderecoModal"></button></td>
													<td><a class="ti-pencil-alt"
														href="<%=request.getContextPath()%>/UsuarioServlet?acao=editarDados&id=${listaUsuarios.id}"></a></td>

												</tr>

											</c:forEach>


											<!--                                                 <tr>
                                                    <th scope="row">1</th>
                                                    <td>Kolor Tea Shirt For Man</td>
                                                    <td><span class="badge badge-primary">Sale</span></td>
                                                    <td>January 22</td>
                                                    <td class="color-primary">$21.56</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>Kolor Tea Shirt For Women</td>
                                                    <td><span class="badge badge-success">Tax</span></td>
                                                    <td>January 30</td>
                                                    <td class="color-success">$55.32</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">3</th>
                                                    <td>Blue Backpack For Baby</td>
                                                    <td><span class="badge badge-danger">Extended</span></td>
                                                    <td>January 25</td>
                                                    <td class="color-danger">$14.85</td>
                                                </tr> -->

										</tbody>
	
									</table>
									

								</div>
							</div>
						</div>
					</div>

				</section>



			</div>
		</div>
	</div>

	<div class="modal fade" id="telefoneModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Telefones</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Telefone
								Celular:</label> <input type="text" class="form-control" id="celular"
								value="" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Telefone
								Residencial:</label> <input type="text" class="form-control"
								id="residencial" value="" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Telefone
								Comercial:</label> <input type="text" class="form-control"
								id="comercial" value="" readonly="readonly">
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="enderecoModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Endereço</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Logradouro:</label>
							<input type="text" class="form-control" id="logradouroModal"
								value="" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Numero:</label>
							<input type="text" class="form-control" id="numeroModal" value=""
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Bairro:</label>
							<input type="text" class="form-control" id="bairroModal" value=""
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Cidade:</label>
							<input type="text" class="form-control" id="cidadeModal" value=""
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Estado:</label>
							<input type="text" class="form-control" id="estadoModal" value=""
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Cep:</label> <input
								type="text" class="form-control" id="cepModal" value=""
								readonly="readonly">
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>


	<script type="text/javascript">
	
		function teste() {
			var select = document.getElementById('parametroFiltro');
			var valor = select.options[select.selectedIndex].value;
			 
				if (valor === 'Nome') {
					
					$('#divDemais').empty();
					$('#divDemais').append('<label >Parâmetros de pesquisa</label> <input class="form-control" type="text" autocomplete="off" id="parametroTexto" name="parametroTexto">')
				
				} else if (valor === 'Data de Cadastro'){
					
					$('#divDemais').empty();
					$('#divDemais').append('<label >Data Inicial</label> <input class="form-control" type="date"  autocomplete="off" id="dtaInicial" name="dtaInicial"> <label >Data Final</label> <input class="form-control" type="date" autocomplete="off" id="dtaFinal" name="dtaFinal">')
					
				} else {
					$('#divDemais').empty();
				}
			
			
		}	
	
		function buscarEndereco(id) {

			if (id != null && id != '' && id.trim() != '') { /*Validando que tem que ter valor pra buscar no banco*/

				var urlAction = document.getElementById('nomeBusca').value;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "id=" + id + '&acao=buscarEndereco',
					success : function(response, textStatus, xhr) {

						var json = JSON.parse(response);

						$('#logradouroModal').val(json.logradouro);
						$('#numeroModal').val(json.numero);
						$('#bairroModal').val(json.bairro);
						$('#cidadeModal').val(json.cidade);
						$('#estadoModal').val(json.estado);
						$('#cepModal').val(json.cep);

					}

				}).fail(function(xhr, status, errorThrown) {
					alert('Erro ' + xhr.responseText);
				});

			}

		}



		function buscarTelefones(id) {

			if (id != null && id != '' && id.trim() != '') { /*Validando que tem que ter valor pra buscar no banco*/

				var urlAction = document.getElementById('nomeBusca').value;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "id=" + id + '&acao=buscarTelefone',
					success : function(response, textStatus, xhr) {

						var json = JSON.parse(response);

						$('#celular').val(json.celular);
						$('#residencial').val(json.residencial);
						$('#comercial').val(json.comercial);

					}

				}).fail(function(xhr, status, errorThrown) {
					alert('Erro ' + xhr.responseText);
				});

			}

		}

		

		
	</script>

	<jsp:include page="/pages/javascript.jsp"></jsp:include>
</body>
</html>

