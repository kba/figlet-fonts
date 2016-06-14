GITURL = "https://cdn.rawgit.com/kba/figlet-fonts/gh-pages"

figlet.defaults fontPath: "#{GITURL}/fonts"

loadFonts = (cb) ->
	fonts = []
	$.get "#{GITURL}/fontlist.txt", (textlist) ->
		for font in textlist.split('\n')
			font = font.replace /\..*$/, ''
			$("#font").append $("<option>").html(font)
		cb()

setCssFont = ->
	console.log $("#font-family").val()
	$("#output").css('font-family', $("#font-family").val())

setColorTheme = ->
	$("#output").attr('data-color-theme', $("#color-theme").val())

setStatus = (status) ->
	$("#status").attr("data-status", status).html(status)

render = ->
	setStatus 'wait'
	figlet $("#input").val(), $("#font :selected").text(), (err, text) ->
		if err
			setStatus 'err'
			return console.log err
		setStatus 'ok'
		$("#output").html(text)

loadFonts ->
	$("#input").on 'input', render
	$("#font").on 'change', render
	$("#color-theme").on 'change', setColorTheme
	$("#font-family").on 'input', setCssFont

	$("#input").removeAttr('disabled')
	$("#font").val('standard')
	setStatus("wait")
	setColorTheme()
	setCssFont()

