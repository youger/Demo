//
//  LYSplitViewController.m
//  LYSplitViewController
//
//  Created by マックノート２ on 13-11-7.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import "LYSplitViewController.h"

@interface LYSplitViewController ()

@property (assign, nonatomic) CGPoint firstPoint;
@property (assign, nonatomic) CGPoint lastPoint;

@end

@implementation LYSplitViewController

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
    _isShowMaster = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDetailView:nil];
    [self setMasterView:nil];
    [self setNavBar:nil];
    [super viewDidUnload];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(void)toggleMaster:(id)sender
{
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect rect = self.view.bounds;
                         if (_isShowMaster) {
                             _detailView.frame = rect;
                         }else{
                             rect = _masterView.frame;
                             rect.origin.x = _masterView.frame.size.width;
                             _detailView.frame = rect;
                         }
                     }
                     completion:^(BOOL finished) {
                         _isShowMaster = !_isShowMaster;
                     }
     ];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    _firstPoint = [touch locationInView:self.view];
    _lastPoint  = [touch locationInView:self.view];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    _lastPoint = [touch locationInView:self.view];
    if (_lastPoint.x - _firstPoint.x < -100 && _isShowMaster) {
        [self toggleMaster:nil];
    }else if(_lastPoint.x - _firstPoint.x > 100 && !_isShowMaster){
        [self toggleMaster:nil];
    }
}


@end
