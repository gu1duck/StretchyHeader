//
//  NewsItem.h
//  StretchMyHeader
//
//  Created by Jeremy Petter on 2015-06-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef enum NewsItemCategory{
    world, americas, europe, middleEast, africa, asiaPacific
} NewsItemCategory;

@interface NewsItem : NSObject

@property (nonatomic) NewsItemCategory category;
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* subtitle;

+(instancetype) newsItemWithCategory:(NewsItemCategory)category andSubtitle:(NSString*)subtitle;
+(UIColor*)newsItemColorWithCategory: (NewsItemCategory) category;
+(NSString*)newsItemTitleWithCategory: (NewsItemCategory) category;

@end
