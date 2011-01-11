package worlds 
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.masks.Grid;
	
	public class LevelOneCollision extends Entity 
	{
		
		private var GridMap:Grid;
		
		public function LevelOneCollision() 
		{
			GridMap = new Grid(15*Util.TILE_SIZE, 10*Util.TILE_SIZE, Util.TILE_SIZE, Util.TILE_SIZE, 0, 0);
			
			var MapData:String = 
				'1,1,1,1,1,1,1,1,1,1,1,1,1,1,1\n' + 
				'1,0,0,0,0,0,0,0,0,0,0,0,0,0,1\n' + 
				'1,0,0,0,0,0,0,0,0,0,0,0,1,0,1\n' +
				'1,0,1,1,0,0,0,0,0,0,0,0,0,0,1\n' +
				'1,0,0,0,0,0,0,0,0,0,0,0,0,0,1\n' +
				'1,0,0,0,0,1,0,1,0,0,0,0,0,0,1\n' +
				'1,0,0,0,0,0,0,0,0,0,0,0,0,0,1\n' +
				'1,0,0,0,0,0,0,0,0,0,0,1,0,0,1\n' +
				'1,1,0,0,0,0,0,0,0,0,0,0,0,0,1\n' +
				'1,1,1,1,1,1,1,1,1,1,1,1,1,1,1';
				
			GridMap.loadFromString(MapData,",","\n");
			
			mask = GridMap;
			type = "walls";			
		}
		
	}

}