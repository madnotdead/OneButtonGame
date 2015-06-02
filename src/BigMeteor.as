package 
{
	import flash.geom.Point;
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
		private var speed:int;
		public function BigMeteor(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(METEOR);
			super(x, y, graphic, mask);
			setHitbox(136, 111);
			type = "bMeteor";
			healt = 3;
			//trace(FP.rand(5));
			speed = 200;
		}
		
		override public function update():void 
		{
			super.update();
			
			y += speed * FP.elapsed;
			
			var shoot:Shoot = collide("shoot", x, y) as Shoot;
			
			if (shoot)
			{
				healt -= 1;
				
				if (healt < 0)
					reset();	
			}
			
			//Si se fue de pantalla que resetee su posicion
			if (y > FP.screen.height)
				reset();
		}
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
		public function reset():void
		{
			x = FP.rand(FP.screen.width - width);
			y = -111;
		}
	}

}