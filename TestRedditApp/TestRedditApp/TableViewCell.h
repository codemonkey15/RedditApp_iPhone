//
//  TableViewCell.h
//  TestRedditApp
//
//  Created by snampall on 12/19/14.
//  Copyright (c) 2014 snampall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell


@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UILabel *createdTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
