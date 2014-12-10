package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Danny Kruiswijk
	 */
	public class Main extends Sprite 
	{
		public static var myTank:Tank;
		public static var input:Point = new Point();
		private var enemies:Vector.<EnemyTank>;
		private var chests: Vector.<Chest>;
		
		private var bullets:Array;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			trace("Kijk de beste game ooit!");
			
			bullets = new Array();
			chests = new Vector.<Chest>();
			
			
			myTank = new Tank();
			addChild(myTank);
			myTank.x = stage.stageWidth * 0.5;
			myTank.y = stage.stageHeight * 0.5;
			
			createChests();
			
			myTank.addEventListener("SHOOT", createBullet);
			
			enemies = new Vector.<EnemyTank>();
			for (var i:int = 0; i < 10; i++) 
			{
				var enemy:EnemyTank = new EnemyTank();
				enemies.push(enemy);
				addChild(enemy);
				enemy.x = stage.stageWidth * Math.random();
				enemy.y = stage.stageHeight * Math.random();
				
			}
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			addEventListener(Event.ENTER_FRAME, loop);
		}		
		
		private function createChests():void 
		{
			for (var i:int = 0; i < 5; i++)
			{
				var chest:Chest = new Chest();
				chests.push(chest);
				addChild(chest);
				chest.x = Math.random() * stage.stageWidth;
				chest.y = Math.random() * stage.stageHeight;
				chest.scaleX = chest.scaleY = myTank.scaleX;
			}
		}
		
		private function createBullet(e:Event):void 
		{
			var bullet:Bullet = new Bullet(myTank.x, myTank.y, myTank.rotation+myTank.turretRotation);
			bullets.push(bullet);
			addChild (bullet);
			
			bullet.scaleX = bullet.scaleY = myTank.scaleX + 0.1;
		}
		
		private function loop(e:Event):void
		{	
			myTank.update();
			
			var length:int = enemies.length
			for (var j:int = 0; j < length; j++) 
			{
				enemies[j].update();
			}
			
			length = bullets.length;
			
			for (var i:int = 0; i < bullets.length; i ++)
			{
				var toRemove:Boolean = false;
				bullets[i].update();
				for (var k:int = 0; k < chests.length; k++) 
				{
					if (chests[k].hitTestPoint(bullets[i].x, bullets[i].y, true))
					{
						toRemove = true;
						
						chests[k].lives--;
						if (chests[k].lives <= 0)
						{
							removeChild(chests[k]);
							chests.splice(k, 1);
						}
					}
				}
				
				if (bullets[i].x > stage.stageWidth || bullets[i].x < 0 || bullets[i].y > stage.stageHeight || bullets[i].y < 0)
				{
					toRemove = true;
				}
				if (toRemove)
				{
					removeChild(bullets[i]);
					bullets.splice(i, 1);
				}
			}
		}
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.D)
			{
				input.x = 0;
			}
			if (e.keyCode == Keyboard.A)
			{
				input.x = 0;
			}
			if (e.keyCode == Keyboard.W)
			{
				input.y = 0;
			}
			if (e.keyCode == Keyboard.S)
			{
				input.y = 0;
			}
		}
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.D)
			{
				input.x = 1;				
			}
				
			if (e.keyCode == Keyboard.A)
			{
				input.x = -1;				
			}
				
			if (e.keyCode == Keyboard.W)
			{
				input.y = 1;				
			}
				
			if (e.keyCode == Keyboard.S)
			{
				input.y = -1;				
			}
		}
		
	}
	
}