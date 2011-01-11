package goods 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	public class Stuff extends Good
	{
		[Embed(source = '../graphics/ipad.png')] public var STUFF:Class;
		
		public function Stuff(xPos:int, yPos:int) 
		{
			graphic = new Image(STUFF);
			x = xPos;
			y = yPos;
			
			mask = new Pixelmask(STUFF);
			points = 2000;
			frequency = 35;
			
			type = "stuff";
		}
	}
}