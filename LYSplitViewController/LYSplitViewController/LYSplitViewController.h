//
//  LYSplitViewController.h
//  LYSplitViewController
//
//  Created by マックノート２ on 13-11-7.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYSplitViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (strong, nonatomic) IBOutlet UIView *masterView;
@property (assign, nonatomic) BOOL isShowMaster;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

-(IBAction)toggleMaster:(id)sender;

@end
