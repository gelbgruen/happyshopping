package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class DisplayHighscore extends Entity
	{
		
		private var highscores:Array = new Array();
		private var names:Array = new Array();
		private static var explainText:Text = new Text("Highscores", FP.halfWidth - 100, 40, 150, 60);
		private static var exitText:Text = new Text("press ENTER to exit to main menu", FP.halfWidth - 150, 550,350,60);
		private static var highscoreText:Text;
		explainText.color = 0x33CC66;
		explainText.size = 30;
		private var display:Graphiclist;
		private var highscore:DisplayHighscore;
		
		public function addHighscore(hs:int, name:String):void
		{
			highscores.push(hs);
			names.push(name);
		}
		
		public function refresh():void
		{
			getHighscores();
			display = new Graphiclist(explainText, highscoreText, exitText);
			graphic = display;
		}
		
		public function getHighscores():void
		{
			var hsText:String;
			var i:int;
			if (highscores.length == 0) 
			{
				hsText = "No Highscores";
			}
			else 
			{
				for (i = 0; i < highscores.length; i++)
				{
					hsText += highscores[i];
					hsText += " ";
					hsText += names[i];
					hsText += "\n";
				}
			}
			highscoreText = new Text(hsText, FP.halfWidth - 80, 100);
		}
		
		override public function update():void {
			if (Input.pressed(Key.ENTER))
			{
				var mm:MainMenu = new MainMenu();
				mm.setHighscore(this);
				FP.world = new MainWrapper(mm);
			}
		}
	}

}