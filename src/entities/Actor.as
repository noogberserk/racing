package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.FP;
	import worlds.*;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Actor extends Entity 
	{
		
		public function Actor(x:Number,y:Number) 
		{
			super(x, y);
		}
		
		
		public function get area():Area
		{
			return world as Area;
		}
	}

}