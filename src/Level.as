package 
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Level extends World 
	{
		
		public function Level() 
		{
			super();
			add(new Player(400, 400));
			add(new BigMeteor(400, 35));
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}