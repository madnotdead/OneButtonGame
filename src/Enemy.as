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
	public class Enemy extends Entity 
		{
		[Embed(source = "../assets/enemyBlack2.png")]private const ENEMY:Class;
		
		private var speed:int;
		
		public function Enemy(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(ENEMY);
			
			super(x, y, graphic, mask);
			
			setHitbox(104, 84);
			width = 104;
			height = 84;
			
			type = "enemy";
			speed = 200;
		}
		
		
		override public function update():void 
		{
			super.update();
			
			y += speed * FP.elapsed;
			
			
			var p:Player = collide("player", x, y) as Player;
			
			if (p)
			{
				FP.world.remove(this);
				
			}
		}
		
	}

}