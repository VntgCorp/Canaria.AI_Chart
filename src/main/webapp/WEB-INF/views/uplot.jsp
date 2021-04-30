<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/uPlot.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/resources/uPlot.iife.js"></script>
<title>uPlot Demo</title>
</head>
<body>

<%-- <c:forEach var="item" items="${plcData}" varStatus="plcData">
    <p><strong>[ID]:</strong> <c:out value="${item.id}"/></p>
    <p><strong>[TAG]:</strong> <c:out value="${item.tag}"/></p>
    <p><strong>[SRVTIME]:</strong> <c:out value="${item.srvTime}"/></p>
    <p><strong>[VALUE]:</strong> <c:out value="${item.value}"/></p>
    <br>
</c:forEach> --%>

<div style="width:800px">
    <canvas id="canvas"></canvas>
</div>


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

	let opts = {
		title: "uPlot example",
		width: 600,
		height: 400,
		scales: {
			x: {
				time: false,
			}
		},
		series: [
			{ 
				label: "SEQUENCE"
			},
			{
				label: "FIRST",
				stroke: "Blue"
			}
			/* ,
			{
				label: "SECOND",
				stroke: "Green"
			},
			{
				label: "THIRD",
				stroke: "Yellow"
			} */
		]
	};

	const data = [
		chartLabels,
		chartData
	];

	let u = new uPlot(opts, data, document.body);

	const after = Date.now();
	console.timeEnd("CHART RENDERING TIME(ms)");
	console.log('CHART RENDERING TIME(sec): ' + (after - before) / 1000 + ' sec');

}


</script>
</body>

</html>