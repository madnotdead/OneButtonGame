package 
{
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
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(PLAYER);
			super(x, y, graphic, mask);
			
			setHitbox(99, 75);
			
			width = 99;
			height = 75;
			to();
		}
	
		

		function to():void {
			var movement:VarTween = new VarTween(from, ONESHOT);
			movement.tween(target, "x", 700, 1.8,  Ease.sineInOut);
			addTween(movement);
		}

		function from():void {
			var movement:VarTween = new VarTween(to, ONESHOT);
			movement.tween(target, "x", 10,1.8, Ease.sineInOut);
			addTween(movement);
		}
			
		override public function update():void 
		{
			trace("Player updates");
			super.update();
			
			var b:BigMeteor = collide("meteor", x, y) as BigMeteor;
			
			if (b)
			{
				destroy();
			}
					
		}
		
		public function  destroy():void
		{
			FP.world.remove(this);
		}
	}

}