package com.chart.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class PlcDataService {
	
	MongoTemplate mongoTemplate;
	
	@Autowired
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
	
	
	public List<PlcData> getData(){
		
		Query q = new Query();
		
		q.limit(86400);
	
		List<PlcData> plcData = mongoTemplate.find(q, PlcData.class, "COLLECT_EVENT_CANARIA");
		
		System.out.println("SERVICE");
		System.out.println(plcData);
		
		return plcData;
	}

}
