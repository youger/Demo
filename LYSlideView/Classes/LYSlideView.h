//
//  LYSlideView.h
//  testSlideTable
//
//  Created by マックノート２ on 13-12-27.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYSlideView;

@protocol LYSlideViewDelegate <NSObject>

@optional

- (void)slideView:(LYSlideView *)slidView didSlideToPage:(NSInteger)pageNum;

@end

@interface LYSlideView : UIView

@property (weak, nonatomic) id<LYSlideViewDelegate>  delegate;
@property (strong, nonatomic) UIView  * topView;
@property (strong, nonatomic) NSArray * pageViews;
@property (assign, nonatomic) NSInteger pageNum; //default 1;

- (void)slideViewToPage:(NSInteger)page;
-(void)slideViewToNextPage:(BOOL)animated;
-(void)cycleScrollRepeat:(NSInteger)times;

@end
