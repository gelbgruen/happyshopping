package characters
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap; 
	import net.flashpunk.Sfx;
	
	public class Explosion extends Entity
	{
		[Embed(source = '../graphics/explosion_54x47.png')] private var ImgExplosion:Class;
		[Embed(source = '../sounds/explosion.mp3')] private var EXPLOSION:Class;
		
		public var sprExplosion:Spritemap = new Spritemap(ImgExplosion, 54, 47);
		private var _x:int;
		private var _y:int;
		private var destroyed:Boolean = false;
		
		private var explosion:Sfx = new Sfx(EXPLOSION);
		
		public function Explosion(x:int, y:int) 
		{
			sprExplosion.add("explode", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 30, false);
			graphic = sprExplosion;
			_x = x;
			_y = y;
		}
		
		public function destroyThis():void
		{
			if (destroyed == false) {
				this.x = _x - 54 / 2;
				this.y = _y - 47 / 2;
				explosion.play();
				sprExplosion.play("explode");
				destroyed = true;
			}
			else {
				
			}
		}
	}
}