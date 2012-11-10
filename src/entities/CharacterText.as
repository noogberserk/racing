package entities 
{
	import net.flashpunk.utils.*;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class CharacterText extends Actor 
	{
		private var str:String;
		private var remove:Boolean = false;
		
		public function CharacterText(x:Number,y:Number,str:String) 
		{
			super(x, y);
			this.str = str;
		}
		override public function update():void 
		{
			super.update();
			/*if (Input.pressed(Key.S)) {
				ReadingInterface.id.open(str,this);
			}*/
			if (PlayerCar.id.y < y) {
				ReadingInterface.id.open(str, this);
				FP.world.remove(this);
				trace(str)
			}
		}
		
	}

}