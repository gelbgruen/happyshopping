package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	public class MainWrapper extends World
	{
		
		public var isSet:Boolean = false;
		
		public function MainWrapper(ent:Entity) 
		{
			add(ent);
		}
		
		public function addToWrapper(ent:Entity):void
		{
			add(ent);
		}
	}

}