package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Player extends Entity 
	{	
		[Embed(source="../assets/player.png")]	private const PLAYER:Class;
		
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(PLAYER);
			super(x, y, graphic, mask);
			
			setHitbox(99, 75);
			
			width = 99;
			height = 75;
		}
	
		override public function update():void 
		{
			trace("Player updates");
			super.update();
			
			if (Input.check(Key.A))
			{
				x -= 5;
			}
			
			if (Input.check(Key.D))
			{
				x += 5;
			}
			
			if (Input.check(Key.W))
			{y -= 5;}
			
			if (Input.check(Key.S))
			{
				y += 5;
			}
			
			var b:BigMeteor = collide("meteor", x, y) as BigMeteor;
			
			if (b)
			{
				b.destroy();
			}
					
		}
	}

}