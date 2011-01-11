//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.performance
{
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.performance.base.InjectorTestSuite;
	import org.swiftsuspenders.performance.support.ClassWithOneDependency;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.01.2011
	 */
	public class InstantiateTestSuite extends InjectorTestSuite
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function InstantiateTestSuite( )
		{
			super( );
			
			test( 'Injector#instantiate - Number', instantiate, [ Number ] );
			test( 'Injector#instantiate - ClassWithOneDependency', instantiate, [ ClassWithOneDependency ] );
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var injector : Injector;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		override public function setup( ) : void
		{
			trace( 'setup' );
			injector = new Injector( );
			
			injector.mapValue( Number, 123 );
			
			injector.mapClass( ClassWithOneDependency, ClassWithOneDependency );
		}
		
		//--------------------------------------
		//  TESTS
		//--------------------------------------

		public function instantiate( type : Class ) : void
		{
			injector.instantiate( type );
		}
	
	}

}
