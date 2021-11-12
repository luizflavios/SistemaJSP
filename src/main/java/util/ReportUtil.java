package util;

import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class ReportUtil implements Serializable {


	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public byte[] gerarRelatorioPDF(List listaDados, String nomeRelatorio, javax.servlet.ServletContext servletContext) throws Exception {
		
		/* Cria a lista de dados que vem da consulta no banco de dados */
		JRBeanCollectionDataSource jrBean = new JRBeanCollectionDataSource(listaDados); 
		
		String caminhoJasper = servletContext.getRealPath("relatorios") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint impressoraJasper = JasperFillManager.fillReport(caminhoJasper, new HashMap(), jrBean);
		
		return JasperExportManager.exportReportToPdf(impressoraJasper); 
	}

}
