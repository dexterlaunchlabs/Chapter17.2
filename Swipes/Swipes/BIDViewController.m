//
//  BIDViewController.m
//  Swipes
//
//  Created by Dexter Launchlabs on 7/31/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDViewController.h"
#define kMinimumGestureLength 25 
#define kMaximumVariance 5
@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize label;
@synthesize gestureStartPoint;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)eraseText { label.text = @"";
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view. // e.g. self.myOutlet = nil;
    self.label = nil;
}

#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 UITouch *touch = [touches anyObject];
 gestureStartPoint = [touch locationInView:self.view];
 }

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
 UITouch *touch = [touches anyObject];
 CGPoint currentPosition = [touch locationInView:self.view];
 
 CGFloat deltaX = fabsf(gestureStartPoint.x - currentPosition.x);
 CGFloat deltaY = fabsf(gestureStartPoint.y - currentPosition.y);
 
    if (deltaX >= kMinimumGestureLength && deltaY <= kMaximumVariance) {
        label.text = @"Horizontal swipe detected";
        [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
    }
    else if(deltaY >= kMinimumGestureLength && deltaX <= kMaximumVariance){
        label.text = @"Vertical swipe detected";
        [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];

    }
 }
@end
