package  entities.background
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Background extends Entity 
	{
		private var g:Image;
		public function Background(x:Number, y:Number) 
		{
			super(x, y);
			g = new Image(GC.BACKGROUND_IMAGE);
			graphic = g;
		}
		
	}

}