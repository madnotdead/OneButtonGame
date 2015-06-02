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
			add(new BackGround());
			add(new Player(10, 450));
			add(new BigMeteor(400, 35));
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}