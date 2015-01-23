# NSView+APForwardDraggingDestination

Cocoa requires you to implement `NSDraggingDestination` methods on your `NSView` subclass, but it can be preferable to handle these methods in another class, such as an `NSViewController`.

The `APForwardDraggingDestination` category on `NSView` uses method swizzling to route any `NSDraggingDestination` methods to the given object.

## Usage

In an `NSViewController` subclass, although it can be any class, send `ap_forwardDraggingDestinationTo:` with the object that should receive `NSDraggingDestination` methods. In this example the view controller will begin to receive drag destination methods for the label:

```objc
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.label ap_forwardDraggingDestinationTo:self];
    [self.label registerForDraggedTypes:@[NSPasteboardTypeString]];
}
```

For a more complete demonstration, see `ViewController.m`.

## Issues

No known issues at this time but due to the use of method swizzling it should be thoroughly tested on future and prior versions of OS X.

## License

The MIT License

Copyright (c) 2014 Adam Preble

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
