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
		
		public function BigMeteor(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Image(METEOR);
			super(x, y, graphic, mask);
			setHitbox(136, 111);
			type = "meteor";
		}
		
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}

}