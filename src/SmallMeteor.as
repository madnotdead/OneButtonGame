package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	/**
	 * ...
	 * @author madnotdead
	 */
	public class SmallMeteor extends Entity
	{
		private var speed:int = 275;
		private var waitTime:Number = 0;
		private var timeCounter:Number = 0;
		[Embed(source="../assets/meteorSmall.png")]private var SMALL:Class;
		public function SmallMeteor(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(SMALL);
			super(x, y, graphic);
			
			setHitbox(44, 42);
			width = 44;
			height = 42;
			while (waitTime == 0)
			{
				waitTime = FP.rand(5);
			}
			
			type = "sMeteor";
		}
	
		
		override public function update():void 
		{
			super.update();
			
			timeCounter += FP.elapsed;

			if(timeCounter > waitTime)
				y += speed * FP.elapsed;
				
			if (y > FP.screen.height)
				reset();
				
			var shoot:Shoot = collide("shoot", x, y) as Shoot;
			
			if (shoot)
			{
				Level(world).gameScore.AddScore(1);
				reset();
			}
		}
	
		public function reset():void
		{
			x = FP.rand(FP.screen.width - width);
			y = -height;
			
			while (waitTime == 0)
			{
				waitTime = FP.rand(5);
			}
			timeCounter = 0;
		}
	}

}