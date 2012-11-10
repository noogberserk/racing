package entities.background 
{
	import entities.Actor;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Rocks extends Actor 
	{
		private var g:Image;
		
		public function Rocks(x:Number, y:Number) 
		{
			super(x, y);
			g = new Image(GC.ROCKS_IMAGE);
			graphic = g;
			g.centerOrigin();
			type = GC.TYPE_DECORATION;
		}
		
	}

}