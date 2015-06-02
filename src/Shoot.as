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
	public class Shoot extends Entity 
	{
		[Embed(source = "../assets/laserRed02.png")]private const SHOOT:Class;
		
	
		public function Shoot(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(SHOOT);
			super(x, y, graphic, mask);
			type = "shoot";
			
		}
		
		private var speed:int = 250;
		
		override public function update():void 
		{			
			super.update();
			
			y -= speed * FP.elapsed;
			
			var b:BigMeteor = collide("bMeteor", x, y) as BigMeteor;
			var s:SmallMeteor = collide("sMeteor", x, y) as SmallMeteor;
			if (y <= 0 || b || s)
				FP.world.remove(this);
		}
	}

}