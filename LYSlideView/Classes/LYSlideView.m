//
//  LYSlideView.m
//  testSlideTable
//
//  Created by マックノート２ on 13-12-27.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import "LYSlideView.h"
#import "UIView+Extend.h"

@interface LYSlideView()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView * scrollView;
@property (assign, nonatomic) NSInteger      currentPage;
@property (assign, nonatomic) BOOL           isDragged;

@end

@implementation LYSlideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor redColor];
        
        [self addSubview:_scrollView];
        
        _pageNum = 1;
        _currentPage = 0;
        _isDragged = NO;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)layoutSubviews
{
    if (self.topView) {
        _scrollView.top = _topView.bottom;
        _scrollView.height = self.height - _topView.height;
    }
    NSInteger i = 0;
    for (UIView *pageView in _pageViews) {
        pageView.left = self.width * i;
        pageView.width = self.width;
        pageView.height = _scrollView.height;
        pageView.tag = i * 111;
        i++;
    }
    self.scrollView.contentSize = CGSizeMake(self.width * i, _scrollView.height);
    
    _isDragged = NO;
    CGFloat offsetX = self.width * _currentPage;
    CGPoint point = CGPointMake(offsetX, 0);
    [_scrollView setContentOffset:point];
}

-(void)setTopView:(UIView *)topView
{
    if (topView != _topView) {
        _topView = topView;
        _topView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    [self insertSubview:_topView atIndex:0];
    [self setNeedsLayout];
}

-(void)setPageViews:(NSMutableArray *)pageViews
{
    if (_pageViews != pageViews) {
        _pageViews = pageViews;
    }
    _pageNum = _pageViews.count;
    
    for (UIView *pageView in _pageViews) {
        [self.scrollView addSubview:pageView];
    }
    [self setNeedsLayout];
}

-(NSInteger)pageNum
{
    return _pageNum;
}

-(void)slideViewToPage:(NSInteger)page
{
    _currentPage = page;
    CGPoint point = CGPointMake(self.width * page, 0);
    [_scrollView setContentOffset:point animated:YES];
}

-(void)slideViewToNextPage:(BOOL)animated
{
    CGPoint currentOffset = _scrollView.contentOffset;
    CGPoint nextOffset = CGPointMake(self.width + currentOffset.x, currentOffset.y);
    if (currentOffset.x == _scrollView.contentSize.width - self.width) {
        nextOffset = CGPointMake(0, currentOffset.y);
    }
    [_scrollView setContentOffset:nextOffset animated:animated];
}

-(void)cycleScrollRepeat:(NSInteger)times
{
    times = 2;
    while (times) {
        [self slideViewToNextPage:YES];
        times--;
    }
}

#pragma mark - UIScrollView delegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _isDragged = YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    if (_isDragged) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(slideView:didSlideToPage:)]) {
            _currentPage = floorf(offsetX/self.width);
            [self.delegate slideView:self didSlideToPage:_currentPage];
        }
    }
}

@end
