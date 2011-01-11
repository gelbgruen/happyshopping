package
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	
	public class Highscore extends Entity
	{
		
		private  var  highscore:int = 0;		
		private var highscoreText:Text;
		
		
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
		}
	}
}