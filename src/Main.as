package
{
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Main extends Engine 
	{
		
		public function Main():void
		{
			super(800, 900, 60, false);
			FP.world = new Level();
			FP.console.enable();
		}
			
		override public function init():void 
		{
			trace("Flashpunk has started successfully!");
		}
	}
	
}