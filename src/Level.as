package 
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Level extends World 
	{
		private var status:String;
		private const INIT:String = "INIT";
		private const GAME:String = "GAME";
		private const STARTING:String = "STARTING";
		
		public function Level() 
		{
			super();
			status = "INIT";
		}
		
		override public function update():void 
		{
			super.update();
			
			
			if (status == GAME)
			{

			}
			
			if (status == STARTING)
			{
				add(new BackGround());
				
				add(new Player(10, 850));	
				
				if (classCount(BigMeteor) < 3)
					for (var i:int = 0; i < 3; i++) 
						add(new BigMeteor(FP.rand(FP.screen.width - 136), -177));
						
				if (classCount(SmallMeteor) <10)
					for (var j:int = 0; j < 10; j++) 
						add(new SmallMeteor(FP.rand(FP.screen.width - 136), -177));
						
				status = GAME;
			}
			
			if (status == INIT)
			{
				if (Input.pressed(Key.SPACE))
					status = STARTING;
			}

		}
	}

}