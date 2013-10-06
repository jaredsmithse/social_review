$(document).ready( function() {
	var newEmployee = "	<form class='new-employee-submit'><input id='name' type='text' placeholder='Name'><input id='date' type='date'><input id='from' type='time'><input id='to' type='time'><input type='submit' class='btn' value='Submit'></form>"
	
	$('.new-employees').on('click', function(e) {
		e.preventDefault();
		$('.employee-content').html(newEmployee)
	})

	$('body').on('submit', '.new-employee-submit', function(e) {
		e.preventDefault();
		
		var name = $('#name').val()
		var date = $('#date').val()
		var from = $('#from').val()
		var to = $('#to').val()

		$.ajax({
			type: 'POST',
			url: '/employees/new',
			data: { 'name': name,
							'date': date,
							'from': from,
							'to': to }
		}).done(updateEmployees);
	});


	function updateEmployees(response) {
		$('.charts').html(response);
	}
})