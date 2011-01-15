package characters 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap; 
	
	public class SaleArrows extends Entity
	{
		[Embed(source = '../graphics/sale_arrows.png')] private var ImgArrows:Class;
		private var sprArrows:Spritemap = new Spritemap(ImgArrows, 75, 75);
		private var _x:int;
		private var _y:int;
		
		public function SaleArrows(x:int, y:int)
		{
			sprArrows.add("left", [0, 2], 5, true);
			sprArrows.add("right", [1, 2], 5, true);
			sprArrows.add("up", [3, 2], 5, true);
			sprArrows.add("down", [4, 2], 5, true);
			
			_x = x;
			_y = y;
		}

		public function playAnimation(dir:String):void
		{
			sprArrows.play(dir);
		}
	}

}