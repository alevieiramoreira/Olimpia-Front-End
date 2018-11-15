google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

    var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));

    var options = {
        title: 'CPU', titleTextStyle: { size: '20px;' },
        hAxis: { title: 'USO X TEMPO', titleTextStyle: { color: '#333' } },
        vAxis: { minValue: 0, }
    };


    $.ajax({
        url: "GraficoCpu.aspx",
        success: function (dados) {
            var data = google.visualization.arrayToDataTable(dados);
            chart.draw(data, options);
        }
    });

    setTimeout(drawChart, 7000);

    
}
