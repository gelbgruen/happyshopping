package goods 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	public class Milka extends Good
	{
		[Embed(source = '../graphics/milka.png')] public var MILKA:Class;
		
		public function Milka(xPos:int, yPos:int) 
		{
			graphic = new Image(MILKA);
			x = xPos;
			y = yPos;
			
			mask = new Pixelmask(MILKA);
			points = 200;
			frequency = 35;
			
			type = "milka";
		}
	}
}