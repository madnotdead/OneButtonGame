package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Enemy extends Entity 
		{
		[Embed(source = "../assets/enemyBlack2.png")]private const ENEMY:Class;
		
		private var speed:int;
		private var health:int;
		public function Enemy(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(ENEMY);
			
			super(x, y, graphic, mask);
			
			setHitbox(104, 84);
			width = 104;
			height = 84;
			
			type = "enemy";
			speed = 200;
			health = 100;
			mask = new Pixelmask(ENEMY);
		}
		
		
		override public function update():void 
		{
			super.update();
			
			y += speed * FP.elapsed;
			
			
			var p:Player = collide("player", x, y) as Player;
			
			
			if (p || y > FP.screen.height)
			{
				FP.world.remove(this);
				Level(world).player.takeDamage(20);
			}
			
			var shoot:Shoot = collide("shoot", x, y) as Shoot;
			
			if (shoot)
				takeDamage(25);
		}
		
		
		private function reset():void
		{
			x = FP.rand(FP.screen.width - width);
			y = -height;
		}
		
		public function takeDamage(damage:int):void{
			
			health -= damage;
			
			if (health < 0)
				destroy();
		}
		
		private function destroy():void
		{
			graphic = null;
			FP.world.remove(this);
		}
	}

}