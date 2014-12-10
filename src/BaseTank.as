package  
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Danny
	 */
	public class BaseTank extends MovieClip
	{
		protected var myTankBody:TankBodyArt;
		protected var myTankTurret:TankTurretArt;
		public var turretRotation:Number;
		public static var targetPosition:Point;
		
		public function BaseTank() 
		{
			this.scaleX = this.scaleY = 0.2;
			
			myTankBody = new TankBodyArt();			//instantieren van de class
			this.addChild(myTankBody);
			
			myTankTurret = new TankTurretArt();
			this.addChild(myTankTurret);
		}
		public function update():void
		{
			rotateBody();
			rotateTurret();
		}
		public function rotateTurret():void
		{
			//var dx:Number = targetPosition.x;
			//var dy:Number = targetPosition.y;
			var dx:Number = mouseX;
			var dy:Number = mouseY;
			var r:Number = Math.atan2(dy, dx);
			var degrees:Number = r * 180 / Math.PI;
			myTankTurret.rotation = degrees;
			turretRotation = degrees;
		}
		private function rotateBody():void
		{
			this.rotation += Main.input.x * 5;
		}
		
		
	}
}