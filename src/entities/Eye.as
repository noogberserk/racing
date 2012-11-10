package entities
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Eye extends Actor 
	{
		private var g:Image;
		
		public function Eye(x:Number,y:Number) 
		{
			super(x, y);
			g = new Image(GC.RIDER_FACE);
			//g.add("stand", [0, 1, 2, 3, 4], 10/60, true);
			graphic = g;
			//g.play("stand");
			//g.frame = 4;
		}
		override public function update():void 
		{
			super.update();
			g.angle += 10 * FP.elapsed;
		}
	}

}