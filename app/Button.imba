export default tag Button
	prop x = -1000
	prop y = -1000


	def mount
		setRandomPos()
		imba.commit!
	def updateBorders
		maxX = window.innerWidth - self.offsetWidth
		maxY = window.innerHeight - self.offsetHeight
	def setRandomPos
		updateBorders!
		console.assert(maxX && maxY)
		x = Math.random() * maxX
		y = Math.random() * maxY
		console.log("Set random pos to {x}:{y}")
	def clamp
		updateBorders!
		x = maxX if x > maxX 
		x = 0 if x < 0
		y = maxY if y > maxY 
		y = 0 if y < 0
		

	css self
		pos:absolute px:5 py:1 fs:medium ta:center
		bd:solid bc:gray5 rd:md us: none cursor:pointer

	<self[l:{x}px t:{y}px] @hotkey('r') 
		@touch.moved.sync(self) @click=setRandomPos @load=setRandomPos
	>
		"Click Me!"
		<global @resize=clamp>
