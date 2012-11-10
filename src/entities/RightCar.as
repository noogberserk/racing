package entities 
{
	import net.flashpunk.FP
	import net.flashpunk.utils.*;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class RightCar extends PlayerCar 
	{
		private var leftCar:LeftCar;
		public static var id:RightCar;
		
		public function RightCar(x:Number, y:Number) 
		{
			id = this;
			type = "right_car";
			collidable = true;
			super(x, y);
		}
		override public function checkSplitCar():void 
		{
			return;
		}
		override public function update():void 
		{
			super.update();
			
			y = LeftCar.id.y;//trace("left car ahead");
			
			leftCar = collideWith(LeftCar.id, x, y) as LeftCar;
			if (leftCar) {
				trace("collision");
				FP.world.add(new PlayerCar((x + leftCar.x) / 2, y));
				FP.world.remove(leftCar);
				FP.world.remove(this);
			}
		}
	}

}