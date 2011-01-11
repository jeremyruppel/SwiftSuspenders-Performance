//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.performance.base
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import flash.utils.getQualifiedClassName;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.01.2011
	 */
	public class InjectorTestSuite extends TestSuite
	{
		//--------------------------------------
		//  CLASS CONSTANTS
		//--------------------------------------
		
		/**
		 * @private
		 */
		public const LOOPS : int = 10000;
		
		/**
		 * @private
		 */
		public const ITERATIONS : int = 5;
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function InjectorTestSuite( )
		{
			super( [ ], getQualifiedClassName( this ), null, setup, ITERATIONS );
		}
			
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		/**
		 * setup for this test
		 */
		public function setup( ) : void
		{
		}

		/**
		 * @param name String
		 * @param method Function
		 * @param params Array
		 */
		public function test( name : String, method : Function, params : Array ) : void
		{
			tests.push( new MethodTest( method, params, name, ITERATIONS, LOOPS, name ) );
		}
	
	}

}