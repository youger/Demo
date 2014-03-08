//
//  LYTableViewCell.h
//  LYNestedTables
//
//  Created by マックノート２ on 13-9-9.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import <UIKit/UIKit.h>
#define AccessoryView_Width  40;

@interface LYTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *cellView;

- (void)updateUI;

@end
