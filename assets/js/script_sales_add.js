function selectClient(obj) {
	let id = $(obj).attr('data-id');
	let name = $(obj).html();

	$('.searchresults').hide();
	$('#client_name').val(name);
	$('input[name=client_id]').val(id);
}

function updateSubtotal(obj) {
	let quant = $(obj).val();
	if (quant <= 0) {
		$(obj).val(1);
		quant = 1;
	}

	let price = $('#price-item').attr('data-price');
	price = parseFloat(price).toFixed(2).toString().replace(',', '.');
	let subtotal = price * quant;

	$(obj).closest('tr').find('.subtotal').html(subtotal.toLocaleString("pt-BR", {
		style: "currency",
		currency: "BRL"
	}));

	updateTotal();
	$('#subtotal').val(subtotal)

}

function updateTotal() {
	let total = 0;

	for (let q = 0; q < $('.p_quant').length; q++) {
		let priceItem = $('#price-item');
		let quant = $('.p_quant').eq(q);

		let price = priceItem.attr('data-price');
		let subtotal = price * parseInt(quant.val());

		total += subtotal;
	}

	let preco = total.toLocaleString("pt-BR", {
		style: "currency",
		currency: "BRL"
	});
	$('#total_price').val(preco)

}

function excluirProd(obj) {
	$(obj).closest('tr').remove();
	// showTable()
	updateTotal()
}

function addProd(obj) {
	$('#add_prod').val('');
	let id = $(obj).attr('data-id');
	let name = $(obj).attr('data-name');
	let price = $(obj).attr('data-price')
	let price2 = parseFloat(price).toFixed(2).toString().replace('.', ',')
	let subtotal = parseFloat(price).toFixed(2).toString().replace('.', ',')

	$('.searchresults').hide();

	if ($('input[name="quant[${id}]"]').length == 0) {
		let tr = `
						<tr>
							<td class="w-50">${name.toUpperCase()}</td>
							<td class="w-15">
								<input type="number" name="quant[${id}]" class="p_quant" value="1" onchange="updateSubtotal(this)"/>
							</td>
							<td class="w-15"><input type="text" name="price" id="price-item" data-price="${price}" value="${price2}"/></td>
							<td class="subtotal w-15" id="subtotal">${subtotal}</td>
							<td class="w-5" style="text-align: center;"><a href="javascript:;" onclick="excluirProd(this)">X</a></td>
						</tr>
				`;

		$('#products_table').append(tr);
		let preco = subtotal.toLocaleString("pt-BR", {
			style: "currency",
			currency: "BRL"
		});
		$('#subtotal').val(preco)
	}


	updateSubtotal()
	// showTable();
}

// let showTable = () => {
// 	let table = document.getElementsByClassName('table_header')[0]
// 	let content = document.getElementById('product-cart')
// 	let btnCheckout = document.querySelector('.btn-checkout')



// 	if (content == null) {
// 		table.classList.add('hide')
// 		btnCheckout.classList.add('hide')
// 	} else {
// 		table.classList.remove('hide')
// 		btnCheckout.classList.remove('hide')
// 	}
// }
// showTable()

$(function () {

	$('#total_price').mask('000.000.000.000.000,00', {
		reverse: true,
		placeholder: "0,00"
	});

	// $('.client_add_button').on('click', function (e) {
	// 	e.preventDefault();

	// 	let name = $('#client_name').val();
	// 	if (name != '' && name.length >= 4) {

	// 		if (confirm('Você deseja adicionar um cliente com nome: ' + name + ' ?')) {

	// 			$.ajax({
	// 				url: BASE_URL + '/ajax/add_client',
	// 				type: 'POST',
	// 				data: {
	// 					name: name
	// 				},
	// 				dataType: 'json',
	// 				success: function (json) {
	// 					$('.searchresults').hide();
	// 					$('input[name=client_id]').val(json.id);
	// 				}
	// 			});

	// 			return false;

	// 		}

	// 	}

	// });



	$('#add_prod').on('keyup', function () {
		let datatype = $(this).attr('data-type');
		let q = $(this).val();

		if (datatype != '') {
			$.ajax({
				url: `${BASE_URL}/ajax/${datatype}`,
				type: 'GET',
				data: {
					q: q
				},
				dataType: 'json',
				success: (json) => {
					if ($('.searchresults').length == 0) {
						$('#add_prod').after('<div class="searchresults"></div>');
					}

					let html = '';

					for (let i in json) {
						let preco = json[i].price;
						let pt = parseFloat(preco).toFixed(2).toString().replace('.', ',')
						html += `<div class="si"><a href="javascript:;"  onclick="addProd(this)" data-id="${json[i].id}" data-price=" ${json[i].price}" data-name="${json[i].name_product}"><span>${json[i].name_product}</span>  <span>R$ ${pt}</span></a></div>`
					}

					$('.searchresults').html(html);
					$('.searchresults').show();
				}
			});
		}

	});

	// $('#client_name').on('keyup', function () {
	// 	let datatype = $(this).attr('data-type');
	// 	let q = $(this).val();

	// 	if (datatype != '') {
	// 		$.ajax({
	// 			url: BASE_URL + '/ajax/' + datatype,
	// 			type: 'GET',
	// 			data: {
	// 				q: q
	// 			},
	// 			dataType: 'json',
	// 			success: function (json) {
	// 				if ($('.searchresults').length == 0) {
	// 					$('#client_name').after('<div class="searchresults"></div>');
	// 				}
	// 				$('.searchresults').css('left', $('#client_name').offset().left + 'px');
	// 				$('.searchresults').css('top', $('#client_name').offset().top + $('#client_name').height() + 3 + 'px');

	// 				let html = '';

	// 				for (let i in json) {
	// 					html += '<div class="si"><a href="javascript:;" onclick="selectClient(this)" data-id="' + json[i].id + '">' + json[i].name + '</a></div>';
	// 				}

	// 				$('.searchresults').html(html);
	// 				$('.searchresults').show();
	// 			}
	// 		});
	// 	}

	// });

});