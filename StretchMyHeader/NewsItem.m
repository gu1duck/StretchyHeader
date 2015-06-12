//
//  NewsItem.m
//  StretchMyHeader
//
//  Created by Jeremy Petter on 2015-06-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem

+(instancetype) newsItemWithCategory:(NewsItemCategory)category andSubtitle:(NSString*)subtitle{
    NewsItem* newsItem = [[NewsItem alloc] init];
    newsItem.category = category;
    newsItem.subtitle = subtitle;
    
    return newsItem;
}

+(NSString*)newsItemTitleWithCategory: (NewsItemCategory) category{
    
    switch (category) {
        case world:
            return @"World";
            break;
        case americas:
            return @"Americas";
            break;
        case europe:
            return @"Europe";
            break;
        case middleEast:
            return @"Middle East";
            break;
        case africa:
            return @"Africa";
            break;
        case asiaPacific:
            return @"Asia Pacific";
            break;
        default:
            return @"";
            break;
    }
}

+(UIColor*)newsItemColorWithCategory: (NewsItemCategory) category{
    
    switch (category) {
        case world:
            return [UIColor purpleColor];
            break;
        case americas:
            return [UIColor blueColor];
            break;
        case europe:
            return [UIColor redColor];
            break;
        case middleEast:
            return [UIColor greenColor];
            break;
        case africa:
            return [UIColor yellowColor];
            break;
        case asiaPacific:
            return [UIColor orangeColor];
            break;
        default:
            return [UIColor blackColor];
            break;
    }
}



@end
