package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	
	public class DisplayHighscore extends Entity
	{
		
		private var highscores:Array = new Array();
		private static var explainText:Text = new Text("Highscores", FP.halfWidth - 100, 40,150,60);
		private static var highscoreText:Text;
		explainText.color = 0x33CC66;
		explainText.size = 30;
		private var display:Graphiclist;
		
		public function addHighscore(hs:int):void
		{
			highscores.push(hs);
		}
		
		public function refresh():void
		{
			getHighscores();
			display = new Graphiclist(explainText, highscoreText);
			graphic = display;
		}
		
		public function getHighscores():void
		{
			var hsText:String;
			var i:int;
			trace(highscores.length);
			if (highscores.length == 0) 
			{
				hsText = "No Highscores";
			}
			else 
			{
				for (i = 0; i < highscores.length; i++)
				{
					hsText += highscores[i];
					hsText += "\n";
				}
			}
			highscoreText = new Text(hsText, FP.halfWidth - 80, 100);
		}
		
	}

}