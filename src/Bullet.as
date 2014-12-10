package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Danny
	 */
	public class Bullet extends MovieClip
	{
		private var xMove:Number;
		private var yMove:Number;
		
		public function Bullet(xpos:Number, ypos:Number, rot:Number) 
		{
			this.rotation = rot;
			addChild (new BulletArt());
			
			var r:Number = this.rotation * Math.PI / 180;
			xMove = Math.cos(r);
			yMove = Math.sin(r);
			
			this.x = xpos + (xMove * 470)*0.2;
			this.y = ypos + (yMove * 470)*0.2;
			//this.x = xpos;
			//this.y = ypos;
			
		}
		public function update():void
		{
			this.x += xMove * 9;
			this.y += yMove * 9;
		}
		
	}

}