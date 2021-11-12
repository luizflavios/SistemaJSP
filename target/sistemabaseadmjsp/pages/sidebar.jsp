<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
		BLOCO SIDEBAR
		
-->

    <div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
        <div class="nano">
            <div class="nano-content">
                <ul>
                    <div class="logo">
	                    <a href="<%=request.getContextPath()%>/pages/view/home.jsp">
	                            <!-- <img src="assets/images/logo.png" alt="" /> --><span>Home</span>
	                    </a>
                    </div>
                    
                    
 <%--                    <li class="label">Main</li>
                    <li><a href="<%=request.getContextPath() %>/pages/view/home.jsp" class="sidebar-sub-toggle"><i class="ti-home"></i> Home </a>

                    </li> --%>

	<c:if test="${nivelAcesso == 'Administracao'}">
		
                    <li class="label">Rotinas</li>
                    <li><a class="sidebar-sub-toggle"><i class="ti-user"></i> Usuário <span
                                class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                       
                        
                            <li><a href="<%=request.getContextPath()%>/pages/view/usuario.jsp">Cadastrar Usuário</a></li>
                            <li><a href="<%=request.getContextPath()%>/pages/view/lista.jsp">Pesquisa de Usuário</a></li>
                            <li><a href="<%=request.getContextPath()%>/pages/view/relatorio.jsp">Relatório de Usuário</a></li>
                            <%-- <li><a href="<%=request.getContextPath()%>/UsuarioServlet?acao=listarUsuarios">Pesquisa de Usuário</a></li> --%>
<!--                             <li><a href="chartjs.html">Chartjs</a></li>
                            <li><a href="chartist.html">Chartist</a></li>
                            <li><a href="chart-peity.html">Peity</a></li>
                            <li><a href="chart-sparkline.html">Sparkle</a></li>
                            <li><a href="chart-knob.html">Knob</a></li> -->
                            
                            
                        </ul>
                    </li>
	</c:if>					
                    <!-- <li><a href="app-event-calender.html"><i class="ti-calendar"></i> Calender </a></li> -->
                    <!-- <li><a href="app-email.html"><i class="ti-email"></i> Email</a></li> -->
                    <!-- <li><a href="app-profile.html"><i class="ti-user"></i> Profile</a></li> -->
                    <!-- <li><a href="app-widget-card.html"><i class="ti-layout-grid2-alt"></i> Widget</a></li> -->
                    <!-- <li class="label">Features</li> -->
                    <!-- <li><a class="sidebar-sub-toggle"><i class="ti-layout"></i> UI Elements <span -->
                                <!-- class="sidebar-collapse-icon ti-angle-down"></span></a> -->
                        <!-- <ul> -->
                            <!-- <li><a href="ui-typography.html">Typography</a></li> -->
                            <!-- <li><a href="ui-alerts.html">Alerts</a></li> -->

                            <!-- <li><a href="ui-button.html">Button</a></li> -->
                            <!-- <li><a href="ui-dropdown.html">Dropdown</a></li> -->

                            <!-- <li><a href="ui-list-group.html">List Group</a></li> -->

                            <!-- <li><a href="ui-progressbar.html">Progressbar</a></li> -->
                            <!-- <li><a href="ui-tab.html">Tab</a></li> -->

                        <!-- </ul> -->
                    </li>
                    <!-- <li><a class="sidebar-sub-toggle"><i class="ti-panel"></i> Components <span -->
                                <!-- class="sidebar-collapse-icon ti-angle-down"></span></a> -->
                        <!-- <ul> -->
                            <!-- <li><a href="uc-calendar.html">Calendar</a></li> -->
                            <!-- <li><a href="uc-carousel.html">Carousel</a></li> -->
                            <!-- <li><a href="uc-weather.html">Weather</a></li> -->
                            <!-- <li><a href="uc-datamap.html">Datamap</a></li> -->
                            <!-- <li><a href="uc-todo-list.html">To do</a></li> -->
                            <!-- <li><a href="uc-scrollable.html">Scrollable</a></li> -->
                            <!-- <li><a href="uc-sweetalert.html">Sweet Alert</a></li> -->
                            <!-- <li><a href="uc-toastr.html">Toastr</a></li> -->
                            <!-- <li><a href="uc-range-slider-basic.html">Basic Range Slider</a></li> -->
                            <!-- <li><a href="uc-range-slider-advance.html">Advance Range Slider</a></li> -->
                            <!-- <li><a href="uc-nestable.html">Nestable</a></li> -->

                            <!-- <li><a href="uc-rating-bar-rating.html">Bar Rating</a></li> -->
                            <!-- <li><a href="uc-rating-jRate.html">jRate</a></li> -->
                        <!-- </ul> -->
                    <!-- </li> -->
                    <!-- <li><a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> Table <span -->
                                <!-- class="sidebar-collapse-icon ti-angle-down"></span></a> -->
                        <!-- <ul> -->
                            <!-- <li><a href="table-basic.html">Basic</a></li> -->

                            <!-- <li><a href="table-export.html">Datatable Export</a></li> -->
                            <!-- <li><a href="table-row-select.html">Datatable Row Select</a></li> -->
                            <!-- <li><a href="table-jsgrid.html">Editable </a></li> -->
                        <!-- </ul> -->
                    <!-- </li> -->
                    <!-- <li><a class="sidebar-sub-toggle"><i class="ti-heart"></i> Icons <span -->
                                <!-- class="sidebar-collapse-icon ti-angle-down"></span></a> -->
                        <!-- <ul> -->
                            <!-- <li><a href="font-themify.html">Themify</a></li> -->
                        <!-- </ul> -->
                    <!-- </li> -->
                    <!-- <li><a class="sidebar-sub-toggle"><i class="ti-map"></i> Maps <span -->
                                <!-- class="sidebar-collapse-icon ti-angle-down"></span></a> -->
                        <!-- <ul> -->
                            <!-- <li><a href="gmaps.html">Basic</a></li> -->
                            <!-- <li><a href="vector-map.html">Vector Map</a></li> -->
                        <!-- </ul> -->
                    <!-- </li> -->
                    <!-- <li class="label">Form</li> -->
                    <!-- <li><a href="form-basic.html"><i class="ti-view-list-alt"></i> Basic Form </a></li> -->
                    <!-- <li class="label">Extra</li> -->
                    <!-- <li><a class="sidebar-sub-toggle"><i class="ti-files"></i> Invoice <span -->
                                <!-- class="sidebar-collapse-icon ti-angle-down"></span></a> -->
                        <!-- <ul> -->
                            <!-- <li><a href="invoice.html">Basic</a></li> -->
                            <!-- <li><a href="invoice-editable.html">Editable</a></li> -->
                        <!-- </ul> -->
                    <!-- </li> -->
                    <!-- <li><a class="sidebar-sub-toggle"><i class="ti-target"></i> Pages <span -->
                                <!-- class="sidebar-collapse-icon ti-angle-down"></span></a> -->
                        <!-- <ul> -->
                            <!-- <li><a href="page-login.html">Login</a></li> -->
                            <!-- <li><a href="page-register.html">Register</a></li> -->
                            <!-- <li><a href="page-reset-password.html">Forgot password</a></li> -->
                        <!-- </ul> -->
                    <!-- </li> -->
                    <!-- <li><a href="../documentation/index.html"><i class="ti-file"></i> Documentation</a></li> -->
                    <li><a href="<%=request.getContextPath()%>/LoginServlet?acao=logout"><i class="ti-close"></i> Logout</a></li>
                </ul>

                
            </div>
        </div>
    </div>
    <!-- /# sidebar -->