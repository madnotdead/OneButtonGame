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
			super(800, 600, 60, false);
			FP.world = new Level();
		}
			
		override public function init():void 
		{
			trace("Flashpunk has started successfully!");
		}
	}
	
}