package entities 
{
	import net.flashpunk.utils.*;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class LeftCar extends PlayerCar 
	{
		public static var id:LeftCar;
		
		public function LeftCar(x:Number, y:Number) 
		{
			id = this
			super(x, y);
		}
		
		
		override public function checkSplitCar():void 
		{
			return; 
		}
		
		override public function checkDirection():void 
		{
			//Checking Input for Direction (x)
			if (Input.check(Key.RIGHT)) {
				if (isRunning) {
					x -= v.x * FP.elapsed;
				}
				g.angle++;
				if (g.angle >= GC.MAX_ANGLE) {
					g.angle = GC.MAX_ANGLE;
				}
			}
			else {
				if (g.angle > 0) {
					g.angle--;
					if (isRunning) {
						x -= v.x * FP.elapsed;
					}
				}
			}
			if (Input.check(Key.LEFT)) {
				if (isRunning) {
					x -= v.x * FP.elapsed;
				}
				g.angle--;
				if (g.angle <= -GC.MAX_ANGLE) {
					g.angle = -GC.MAX_ANGLE;
				}
			}
			else {
				if (g.angle < 0) {
					g.angle++;
					if (isRunning) {
						x -= v.x * FP.elapsed;
					}
				}
			}
		}
	}

}