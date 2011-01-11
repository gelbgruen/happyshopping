package goods 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	public class Offer extends Good
	{
		[Embed(source = '../graphics/offer.png')] public var OFFER:Class;
		
		public function Offer(xPos:int, yPos:int) 
		{
			graphic = new Image(OFFER);
			x = xPos;
			y = yPos;
			
			mask = new Pixelmask(OFFER);
			points = 10000;
			frequency = 30;
			
			type = "offer";
		}
	}
}