package worlds 
{
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Area3 extends Area 
	{
		[Embed(source = "../assets/levels/level_3.oel", mimeType = "application/octet-stream")] 
		public static const DATA:Class;
		
		public function Area3() 
		{
			super(DATA);
		}
		
	}

}