figlet.defaults fontPath: '../fonts'

$ ->
	fonts = []
	$.get 'fontlist.txt', (textlist) ->
		for font in textlist.split('\n')
			font = font.replace /\..*$/, ''
			$("#font").append $("<option>").html(font)
		$("#font").val('standard')
	$("#input").on 'input', render
	$("#font").on 'change', render

render = ->
	figlet $("#input").val(), $("#font :selected").text(), (err, text) ->
		if err
			return console.log err
		console.log text
		$("#output").html(text)
