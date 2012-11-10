package worlds 
{
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Area1 extends Area 
	{
		[Embed(source = "../assets/levels/level_1.oel", mimeType = "application/octet-stream")] 
		public static const DATA:Class;
		
		public function Area1() 
		{
			super(DATA);
		}
		
	}

}