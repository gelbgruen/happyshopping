package 
{
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import Util;
	import worlds.MainMenu;
	import worlds.MainWrapper;

	[Frame(factoryClass = "Preloader")]
	[SWF(width = "800", height = "640")]
	
	public class Main extends Engine
	{

		public function Main():void 
		{
			super(Util.RES_X, Util.RES_Y, Util.FRAMERATE, false);
			FP.world = new MainWrapper(new MainMenu());
		}
		
		override public function init():void 
		{ 
			trace("FlashPunk "+FP.VERSION+" started");
		}
		
	}

}