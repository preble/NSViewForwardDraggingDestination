//
//  ViewController.m
//  DraggingDelegateDemo
//
//  Created by Adam Preble on 1/22/15.
//  Copyright (c) 2015 Adam Preble. All rights reserved.
//

#import "ViewController.h"
#import "NSView+APForwardDraggingDestination.h"

@interface ViewController () <NSDraggingDestination>

@property (nonatomic, weak) IBOutlet NSTextField *label;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.label.wantsLayer = YES;
    self.label.layer.cornerRadius = 10.0;
    
    [self.label ap_forwardDraggingDestinationTo:self];
    [self.label registerForDraggedTypes:@[NSPasteboardTypeString]];
}

- (void)highlightLabel:(BOOL)highlight {
    if (highlight) {
        self.label.layer.borderColor = [NSColor blueColor].CGColor;
        self.label.layer.borderWidth = 1.0;
    }
    else {
        self.label.layer.borderWidth = 0.0;
    }
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    NSLog(@"draggingEntered!");
    [self highlightLabel:YES];
    return NSDragOperationGeneric;
}

- (void)draggingExited:(id<NSDraggingInfo>)sender {
    NSLog(@"draggingExited!");
    [self highlightLabel:NO];
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    NSArray *objects = [[sender draggingPasteboard] readObjectsForClasses:@[NSString.class] options:nil];
    self.label.objectValue = objects.firstObject;
    return YES;
}

- (void)draggingEnded:(id<NSDraggingInfo>)sender {
    NSLog(@"draggingEnded!");
    [self highlightLabel:NO];
}

@end
