google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

    var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));

    var options = {
        titleTextStyle: {
            color: '#333',    // any HTML string color ('red', '#cc00cc')

            fontSize: 22, // 12, 18 whatever you want (don't specify px)
            bold: true,    // true or false
        },
        title: '',
        hAxis: { title: '%Uso x Tempo', titleTextStyle: { color: '#333' } },
        vAxis: { minValue: 0, maxValue: 100 },
        series: { 0: { color: '#cb8933' } },
        pointSize: 4

    };

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Data Hora');
    data.addColumn('number', 'Cpu');
    setInterval(() => {
        $.ajax({
            type: 'POST',
            url: "GraficoCpu.aspx/getUltimaLeituraCpu",
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
