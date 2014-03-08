//
//  LYTableViewController.m
//  LYNestedTables
//
//  Created by マックノート２ on 13-9-6.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import "LYTableViewController.h"

@interface LYTableViewController ()

@end

@implementation LYTableViewController

- (id) init
{
    if (self = [self initWithNibName:@"LYNestedTableView" bundle:nil])
    {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    return self;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    expandedIndexes = [[NSMutableDictionary alloc] init];
    cellNumIndexes  = [[NSMutableDictionary alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    LYMainCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"LYMainCell" owner:self options:nil];
        cell = _mainCell;
        self.mainCell = nil;
    }
    cell.delegate   = self;
    cell.dataSource = self;
    cell.indexPath  = indexPath;
    cell.titleLabel.text = [[NSString alloc] initWithFormat:@"parent %d",indexPath.row];
    
    //_isExpanded = ![[expandedIndexes objectForKey:indexPath] boolValue];
    _isExpanded = YES;
    _cellNum = 2;
    NSNumber *cellNum = [NSNumber numberWithInt:_cellNum];
    [cellNumIndexes setObject:cellNum forKey:indexPath];
    
    // Configure the cell...
    [cell.subTableView reloadData];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Table view delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int cellNum = [[cellNumIndexes objectForKey:indexPath] intValue];
    //_isExpanded = [[expandedIndexes objectForKey:indexPath] boolValue];
    BOOL isExpanded = [[expandedIndexes objectForKey:indexPath] boolValue];
    if(isExpanded)
    {
        return [LYMainCell getHeight] + [LYMainCell getsubCellHeight]*4 + 1;
    }
    return [LYMainCell getHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isExpanded = ![[expandedIndexes objectForKey:indexPath] boolValue];
	NSNumber *expandedIndex = [NSNumber numberWithBool:isExpanded];
	[expandedIndexes setObject:expandedIndex forKey:indexPath];
    
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    //[self.tableView reloadData];
}

#pragma mark - LYTable view data source

- (NSInteger)tableView:(UITableView *)subTableView numberOfRowsAtParentIndexPath:(NSIndexPath *)parentIndexPath
{
//    if ([[expandedIndexes objectForKey:parentIndexPath] boolValue]) {
////        return [[cellNumIndexes objectForKey:parentIndexPath] intValue];
//        return  4;
//    }
//    return 0;
    return 4;
}

-(NSString *)tableView:(UITableView *)subTableView titleForRowAtIndexPath:(NSIndexPath *)indexPath atParentIndexPath:(NSIndexPath *)parentIndexPath
{
    return @"hi测试测试测试测试测试测试ih";
}

#pragma mark - LYTable view delegate

-(void)tableView:(UITableView *)subTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath atParentIndexPath:(NSIndexPath *)parentIndexPath
{
    
}



@end
