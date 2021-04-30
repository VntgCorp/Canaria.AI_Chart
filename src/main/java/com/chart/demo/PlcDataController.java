package com.chart.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlcDataController {
	
	private PlcDataService plcDataService;
	
	@Autowired
	public void setPlcDataService(PlcDataService plcDataService) {
		this.plcDataService = plcDataService;
	}
	
	@RequestMapping("/chart")
	public String chart(Model model) {
		List<PlcData> plcData = plcDataService.getData();
		model.addAttribute("plcData", plcData);
		
		System.out.println("CHART CONTROLLER");
		System.out.println(plcData);
		
		return "chart";
	}
	
	@RequestMapping("/echart")
	public String echart(Model model) {
		List<PlcData> plcData = plcDataService.getData();
		model.addAttribute("plcData", plcData);
		
		System.out.println("ECHART CONTROLLER");
		System.out.println(plcData);
		
		return "echart";
	}
	
	@RequestMapping("/uplot")
	public String uplot(Model model) {
		List<PlcData> plcData = plcDataService.getData();
		model.addAttribute("plcData", plcData);
		
		System.out.println("UPLOT CONTROLLER");
		System.out.println(plcData);
		
		return "uplot";
	}

}
