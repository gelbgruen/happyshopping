package worlds 
{
	import flash.text.TextField;
	import goods.*;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Tilemap;
	
	public class LevelOne extends Entity
	{
		
		[Embed(source = '../graphics/level_tiles.png')] private var ImgTileSet:Class;
		[Embed(source = '../sounds/main_theme.mp3')] private var SndLevel:Class;
		
		private var Sound:Sfx = new Sfx(SndLevel);
		
		private var TheWorld:Tilemap;
		
		private var goodsArray:Array;
		
		//only entities can be added to the stage, therefore
		public var highscore:Highscore;
		public var displayhighscore:DisplayHighscore;
		
		public function LevelOne()
		{
			TheWorld = new Tilemap(ImgTileSet, 15*Util.TILE_SIZE, 10*Util.TILE_SIZE, Util.TILE_SIZE, Util.TILE_SIZE);
			graphic = TheWorld;
			
			var MapData:String = 
				'0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\n' + 
				'0,1,1,1,1,1,1,1,1,1,1,1,1,1,0\n' + 
				'0,1,1,1,1,1,1,1,1,1,1,1,0,1,0\n' +
				'0,1,0,0,1,1,1,1,1,1,1,1,1,1,0\n' +
				'0,1,1,1,1,1,1,1,1,1,1,1,1,1,0\n' +
				'0,1,1,1,1,0,1,0,1,1,1,1,1,1,0\n' +
				'0,1,1,1,1,1,1,1,1,1,1,1,1,1,0\n' +
				'0,1,1,1,1,1,1,1,1,1,1,0,1,1,0\n' +
				'0,0,1,1,1,1,1,1,1,1,1,1,1,1,0\n' +
				'0,0,0,0,0,0,0,0,0,0,0,0,0,0,0';
				
			TheWorld.loadFromString(MapData, ",", "\n");
			goodsArray = new Array();
		}
		
		public function addGood(good:Good):void 
		{
			goodsArray.push(good);
		}
		
		//passes the highscore object (created in the main menu to the level)
		public function setHighscore(hs:Highscore, dhs:DisplayHighscore):void {
			this.highscore = hs;
			this.displayhighscore = dhs;
		}
		
		public function grab(xPos:int, yPos:int):void {
			
			for ( var i:int = 0; i < goodsArray.length; i++ )
			{
				//check whether the good in the goodsArray is grabbed
				if (goodsArray[i].isGrabbed(xPos, yPos) == true)
				{
					//add points from good to overall highscore
					highscore.addHighscorePoints(goodsArray[i].getPoints());
					trace("HIGHSCORE: " + highscore.getHighscore());
				}
			}

		}
		
		public function stopSound():void
		{
			Sound.stop();
		}
		
		public function startSound():void
		{
			Sound.loop(0.5);
		}
	}

}