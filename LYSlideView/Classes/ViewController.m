//
//  ViewController.m
//  testSlideTable
//
//  Created by マックノート２ on 13-12-27.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import "ViewController.h"
#import "LYSlideView.h"
#import "UIView+Extend.h"

@interface ViewController ()<LYSlideViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIPageControl *pageCtrl;
@property (strong, nonatomic) LYSlideView   *slideTable;
@property (strong, nonatomic) LYSlideView   *slideImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGFloat x = (self.view.width -60)/2;
    CGFloat y = self.view.height - 20;
    self.pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(x, y, 60, 20)];
    _pageCtrl.numberOfPages = 3;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
    
        _pageCtrl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageCtrl.pageIndicatorTintColor = [UIColor darkGrayColor];
    }
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 44)];
    topView.backgroundColor = [UIColor redColor];
    
    _slideImage = [[LYSlideView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
    
    NSMutableArray *tableArray = [NSMutableArray array];
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        tableView.alpha = 0.5;
        tableView.tag = i * 111;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableArray addObject:tableView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"show%d",i]]];
        imageView.tag = i;
        imageView.backgroundColor = [UIColor colorWithRed:i green:i blue:i alpha:1];
        [imageArray addObject:imageView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0, 0, 60, 40);
        button.left = 100 * i;
        button.tag = i;
        [button setTitle:[NSString stringWithFormat:@"Button%d",i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:button];
    }
    
    _slideImage.topView = topView;
    _slideImage.pageViews = imageArray;
    [NSTimer scheduledTimerWithTimeInterval:2 target:_slideImage selector:@selector(slideViewToNextPage:) userInfo:nil repeats:YES];
    
    _pageCtrl.bottom = _slideImage.height - 20;
    
    _slideTable = [[LYSlideView alloc] initWithFrame:self.view.frame];
    _slideTable.delegate = self;
    _slideTable.pageViews = tableArray;
    _slideTable.topView = _slideImage;
    
    [self.view addSubview:_slideTable];
    [self.view addSubview:_pageCtrl];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Rotate

-(BOOL)shouldAutorotate
{
    return YES;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
//    NSLog(@"%@", self.view);
//    NSLog(@"%@", self.slideTable);
}

-(void)buttonPressed:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [_slideTable slideViewToPage:button.tag];
}

-(void)slideImageView
{
    [_slideImage slideViewToNextPage:YES];
}

#pragma mark - LYSlideView delegate

-(void)slideView:(LYSlideView *)slidView didSlideToPage:(NSInteger)pageNum
{
    _pageCtrl.currentPage = pageNum;
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", tableView.tag];
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
