package 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Level extends World 
	{
		private var status:String;
		private const INIT:String = "INIT";
		private const GAME:String = "GAME";
		private const STARTING:String = "STARTING";
		private const WAIT:String = "WAIT";
		private const WAIT2:String = "WAIT2";
		private const GAMEOVER:String = "GAMEOVER";
		
		private var title:Text;
		private var titleTweenIn:VarTween;
		private var titleTweenOut:VarTween;
		public var gameScore:GameScore;
		public var player:Player;
		private var playerHealth:Text;
		public function Level() 
		{
			super();
			status = INIT;
			
			titleTweenIn = new VarTween();
			titleTweenOut = new VarTween();
			addTween(titleTweenIn);
			addTween(titleTweenOut);			
		}
		
		override public function update():void 
		{
			super.update();
			
			
			if (status == GAME)
			{
				if (!player.IsAlive)
				{
					removeAll();
					status = GAMEOVER;
				}
				
				playerHealth.text = "Health: " + player.Health;
			}
			
			if (status == STARTING)
			{
				
				//titleTween.tween(title, "alpha", 2, 0, 3);
				title.alpha = 0;// visible = false;
				
				add(new BackGround());
				 
				player = new Player(10, 850);
				add(player);	
				
				if (classCount(BigMeteor) < 3)
					for (var i:int = 0; i < 3; i++) 
						add(new BigMeteor(FP.rand(FP.screen.width - 136), -177));
						
				if (classCount(SmallMeteor) <10)
					for (var j:int = 0; j < 10; j++) 
						add(new SmallMeteor(FP.rand(FP.screen.width - 136), -177));
						
				gameScore = new GameScore(700, 850);
				
				add(gameScore);
				
				
				playerHealth = new Text("Health: " + player.Health);
				playerHealth.scale = 2;
				playerHealth.x = 550;
				playerHealth.y = 50;
				
				addGraphic(playerHealth);
				
				status = GAME;
			}
			
			if (status == INIT)
			{
				title =  new Text("ONE GAME BUTTON");
				title.scale = 5;
				title.x = (FP.screen.width - title.scaledWidth) / 2;
				title.y = 100;
				
				addGraphic(title);
				
				titleTweenIn.tween(title, "alpha", 1, 2);
				
				status = WAIT;
			}
			
			if (status == WAIT)
			{
				if (titleTweenIn.percent == 1)
				{
					if (Input.pressed(Key.SPACE))
					{
						status  = WAIT2;
						titleTweenOut.tween(title, "alpha", 0, 2);
					}
				}
			}
			
			if (status == WAIT2)
			{
				if (titleTweenOut.percent == 1)
					status = STARTING;
			}
			
			if (status == GAMEOVER)
			{
				var score:int = gameScore.GetScore;				
				title =  new Text("GAMEOVER");
				title.scale = 5;
				title.x = (FP.screen.width - title.scaledWidth) / 2;
				title.y = 100;
				add(new BackGround());
				addGraphic(title);
			}
		}
	}

}