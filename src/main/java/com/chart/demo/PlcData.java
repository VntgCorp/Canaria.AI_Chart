package com.chart.demo;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/*@Document(collection = "customer")*/
public class PlcData {
	
	public static final String ID = "id";
	public static final String TAG = "tag";
	public static final String SRVTIME = "srvTime";
	public static final String VALUE = "value";

	@Id
	private String id;
	private String tag;
	private String srvTime;
	private String value;
	
	public String getId() {
		return id;
	}
	
	public String getTag() {
		return tag;
	}
	
	public String getSrvTime() {
		return srvTime;
	}
	
	public String getValue() {
		return value;
	}


}
