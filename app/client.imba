import "imba/preflight.css"
import "./styles/round-button.css"
import Button from "./Button"

global css
	.shadow
		box-shadow: 0 1px 2px rgba(0,0,0,0.15)

	.shadow::after
		content: ""
		box-shadow: 0 5px 15px rgba(0,0,0,0.3)
		opacity: 0
		transition: opacity 0.3s ease-in-out
	.shadow::after@hover
		opacity: 1
	

tag Header
	prop started? = false
	prop timeRemaining = 20
	#clickCount\number = 0

	def start
		started? = true
		#interval = setInterval((do
				timeRemaining--
				if timeRemaining <= 0
					finish!
				imba.commit!), 1000)
	
	def finish
		clearInterval(#interval)

	css .container
		shadow:md bg:white 
		bdl:solid bdr:solid bdb:solid bc:#00000022
		rdbr:xl rdbl:xl bw:1px bwt:0
		py:3 px:12 tween:all 200ms
		.start
			bg:green4 px:5 py:2 rd:15px
		.count fw:medium


	<self[d:flex jc:center]>
		<div.container[d:flex jc:center ai:center g:10]>
			<button.round-button [cursor:default]=(!started?)
				@click.if(!started?)=(start)
			>
				if not started?
					"Start"
				else
					"0:{timeRemaining >= 10 ? timeRemaining : "0{timeRemaining}"}"
			<span.count[o:{started? ? 1 : 0} display:{started? ? "visible" : "none"}]>
				"Clicked {<b> #clickCount} times"



tag app
	css section m:2
		label mr:3
		input bd:solid rd:1px bc:gray3 rd:md w:15 ta:center shadow@hover:md tween:all 0.3s
	<self[h:100%]>
		<Header>
		<Button>

imba.mount <app>
