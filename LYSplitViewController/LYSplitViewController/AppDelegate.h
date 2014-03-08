//
//  AppDelegate.h
//  LYSplitViewController
//
//  Created by マックノート２ on 13-11-7.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYSplitViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet LYSplitViewController * rootViewController;

@end
