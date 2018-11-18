 google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Nome');
        data.addColumn('string', 'Email');
        data.addColumn('string', 'Editar');
          data.addRows([
              ['Mike', { v: 10000, f: '$10,000' },{ v: 'ButtonName', f: '<input type="button" value="test" />' }],
              ['Jim', { v: 8000, f: '$8,000' }, { v: 'ButtonName', f: '<input type="button" value="test" />' }],
              ['Alice', { v: 12500, f: '$12,500' }, { v: 'ButtonName', f: '<input type="button" value="test" />' }],
              ['Bob', { v: 7000, f: '$7,000' }, { v: 'ButtonName', f: '<input type="button" value="test" />' }]
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));
          visualization.draw(data, { allowHtml: true });
        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
}

  function drawVisualization2(dataValues, chartTitle, columnNames, categoryCaption) {
            if (dataValues.length < 1)
                return;
            var data = new google.visualization.DataTable();
            data.addColumn('string', columnNames.split(',')[0]);
            data.addColumn('string', columnNames.split(',')[1]);
            data.addColumn('string', columnNames.split(',')[2]);
            data.addColumn('number', columnNames.split(',')[3]);
            data.addColumn('number', columnNames.split(',')[4]);
            data.addColumn('number', columnNames.split(',')[5]);
            data.addColumn('button', 'test');


            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Value1, dataValues[i].Value2, dataValues[i].Value3, dataValues[i].Value4, dataValues[i].Value5, dataValues[i].Value6, '<input type="button" value="test" />']);
            }

            var formatter = new google.visualization.NumberFormat({ pattern: '####%' });
            formatter.format(data, 5);

            var categoryPicker2 = new google.visualization.ControlWrapper({
                'controlType': 'CategoryFilter',
                'containerId': 'Container1',
                'options': {
                    'filterColumnLabel': columnNames.split(',')[1],
                    'ui': {
                        'labelStacking': 'horizontal',
                        'allowTyping': false,
                        'allowMultiple': false,
                        'caption': categoryCaption,
                        'label': columnNames.split(',')[2]
                    }
                }
            });


            var table2 = new google.visualization.ChartWrapper({
                'chartType': 'Table',
                'containerId': 'TableContainer2',

                'options': {
                    'width': '895px',
                    'page': 'enable',
                    'pageSize': 5

                }
            });

            new google.visualization.Dashboard(document.getElementById('PieChartExample2')).bind([categoryPicker2], [table2]).draw(data);
            visualization.draw(data, { allowHtml: true });
        }