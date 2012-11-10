package entities.background 
{
	import net.flashpunk.graphics.Image;
	import entities.Actor;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Cactus extends Actor 
	{
		private var g:Image;
		public function Cactus(x:Number, y:Number) 
		{
			super(x, y);
			g = new Image(GC.CACTUS_IMAGE);
			graphic = g;
			g.centerOrigin();
			type = GC.TYPE_DECORATION;
		}
		
	}

}