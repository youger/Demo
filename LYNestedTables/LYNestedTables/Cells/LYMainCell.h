//
//  LYMainCell.h
//  LYNestedTables
//
//  Created by マックノート２ on 13-9-6.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTableViewCell.h"
#import "LYSubCell.h"

static const int height = 50;
static const int subCellHeight = 44;

@protocol LYTableViewDataSource <NSObject, UITableViewDataSource>

@required

- (NSInteger)tableView:(UITableView *)subTableView numberOfRowsAtParentIndexPath:(NSIndexPath *)parentIndexPath;
- (NSString *)tableView:(UITableView *)subTableView titleForRowAtIndexPath:(NSIndexPath *)indexPath atParentIndexPath:(NSIndexPath *)parentIndexPath;

@end

@protocol LYTableViewDelegate <NSObject,UITableViewDelegate>

@optional

- (CGFloat)tableView:(UITableView *)subTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath atParentIndexPath:(NSIndexPath *)parentIndexPath;
- (void)tableView:(UITableView *)subTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath atParentIndexPath:(NSIndexPath *)parentIndexPath;

@end

@interface LYMainCell : LYTableViewCell<UITableViewDataSource, UITableViewDelegate>
{
//    id<LYTableViewDataSource> _dataSource;
//    id<LYTableViewDelegate>   _delegate;
    
    NSIndexPath *_indexPath;
}

@property (weak, nonatomic) id<LYTableViewDataSource> dataSource;
@property (weak, nonatomic) id<LYTableViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView      *mainCellView;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel     *titleLabel;
@property (strong, nonatomic) IBOutlet UITableView *subTableView;
@property (strong, nonatomic) IBOutlet LYSubCell   *subCell;
@property (strong, nonatomic) NSIndexPath          *indexPath;

+ (int) getHeight;
+ (int) getsubCellHeight;


@end
