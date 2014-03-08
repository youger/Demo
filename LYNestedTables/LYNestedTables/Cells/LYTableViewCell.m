//
//  LYCell.m
//  LYNestedTables
//
//  Created by マックノート２ on 13-9-9.
//  Copyright (c) 2013年 マックノート２. All rights reserved.
//

#import "LYTableViewCell.h"

@implementation LYTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self updateUI];
    
}

-(void)updateUI
{
    [self setClipsToBounds: YES];
    
    _cellView.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = self.titleLabel.frame;
    frame.size.width = self.frame.size.width - frame.origin.x - (int)(self.frame.size.width/30);
    self.titleLabel.frame = frame;

}


@end
