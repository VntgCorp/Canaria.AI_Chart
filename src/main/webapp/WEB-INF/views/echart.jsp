<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.1.0/echarts.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.1.0/echarts.common.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.1.0/echarts.esm.min.js"></script> -->
<title>ECharts Demo</title>
</head>
<body>

<%-- <c:forEach var="item" items="${plcData}" varStatus="plcData">
    <p><strong>[ID]:</strong> <c:out value="${item.id}"/></p>
    <p><strong>[TAG]:</strong> <c:out value="${item.tag}"/></p>
    <p><strong>[SRVTIME]:</strong> <c:out value="${item.srvTime}"/></p>
    <p><strong>[VALUE]:</strong> <c:out value="${item.value}"/></p>
    <br>
</c:forEach> --%>

<div id="canvas" style="width:600px; height:400px;"></div>


<script>

let chartData = [];
let chartLabels = [];

$.ajax({
    url: "/plcData",
    type: "GET",
    dataType: "json",
    start_time: new Date().getTime(),
    success: function(result) {

    	const res = result.length;

    	for(let i=0; i < result.length; i++){
			chartData.push(result[i].value);
			chartLabels.push(i+1);
			//console.log(chartData);
    		//console.log(`[ID: \${result[i].id}] [TAG: \${result[i].tag}] [SRVTIME: \${result[i].srvTime}] [VALUE: \${result[i].value}]`);
        }

    	console.log('AJAX SUCCESS TIME(sec): ' + (new Date().getTime() - this.start_time) / 1000 + ' sec');

    	createChart();
    },
    error: function(result) {
        console.log(`error: \${result}`);
    }
})


function createChart() {

	console.time("CHART RENDERING TIME(ms)");
	const before = Date.now();
	
	let chartDom = document.getElementById('canvas');
	let eChart = echarts.init(chartDom);
	
	let option = {
		title : {
			text : 'ECharts example'
		},
		legend : {
			data: ['FIRST', 'SECOND', 'THIRD']
		},
		xAxis : {
			type : 'category',
			data : chartLabels
		},
		yAxis : {
			type : 'value',
		},
		series : [ {
			type : 'line',
			name: 'FIRST',
			data : chartData,
			areaStyle: {}
		}
		]
	};
	
	eChart.setOption(option);

	const after = Date.now();
	console.timeEnd("CHART RENDERING TIME(ms)");
	console.log('CHART RENDERING TIME(sec): ' + (after - before) / 1000 + ' sec');

}

</script>
</body>

</html>