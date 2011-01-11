package goods 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	public class Gold extends Good
	{
		[Embed(source = '../graphics/gold.png')] public var GOLD:Class;
		
		public function Gold(xPos:int, yPos:int) 
		{
			graphic = new Image(GOLD);
			x = xPos;
			y = yPos;
			
			mask = new Pixelmask(GOLD);
			points = 1000;
			frequency = 5;
			
			type = "gold";
		}
	}

}