//
//  MineHeaderView.m
//  MSeek
//
//  Created by xixi on 2018/10/29.
//  Copyright © 2018年 STBL. All rights reserved.
//

#import "MineHeaderView.h"
#import "UIView+Frame.h"

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //
        UIImage *img = [UIImage imageNamed:@"ms_mine_bg"];
        UIImageView *bgView = [[UIImageView alloc] init];
        bgView.image = img;
        bgView.width = img.size.width;
        bgView.height = img.size.height;
        bgView.top = 0;
        bgView.left = CGRectGetWidth(self.frame) - CGRectGetWidth(bgView.frame);
        
        [self addSubview:bgView];
    }
    return self;
}

@end
