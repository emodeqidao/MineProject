//
//  MineCell.h
//  MSeek
//
//  Created by xixi on 2018/10/29.
//  Copyright © 2018年 STBL. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger, BGViewType) {
    NullCorner,
    AllCorner,
    TopCorner,
    BottomCorner,
};

#define MineCell_Height 54.f

NS_ASSUME_NONNULL_BEGIN

@interface MineCell : UITableViewCell

@property (nonatomic, assign) CGFloat titleMaxWidth;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *leftIconImgView;
@property (nonatomic, strong) UILabel *leftTitleLabel;
@property (nonatomic, strong) UIImageView *leftTipsImgView;
@property (nonatomic, strong) UIImageView *rightIconImgView;
@property (nonatomic, strong) UIImageView *rightTipsLabel;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) UILabel *lineLabel;

+(NSString *) cellIdentifier;
-(void) setData:(id)data indexpath:(BGViewType)bgType;


@end

NS_ASSUME_NONNULL_END
