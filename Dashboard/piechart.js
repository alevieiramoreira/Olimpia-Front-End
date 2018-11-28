google.charts.load("current", { packages: ["corechart"] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Data Hora');
    data.addColumn('number', 'Cpu');
    setInterval(() => {
        $.ajax({
            type: 'POST',
            url: "GraficoRam.aspx/getUltimaLeituraRam",
            dataType: 'json',
            contentType: 'application/json',
            data: '{}',
            success: function (response) {
                var str = response.d;
                var valores = str.split("@");
                var arrayvalores = [valores[0], parseInt(valores[1])];
                data.addRow(arrayvalores);
                chart.draw(data, options);

            },
            error: function (jqXHR, exception) {
                console.log(jqXHR);
            }
        });
    }, 10000);



    var options = {
        title: 'My Daily Activities',
        is3D: true,
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
    chart.draw(data, options);
}