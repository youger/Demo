//
//  LYTableViewController.h
//  LYNestedTables
//
//  Created by マックノート２ on 13-9-6.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYMainCell.h"

@interface LYTableViewController : UITableViewController<LYTableViewDataSource, LYTableViewDelegate>
{
    NSMutableDictionary *expandedIndexes;
    NSMutableDictionary *cellNumIndexes;
}
@property (strong, nonatomic) IBOutlet LYMainCell     *mainCell;

@property (nonatomic) NSInteger cellNum;
@property (nonatomic) CGFloat   height;
@property (nonatomic) BOOL      isExpanded;

@end
