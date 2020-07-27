$( document ).ready(function() {
    $('.rb-item-js').on('click', requestNews)
});

function getData(el,dataName) {
    return {
        id: $(el).data(dataName)
    }
}

function requestNews(e) {

    $.ajax({
        url: '/news/get-news',
        data: getData(e.currentTarget, 'id'),
        type: 'GET',
        dataType:'json',
        success: function(data){

            if(data.length){
                table(data);
            }
            else{
                alert();
            }
        }
    });
}

function table(data) {

    let table = `<table class="table table-bordered">
                  <tr>
                    <th>Рубрика</th>
                    <th>Тема</th>
                    <th>Новость</th>
                  </tr>`;

    table = table + row(data) + `</table>`;

    $('#app-table').html(table);
}

function row(data) {

    let row = '';
    for (let id in data){
        row += `<tr>
                   <td>${data[id]['rubric_name']}</td>
                   <td>${data[id]['topic']}</td>
                   <td>${data[id]['text']}</td>
                </tr>`;
    }
    return row;
}

function alert() {
    $('#app-table').html(
        `<div class="alert alert-warning">Нет данных</div>`
    );
}