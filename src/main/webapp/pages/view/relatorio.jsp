

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
								<h1>Relatório de Usuários</h1>
							</div>

							

						</div>
					</div>
				</div>
				
				<section id="main-content">
								<div class="col-lg-8">
									<div class="card">
										<div class="card-body">

											<div class="basic-elements">
												<form id="form_relatorio" name="form_relatorio"
													action="<%=request.getContextPath()%>/RelatorioServlet">
														<input type="hidden" id="acao" name="acao" value="gerarRelatorio">
														<div class="row">
														<div class="col-lg-6">

															<div class="form-group">
																<label>Parâmetros para Relatório</label> <select
																	class="form-control" id="parametroRelatorio"
																	name="parametroRelatorio" onchange="verificaCampo();">
																	<option></option>
																	<option>Geral</option>
																	<option>Data de Cadastro</option>

																</select>
															</div>

															<div class="form-group" id="divDemaisShow">
																<!-- AQUI ENTRA O CONTEUDO GERADO NA FUNCAO verificaCampo(); -->
															</div>

															<div class="form-group">
																<button type="button" onclick="gerarPdf();"	class="btn btn-danger btn-flat btn-lg m-b-10 m-l-5"
																	style="margin-top: 15px">Gerar PDF</button>
																<button type="button" onclick="gerarExcel();"	class="btn btn-success btn-flat btn-lg m-b-10 m-l-5"
																	style="margin-top: 15px">Gerar Excel</button>
															</div>

														</div>
													</div>
												</form>
											</div>

										</div>
									</div>
								</div>
							</section>
				
			</div>
		</div>
	</div>
	
	

	<jsp:include page="/pages/javascript.jsp"></jsp:include>
	<script type="text/javascript">
	
		function verificaCampo() {
		
			var select = document.getElementById('parametroRelatorio');
			var valor = select.options[select.selectedIndex].value;
			
				if (valor === "Data de Cadastro") {
					$('#divDemaisShow').empty();
					$('#divDemaisShow').append('<label>Data Inicial</label> <input class="form-control" type="date" autocomplete="off" id="dtaInicial" name="dtaInicial" > <label>Data Final</label> <input class="form-control" type="date" autocomplete="off" id="dtaFinal" name="dtaFinal" >');
				} else {
					$('#divDemaisShow').empty();
				}
		
		}
		
		function gerarPdf() {
			
			var form = document.getElementById('form_relatorio'); 
			document.getElementById('acao').value = 'gerarPdf'; 
			form.submit();
			
		}
		
		function gerarExcel() {
			
			var form = document.getElementById('form_relatorio'); 
			document.getElementById('acao').value = 'gerarExcel'; 
			form.submit();
			
		}
		
	</script>
</body>
</html>