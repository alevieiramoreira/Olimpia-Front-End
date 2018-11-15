google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));


    var options = {
        title: 'RAM Usage'
    };

    $.ajax({
        url: "GraficoRam.aspx",
        success: function (dados) {
            var data = google.visualization.arrayToDataTable(dados);
            chart.draw(data, options);
        }
    });

    chart.draw(data, options);
}