package goods 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	public class Promotion extends Good
	{
		[Embed(source = '../graphics/promotion.png')] public var PROMOTION:Class;
		
		public function Promotion(xPos:int, yPos:int) 
		{
			graphic = new Image(PROMOTION);
			x = xPos;
			y = yPos;
			
			mask = new Pixelmask(PROMOTION);
			points = 10000;
			frequency = 35;
			
			type = "promotion";
		}
	}
}