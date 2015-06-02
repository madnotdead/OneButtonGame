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
	public class BigMeteor extends Entity
	{
		[Embed(source = "../assets/meteorBig.png")] private const METEOR:Class;
		private var healt:Number;
		public function BigMeteor(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(METEOR);
			super(x, y, graphic, mask);
			setHitbox(136, 111);
			type = "meteor";
			healt = 10;
		}
		
		override public function update():void 
		{
			super.update();
			
			y += 10;
			
			var shoot:Shoot = collide("shoot", x, y) as Shoot;
			
			if (shoot)
			{
				healt -= 3;
				
				if (healt < 0)
				destroy();	
			}
		}
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}

}