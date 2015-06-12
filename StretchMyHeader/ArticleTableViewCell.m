//
//  ArticleTableViewCell.m
//  StretchMyHeader
//
//  Created by Jeremy Petter on 2015-06-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "ArticleTableViewCell.h"

@implementation ArticleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) setupWithNewsItem:(NewsItem*)newsItem{
    self.titleLabel.text = [NewsItem newsItemTitleWithCategory:newsItem.category];
    self.titleLabel.textColor = [NewsItem newsItemColorWithCategory:newsItem.category];
    self.headlineLabel.text = newsItem.subtitle;
    
}


@end
