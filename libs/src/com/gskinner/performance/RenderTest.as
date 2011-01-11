﻿/*** RenderTest by Grant Skinner. Feb 1, 2010* Visit www.gskinner.com/blog for documentation, updates and more free code.*** Copyright (c) 2010 Grant Skinner* * Permission is hereby granted, free of charge, to any person* obtaining a copy of this software and associated documentation* files (the "Software"), to deal in the Software without* restriction, including without limitation the rights to use,* copy, modify, merge, publish, distribute, sublicense, and/or sell* copies of the Software, and to permit persons to whom the* Software is furnished to do so, subject to the following* conditions:* * The above copyright notice and this permission notice shall be* included in all copies or substantial portions of the Software.* * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR* OTHER DEALINGS IN THE SOFTWARE.**/package com.gskinner.performance {		import flash.utils.getTimer;	import flash.geom.Rectangle;	import flash.display.DisplayObject;	import flash.display.BitmapData;	import flash.geom.Matrix;		/**	* Represents a render test, which times how long it takes to draw a specified DisplayObject to a BitmapData instance.	* This provides a reasonable idea of the rendering and compositing time required to draw the DisplayObject	* to screen. Note that this test will only utilize a single processor core to perform the draw, whereas multiple	* cores may be utilized to draw it to the screen.	**/	public class RenderTest extends AbstractTest {			// public properties:		/** The DisplayObject to draw. **/		public var displayObject:DisplayObject;		/** The area of the display object to draw. If null then displayObject.getBounds() will be used. **/		public var bounds:Rectangle;			// protected properties:		/** @private **/		protected var bmpd:BitmapData;			// constructor:		/** Creates a new instance of RenderTest. See properties for parameter information. **/		public function RenderTest(displayObject:DisplayObject, bounds:Rectangle=null, name:String=null, iterations:uint=0, loops:uint=1, description:String=null) {			this.displayObject = displayObject;			this.bounds = bounds;			super(name,iterations,loops,description);		}				/**		* PerformanceTest calls <code>run()</code> on tests to run and time them. The run() method returns the		* time for that iteration, or -1 if an error occurred. You would not generally call the run()		* method directly.		**/		override public function run():int {			var b:Rectangle = bounds ? bounds : displayObject.getBounds(displayObject);			if (bmpd == null || bmpd.width != Math.ceil(b.width) || bmpd.height != Math.ceil(b.height)) {				try {					bmpd = new BitmapData(Math.ceil(b.width),Math.ceil(b.height),true,0);				} catch(e:*) {					logError(new Error("Specified bounds or displayObject dimensions are too large to render."));					return -1;				}			}						var mtx:Matrix = new Matrix(1,0,0,1,-b.x,-b.y);			bmpd.fillRect(bmpd.rect,0);			var t:uint = getTimer();			for (var i:uint=0; i<loops; i++) {				// dirty the DO before rendering:				displayObject.alpha = 0.1;				displayObject.alpha = 1;				bmpd.draw(displayObject,mtx);			}			t = getTimer()-t;						logIteration(t);			return t;		}	}	}