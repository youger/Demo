//
//  LYMainCell.m
//  LYNestedTables
//
//  Created by マックノート２ on 13-9-6.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import "LYMainCell.h"

@implementation LYMainCell

+ (int) getHeight
{
    return height;
}

+ (int) getsubCellHeight
{
    return subCellHeight;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.subTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateUI
{
    [super updateUI];
    
    CGRect bgrndFrame = self.backgroundView.frame;
    bgrndFrame.size.height = 50;
    self.backgroundView.frame = bgrndFrame;
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dataSource && [_dataSource respondsToSelector:@selector(tableView:numberOfRowsAtParentIndexPath:)]) {
        return [_dataSource tableView:_subTableView numberOfRowsAtParentIndexPath:_indexPath];
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"MainCell";
    LYSubCell *cell = [_subTableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"LYSubCell" owner:self options:nil];
        cell = _subCell;
        self.subCell = nil;
    }
    if (_dataSource && [_dataSource respondsToSelector:@selector(tableView:titleForRowAtIndexPath:atParentIndexPath:)]) {
        cell.titleLabel.text = [_dataSource tableView:_subTableView titleForRowAtIndexPath:indexPath atParentIndexPath:_indexPath];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:atParentIndexPath:)]) {
        [_delegate tableView:_subTableView didSelectRowAtIndexPath:indexPath atParentIndexPath:_indexPath];
    } 
}

#pragma mark - Property

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    if (![indexPath isEqual:_indexPath]) {
        _indexPath = indexPath;
    }
}

@end
