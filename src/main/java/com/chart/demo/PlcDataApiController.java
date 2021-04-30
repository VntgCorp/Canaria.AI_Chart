package com.chart.demo;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PlcDataApiController {

	@Autowired
	private PlcDataService plcDataService;
	
	@GetMapping(value="/plcData", produces = "application/json; charset=UTF-8")
	public List<PlcData> getData(HttpServletRequest request) throws SQLException {
		List<PlcData> res = plcDataService.getData();

		return res;
	}
	
}
