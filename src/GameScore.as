package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class GameScore extends Entity 
	{
		private var _score:int = 0;
		
		public function GameScore(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Text("Score: 0");
			super(x, y, graphic, mask);
			
			
		}
		
		public function get GetScore():int { return _score; }
		
		public function AddScore(score:int):void
		{
			_score += score;
			
			Text(graphic).text = "Score: " + _score;
		}
		
		
	}

}