//
//  ArticleTableViewCell.h
//  StretchMyHeader
//
//  Created by Jeremy Petter on 2015-06-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"


@interface ArticleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *headlineLabel;

- (void) setupWithNewsItem:(NewsItem*)NewsItem;

@end
