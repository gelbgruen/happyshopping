package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Highscore extends Entity
	{
		
		private  var  highscore:int = 0;		
		private var highscoreText:Text;

		//to display the highscore textfield
		private var enterHighscore:Text;
		private var display:Graphiclist;
		private var high:Boolean = false;
		private var inputReader:KeyboardInputReader;
		private var started:Boolean = false;
		private var input:String;
		private var inputText:Text;
		
		public function Highscore() 
		{
			//TODO: highscore has to move with camera
			highscoreText = new Text(highscore+ "", Util.RES_X-100, Util.RES_Y-560, 100, 20);
			highscoreText.color = 0x000000;
			graphic = highscoreText;
		}
		
		public function addHighscorePoints(points:int):void
		{
			highscore += points;
		}
		
		public function getHighscore():int
		{
			return highscore;
		}
		
		public function getHighscoreText():Text
		{
			return highscoreText;
		}
		
		override public function update():void {
			super.update();
			highscoreText.text = highscore + "$";
			highscoreText.update();
			
			if (high == true)
			{
				if (Input.pressed(Key.ENTER))
				{
					trace("HIGHSCORE EINGABE BEENDEN");
				}
				
				inputReader.update();
				if (inputReader.first == false) {
					if (started == false) {
						input = inputReader.getString();
						started = true;
						displayTextfield();
						trace(input);
					}
					else {
						if (input != inputReader.getString()) {
							input = inputReader.getString();
							displayTextfield();
							trace(inputReader.getString());
						}
					}
					
				}
			}
		}
		
		public function displayTextfield():void
		{
			if (started == true) {
				inputText = new Text(input, FP.halfWidth - 110, FP.halfHeight + 50, 300, 100);
				inputText.color = 0x000000;
				inputText.size = 20;
				graphic = new Graphiclist(enterHighscore, inputText);
			}
			else {
				high = true;
				inputReader = new KeyboardInputReader();
				enterHighscore = new Text("Your score is "+highscore+"\nPlease enter your name", FP.halfWidth - 110, FP.halfHeight, 300, 100);
				enterHighscore.color = 0x000000;
				enterHighscore.size = 20;
				graphic = enterHighscore;
			}
			graphic.update();
		}
	}
}