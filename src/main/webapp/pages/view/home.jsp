<!--
		Home do sistema, tela pós login. 
		/* Falta implementar DashBoard de B.I para acompanhar dados em tempo real (usuarios cadastrados, ações realizadas, etc) */		  
-->

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

				<div id="main-content">
					<div class="row">
						<div class="col-lg-2">
							<div class="card">
								<div class="stat-widget-one">
									<div class="stat-icon dib">
										<i class="ti-user color-primary border-primary"></i>
									</div>
									<div class="stat-content dib">
										<div class="stat-text">Usuários</div>
										<div class="stat-digit">
											${qntdUsuarios}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/pages/javascript.jsp"></jsp:include>
</body>
</html>