package worlds 
{
	import characters.Player;
	
	import goods.*;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class MainMenu extends Entity
	{
		[Embed(source = '../graphics/title.png')] private var mainTitle:Class;
		private var imgMain:Image = new Image(mainTitle);		
		private static var startGame:Text = new Text("Start", FP.halfWidth - 40, FP.halfHeight - 80);
		startGame.color = 0xFFFFFF;
		private static var endGame:Text = new Text("Highscore", FP.halfWidth - 40, FP.halfHeight - 40);
		endGame.color = 0x6B6B6B; 
		private static var explainText:Text = new Text("select with up and down and then press Enter", FP.halfWidth - 190, FP.halfHeight+40);
		private static var explainText2:Text = new Text("for the game press arrows to control direction and 'Q' and 'E' tp grab goods", FP.halfWidth - 332, FP.halfHeight+150, 665, 20);
		explainText.color = 0x33CC66;
		explainText2.color = 0xff6666;
		private var selected:String = "Start";
		private var display:Graphiclist;
		
		private var levelOne:LevelOne;
		private var player:Player;
		private var highscore:Highscore;
		
		private var displayHighscore:DisplayHighscore = new DisplayHighscore();
		
		public function MainMenu() 
		{
			imgMain.x = 100;
			display = new Graphiclist(startGame, endGame, explainText, explainText2, imgMain);
			graphic = display;
			
			levelOne = new LevelOne();
			player = new Player();
			highscore = new Highscore();
		}
		
		override public function update():void 
		{	
			if (Input.pressed(Key.DOWN))
			{
				if (selected == "Start")
				{
					selected = "Highscore";
					startGame.color = 0x6B6B6B;
					endGame.color = 0xFFFFFF;
				}
				else if (selected == "Highscore")
				{
					selected = "Start";
					startGame.color = 0xFFFFFF;
					endGame.color = 0x6B6B6B;
				}
			}
			if (Input.pressed(Key.UP))
			{
				if (selected == "Start")
				{
					selected = "Highscore";
					startGame.color = 0x6B6B6B;
					endGame.color = 0xFFFFFF;
				}
				else if (selected == "Highscore")
				{
					selected = "Start";
					startGame.color = 0xFFFFFF;
					endGame.color = 0x6B6B6B;
				}
			}
			if (Input.pressed(Key.ENTER))
			{
				if (selected == "Start")
				{
					//start the game
					var mainGame:MainWrapper = new MainWrapper(levelOne);
					mainGame.addToWrapper(new LevelOneCollision());
					mainGame.addToWrapper(player);
					mainGame.addToWrapper(highscore);
					//mainGame.addToWrapper(new LevelOneGoodMap());
					//load the goods from the good map and add them to the scene
					for each (var g:Good in LevelOneGoodMap.load()) { 
						mainGame.addToWrapper(g);
						levelOne.addGood(g);
					}
					//this is to stop the sound later when player gets killed
					player.setLevel(levelOne);
					levelOne.setHighscore(highscore, displayHighscore);
					levelOne.startSound();
					FP.world = mainGame;
				}
				else if (selected == "Highscore")
				{
					//load highscore
					//trace("highscore");
					displayHighscore.refresh();
					var displayScore:MainWrapper = new MainWrapper(displayHighscore);
					FP.world = displayScore;					
				}
			}
		}
		
		public function setHighscore(hs:DisplayHighscore):void
		{
			displayHighscore = hs;
		}
		
	}

}