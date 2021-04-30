<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<title>Chart.js Demo</title>
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


var lineChartData = {
	labels : chartLabels,
	datasets : [
		{
			label : "FIRST",
			backgroundColor:"#bfdaf9",
            borderColor: "#80b6f4",
            pointBorderColor: "#80b6f4",
            pointBackgroundColor: "#80b6f4",
            pointHoverBackgroundColor: "#80b6f4",
            pointHoverBorderColor: "#80b6f4",
            fill: false,
            borderWidth: 4,
			data : chartData
		}
	]
}


function createChart(){

	console.time("CHART RENDERING TIME(ms)");
	const before = Date.now();
	
	let chartDom = document.getElementById("canvas").getContext("2d");

	LineChartDemo = Chart.Line(chartDom,{
		data : lineChartData,
		options :{
			scales : {
				yAxes : [{
					ticks :{
						beginAtZero : true
					}
				}]
			}
		}
	})

	const after = Date.now();
	console.timeEnd("CHART RENDERING TIME(ms)");
	console.log('CHART RENDERING TIME(sec): ' + (after - before) / 1000 + ' sec');
}

</script>
</body>

</html>