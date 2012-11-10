package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.*;
	import net.flashpunk.utils.Input;
	import Tests.*;
	import net.flashpunk.utils.*;
	import entities.*;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Main extends Engine 
	{	
		public function Main():void 
		{
			super(240, 400, 60, true);
			FP.screen.scale = 2;
			Area.init();
			Area.load(2);
			//FP.world = new TestWorld;
			FP.screen.color = 0x695A3B;
			FP.console.enable();
		}
	}
	
}