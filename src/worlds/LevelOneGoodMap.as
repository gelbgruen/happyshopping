package worlds 
{	
	import goods.*;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Tilemap;
	
	
	public class LevelOneGoodMap extends Entity
	{		
		
		public static var arrayIsFull:Boolean = false;
		public static var frequencyArray:Array = new Array();
		
		public static function load():Array
		{
			var MapData:String = 
				'0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\n' + 
				'0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\n' + 
				'0,0,0,0,0,0,0,0,0,0,0,0,1,0,0\n' +
				'0,0,2,2,0,0,0,0,0,0,0,0,0,0,0\n' +
				'0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\n' +
				'0,0,0,0,0,2,0,1,0,0,0,0,0,0,0\n' +
				'0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\n' +
				'0,0,0,0,0,0,0,0,0,0,0,3,0,0,0\n' +
				'0,3,0,0,0,0,0,0,0,0,0,0,0,0,0\n' +
				'0,0,0,0,0,0,0,0,0,0,0,0,0,0,0';
			
			return loadFromString(MapData, ",", "\n");
		}
		
		private static function loadFromString(str:String, columnSep:String = ",", rowSep:String = "\n"):Array
		{	
			//this function returns an array with
			var row:Array = str.split(rowSep);
			var rows:int = row.length;
			var col:Array;
			var cols:int; 
			var x:int; 
			var y:int;
			
			var result:Array = new Array;
			
			for (y = 0; y < rows; y ++)
			{
				if (row[y] == '') continue;
				col = row[y].split(columnSep),
					cols = col.length;
				for (x = 0; x < cols; x ++)
				{
					if (col[x] == '') continue;
					
					//insert here number for goodTypes
					else if (uint(col[x]) >= 1 && uint(col[x] <= 4)) {
						result.push(createGood(x, y, uint(col[x])));
					}
				}
			}
			return result;
		}
		
		// the goodtype determines the specific good, not in use yet
		private static function createGood(column:uint, row:uint, goodType:uint = 0):Good {
			var xPos:int = (column * Util.TILE_SIZE);
			var yPos:int = (row * Util.TILE_SIZE);
			var good:int = randomGood();

			//goods in the goodmap which are inserted randomized have goodtype 1
			if (goodType == 1) {
				if (good == 0) {
					return new Offer(xPos, yPos);
				}
				else if (good == 1) {
					return new Promotion(xPos, yPos);
				}
				return null;
			}
			
			// goods that are inserted regularly in the goodmap, starting with goodtype 2
			if (goodType == 2) {
				return new Milka(xPos, yPos);
			}
			else if (goodType == 3) {
				return new Gold(xPos, yPos);
			}
			else if (goodType == 4) {
				return new Stuff(xPos, yPos);
			}
			return null;
		}
		
		
		static private function randomGood():int
		{	//insert here new number and type of random promotion goods or actions!
			var numberOfGoods:int = 2; 
			var theGood:int;
			var j:int;
			var i:int;
			
			var offer_good:Offer = new Offer(0, 0);
			var promotion_good:Promotion = new Promotion(0, 0);
			
			if (arrayIsFull == false)
			{
				for (i = 0; i < numberOfGoods; i++)
				{
					if (i == 0)
					{
						for (j = 0; j < offer_good.getFrequency(); j++)
						{
							frequencyArray.push(i);
						}
					}
					if (i == 1)
					{
						for (j = 0; j < promotion_good.getFrequency(); j++)
						{
							frequencyArray.push(i);
						}
					}
				}
			}
			
			arrayIsFull = true;
			
			var x:int = Math.floor(Math.random() * frequencyArray.length + 1);
			//			trace("GOLD: " + gold_good.getPoints());
			//			trace("MILKA: " + milka_good.getPoints());
			return frequencyArray[x];
			
		}
	}
}