package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Tank extends BaseTank
	{
		public function Tank() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(e:Event):void 
		{
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		private function onClick(e:MouseEvent):void
		{
			dispatchEvent(new Event("SHOOT"));
		}
		override public function update():void
		{
			moveTank();
			super.update();
		}
		
		public function moveTank():void
		{
			//Sinus gebruik je voor de y as
			//Cosinus voor de x as
			//Om wiskundige berekeningen te maken gebruik je een radian
			//Radian = degrees * PI / 180
			//Degrees = radian * 180 / PI
			
			var r:Number = this.rotation * Math.PI / 180;
			
			var xMove:Number = Math.cos(r);
			var yMove:Number = Math.sin(r);
			
			this.x += Main.input.y * xMove * 5;
			this.y += Main.input.y * yMove * 5;	
			//targetPosition.x = mouseX;
			//targetPosition.y = mouseY;
		}
	}
}