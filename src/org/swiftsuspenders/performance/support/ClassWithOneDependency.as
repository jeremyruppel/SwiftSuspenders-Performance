//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.performance.support
{

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.01.2011
	 */
	public class ClassWithOneDependency
	{
		//--------------------------------------
		//  DEPENDENCIES
		//--------------------------------------
		
		[Inject]
		public var number : Number;
	
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ClassWithOneDependency( )
		{
		}
	
	}

}