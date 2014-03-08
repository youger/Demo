//
//  LYSubCell.h
//  LYNestedTables
//
//  Created by マックノート２ on 13-9-6.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTableViewCell.h"

@interface LYSubCell : LYTableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel     *titleLabel;

@end
