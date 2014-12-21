//
//  TableViewCell.m
//  TestRedditApp
//
//  Created by snampall on 12/19/14.
//  Copyright (c) 2014 snampall. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize titleLabel = _titleLabel;
@synthesize authorLabel = _authorLabel;
@synthesize createdTimeLabel = _createdTimeLabel;
@synthesize scoreLabel = _scoreLabel;
@synthesize thumbnailImageView = _thumbnailImageView;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
