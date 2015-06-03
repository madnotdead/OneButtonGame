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
		private var instructionTweenOut:VarTween;
		private var pressTweenOut:VarTween;
		public var gameScore:GameScore;
		public var player:Player;
		private var playerHealth:Text;
		private var finalScore:Text;
		private var instruction:Text;
		private var pressSpace:Text;
		
		private var enemyTimer:Number = 3;
		private var enemyWaitTime:Number = 0;
		public function Level() 
		{
			super();
			status = INIT;
			
			titleTweenIn = new VarTween();
			titleTweenOut = new VarTween();
			pressTweenOut = new VarTween();
			instructionTweenOut = new VarTween();
			addTween(pressTweenOut);
			addTween(instructionTweenOut);
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
				
				if (Input.pressed(Key.ESCAPE)) status == GAMEOVER;
				
				enemyWaitTime += FP.elapsed;
				
				if (FP.rand(100) == 8 && enemyWaitTime > enemyTimer)
				{
					trace("added new enemy");
					add(new Enemy(FP.rand(FP.screen.width - 104), -84));
					enemyWaitTime = 0;
				}
			}
			
			if (status == STARTING)
			{
				
				//titleTween.tween(title, "alpha", 2, 0, 3);
				title.alpha = 0;// visible = false;
				
				add(new BackGround());
				 
				player = new Player(10, 800);
				add(player);	
				
				if (classCount(BigMeteor) < 3)
					for (var i:int = 0; i < 3; i++) 
						add(new BigMeteor(FP.rand(FP.screen.width - 136), -177));
						
				if (classCount(SmallMeteor) <5)
					for (var j:int = 0; j < 5; j++) 
						add(new SmallMeteor(FP.rand(FP.screen.width - 44), -42));
						
				gameScore = new GameScore(700, FP.screen.height - 20);
				add(gameScore);
				
				
				playerHealth = new Text("Health: " + player.Health);
				playerHealth.scale = 2;
				playerHealth.x = FP.screen.width - 200;
				playerHealth.y = 50;
				
				addGraphic(playerHealth);
				
				//tiene que haber otra forma de hacer aparecer esto nuevamente
				instruction = new Text("SPACE TO SHOOT. SURVIVE.");
				instruction.scale = 1;
				instruction.x = 20;
				instruction.y = FP.screen.height - 20;
				addGraphic(instruction);
				status = GAME;
			}
			
			if (status == INIT)
			{
				add(new BackGround);
				title =  new Text("ONE GAME BUTTON");
				title.scale = 5;
				title.x = (FP.screen.width - title.scaledWidth) / 2;
				title.y = 100;
				
				
				addGraphic(title);
				
				pressSpace = new Text("PRESS SPACE TO START THE GAME");
				pressSpace.scale = 3;
				pressSpace.x = (FP.screen.width - pressSpace.scaledWidth) / 2;
				pressSpace.y = 250;
				addGraphic(pressSpace);
				
				instruction = new Text("SPACE TO SHOOT. SURVIVE.");
				instruction.scale =2;
				instruction.x = (FP.screen.width - instruction.scaledWidth) / 2;
				instruction.y = 700;
				addGraphic(instruction);
				
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
						pressTweenOut.tween(pressSpace, "alpha", 0, 2);
						instructionTweenOut.tween(instruction, "alpha", 0, 2);
					}
				}
			}
			
			if (status == WAIT2)
			{
				if (titleTweenOut.percent == 1 && pressTweenOut.percent == 1 && instructionTweenOut.percent == 1)
				{
					
					status = STARTING;
				}
			}
			
			if (status == GAMEOVER)
			{
				var score:int = gameScore.GetScore;				
				title =  new Text("GAMEOVER");
				title.scale = 5;
				title.x = (FP.screen.width - title.scaledWidth) / 2;
				title.y = 100;
				
				instruction = new Text("PRESS SPACE TO RESTART");
				instruction.scale = 3;
				instruction.x = (FP.screen.width - instruction.scaledWidth) / 2;
				instruction.y =500;
				
				pressSpace = new Text("YOUR SCORE: " + gameScore.GetScore);
				pressSpace.scale = 4;
				pressSpace.x = (FP.screen.width - pressSpace.scaledWidth) / 2;
				pressSpace.y = 300;
				
				add(new BackGround());
				addGraphic(title).name = "title";
				addGraphic(instruction).name = "instruction";
				addGraphic(pressSpace).name = "pressSpace";
				
				if (Input.pressed(Key.SPACE))
				{
					removeAll();
					status = STARTING;
					title.visible = false;
					instruction.visible = false;
					pressSpace.visible = false;
				}
			}
		}
	}

}