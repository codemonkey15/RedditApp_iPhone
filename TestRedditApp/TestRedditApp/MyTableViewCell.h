//
//  MyTableViewCell.h
//  TestRedditApp
//
//  Created by snampall on 12/19/14.
//  Copyright (c) 2014 snampall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;


@property (weak, nonatomic) NSString *titleVal;
@property (weak, nonatomic) NSString *authorVal;
@property (weak, nonatomic) NSString *dateVal;
@property (weak, nonatomic) NSString *scoreVal;
@property (weak, nonatomic) NSString *thumbnailVal;


@end
