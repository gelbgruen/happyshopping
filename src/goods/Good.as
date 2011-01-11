package goods 
{
	import net.flashpunk.Entity;
	
	import net.flashpunk.Sfx;

	public class Good extends Entity
	{
		public var points:int;
		public var frequency:int;
		public var grabbed:Boolean;
		
		[Embed(source = '../sounds/nograb.mp3')] private var NOGRAB:Class;
		[Embed(source = '../sounds/grab.mp3')] private var GRAB:Class;
		
		private var noGrab:Sfx = new Sfx(NOGRAB);
		private var grab:Sfx = new Sfx(GRAB);
		
		public function getPoints():int
		{
			return points;
		}
		
		public function getFrequency():int
		{
			return frequency;
		}
		
		public function isGrabbed(x:int, y:int):Boolean
		{
			if (x == Math.round(this.x/Util.TILE_SIZE) && y == Math.round(this.y/Util.TILE_SIZE))
			{
				grab.play();
				return true;
			}
			else 
			{
				noGrab.play();
				return false;
			}
		}
	}

}