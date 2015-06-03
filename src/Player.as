package 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Player extends Entity 
	{	
		[Embed(source="../assets/player.png")]	private const PLAYER:Class;
		private var target:Object = this;
		private var isAlive:Boolean = true;
		
		private var leftShoot:Point;
		private var rightShoot:Point;
		private var health:int = 100;
		
		public function get Health():int { return health; }
		public function get IsAlive():Boolean { return isAlive; }
		
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(PLAYER);
			super(x, y, graphic, mask);
			
			setHitbox(99, 75);
			
			width = 99;
			height = 75;
			to();
			
			leftShoot = new Point(2, 0);
			rightShoot = new Point(90, 0);
			
		}
	
		

		private function to():void {
			var movement:VarTween = new VarTween(from, ONESHOT);
			movement.tween(target, "x", 700, 1.8,  Ease.sineInOut);
			addTween(movement);
		}

		private function from():void {
			var movement:VarTween = new VarTween(to, ONESHOT);
			movement.tween(target, "x", 10,1.8, Ease.sineInOut);
			addTween(movement);
		}
			
		override public function update():void 
		{
			super.update();
		
			var b:BigMeteor = collide("bMeteor", x, y) as BigMeteor;
			var s:SmallMeteor = collide("sMeteor", x, y) as SmallMeteor;
			
			if (b || s)
			{
				health-= 10;
				if(b)
					b.reset();
				else
					s.reset();
					
				trace("Hits: " + health); 
			}
			
			
			if (Input.pressed(Key.SPACE))
			{
				
				
				var aux:Number = 0;
				aux = leftShoot.x + x;
				
				var aux2:Number = 0;
				aux2 = leftShoot.y + y;
				
				var shootL:Shoot = new Shoot(aux, aux2);
				var auxR:Number = 0;
				auxR = rightShoot.x + x;

				var auxR2:Number = 0;
				auxR2 = rightShoot.y + y;
				
				var shootR:Shoot = new Shoot(auxR, auxR2);
				
				FP.world.add(shootL);
				FP.world.add(shootR);
			}
		}
		
		public function  destroy():void
		{
			FP.world.remove(this);
		}
		
		public function takeDamage(damage:int):void
		{
			health -= damage;
			
			if (health < 0)
			{
				isAlive = false;
				this.visible = false;
				this.collidable = false;
			}
				
		}
	}

}