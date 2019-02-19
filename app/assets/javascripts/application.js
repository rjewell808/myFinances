// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap-datepicker
//= require bootstrap-sprockets
//= require_tree .
$(document).on('turbolinks:load', function() {
	$("#type_income").on("click", function(){
		$(".income-form").removeClass("d-none");
		$(".spending-form").addClass("d-none");
	});

	$("#type_spending").on("click", function(){
		$(".income-form").addClass("d-none");
		$(".spending-form").removeClass("d-none");
	});

	$("#category").on("change", function(){
		$(".sub_category").addClass("d-none");
		let x;
		for (x = 0; x < $(".sub_category").length; x++) {
			$(".sub_category")[x].name = "";
		}
		$(".sub_category").name = "";
		$("#sub_category_" + $('#category')[0].value).removeClass("d-none");
		$("#sub_category_" + $('#category')[0].value)[0].name = "sub_category";
	});
});