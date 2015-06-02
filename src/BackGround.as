package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class BackGround extends Entity 
	{
		[Embed(source = "../assets/darkPurple.png")]private const BACKGROUND:Class;
		
		public function BackGround(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Backdrop(BACKGROUND);
			super(x, y, graphic, mask);
			
		}
		
	}

}