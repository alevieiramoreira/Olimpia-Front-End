google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

    var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));

    var options = {
        title: 'CPU', titleTextStyle: { size: '20px;' },
        hAxis: { title: 'USO X TEMPO', titleTextStyle: { color: '#333' } },
        vAxis: { minValue: 0, maxValue: 100}
    };

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Data Hora');
    data.addColumn('number', 'Cpu');
    setInterval(() => {
    $.ajax({
        type: 'POST',
        url: "TesteCpu.aspx/getUltimaLeituraCpu",
        dataType: 'json',
        contentType: 'application/json',
        data: '{}',
        success: function (response) {
            var str = response.d;
            var valores = str.split("@");
            var arrayvalores = [valores[0], parseInt(valores[1])];
            data.addRow(arrayvalores);
            chart.draw(data, options);
            if (data.getNumberOfRows() > 3) {
                data.removeRow(0);
            }
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR);
        }
    });
}, 5000);




}
