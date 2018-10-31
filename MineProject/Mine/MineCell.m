//
//  MineCell.m
//  MSeek
//
//  Created by xixi on 2018/10/29.
//  Copyright © 2018年 STBL. All rights reserved.
//

#import "MineCell.h"
#import "XBaseModel.h"


@implementation MineCell

+(NSString *) cellIdentifier
{
    return @"MineCell_cell_id";
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor grayColor];
        
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, kScreen_Width - 40.f, 54.f)];
        [self.contentView addSubview:self.bgView];
        [self.bgView.layer addSublayer:self.shapeLayer];

        
        self.leftIconImgView = [[UIImageView alloc] init];
        self.leftIconImgView.frame = CGRectMake(10.f, (MineCell_Height - 34.f) / 2.f, 34.f, 34.f);
        [self.bgView addSubview:self.leftIconImgView];
        
        self.rightIconImgView = [[UIImageView alloc] init];
        self.rightIconImgView.frame = CGRectMake(WIDTH(self.bgView) - 10 - 9, (MineCell_Height - 15.f) / 2.f, 9.f, 15.f);
        [self.bgView addSubview:self.rightIconImgView];
        
        self.titleMaxWidth = MinX(self.rightIconImgView) - MaxX(self.leftIconImgView) - 20.f;
        
        self.leftTitleLabel = [[UILabel alloc] init];
        self.leftTitleLabel.frame = CGRectMake(MaxX(self.leftIconImgView) + 10.f, 0, self.titleMaxWidth, MineCell_Height);
        self.leftTitleLabel.font = SYSTEMFONT(17.f);
        self.leftTitleLabel.textColor = [UIColor blackColor];
//        self.leftTitleLabel.backgroundColor = [UIColor purpleColor];
        [self.bgView addSubview:self.leftTitleLabel];
        
        self.leftTipsImgView = [[UIImageView alloc] init];
        self.leftTipsImgView.frame = CGRectMake(0, (MineCell_Height - 20) / 2.f, 30.f, 20.f);
        self.leftTipsImgView.hidden = YES;
        [self.bgView addSubview:self.leftTipsImgView];
        
        [self.bgView addSubview:self.lineLabel];
    }
    
    return self;
}

-(void) setData:(id)data indexpath:(BGViewType)bgType
{
    XBaseModel *model = data;
    self.leftIconImgView.image = [UIImage imageNamed:model.leftIconStr];
    self.leftTitleLabel.text = model.leftTitleStr?:@"";
    self.rightIconImgView.image = [UIImage imageNamed:@"MS_Common_arr"];
    
    [self resetPath:bgType];
}

#pragma mark

-(UILabel *)lineLabel
{
    if (!_lineLabel)
    {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.frame = CGRectMake(10.f, HEIGHT(self.bgView) - 1, WIDTH(self.bgView) - 20.f, 1);
        _lineLabel.backgroundColor = [UIColor brownColor];
        _lineLabel.hidden = YES;
    }
    return _lineLabel;
}

-(CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer)
    {
        CGRect rect = CGRectMake(0, 0, WIDTH(self.bgView), HEIGHT(self.bgView));
        CGSize radii = CGSizeMake(0, 0);
        //    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
        UIRectCorner corners = UIRectCornerBottomLeft | UIRectCornerBottomRight ;
        
        //create path
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
        
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
        _shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        _shapeLayer.lineWidth = 1;
        //线条之间
        _shapeLayer.lineJoin = kCALineJoinRound;
        //线条结尾
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.path = path.CGPath;
    }
    return _shapeLayer;
}

-(void) resetPath:(BGViewType)type
{
    UIRectCorner corners;
    CGSize radii;
    UIBezierPath *path;
    if (type == NullCorner)
    {
        corners = 0;
        radii = CGSizeMake(0, 0);
        self.lineLabel.hidden = NO;
    }
    else if (type == TopCorner)
    {
        corners = UIRectCornerTopLeft | UIRectCornerTopRight;
        radii = CGSizeMake(10, 10);
        self.lineLabel.hidden = NO;
    }
    else if (type == BottomCorner)
    {
        corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        radii = CGSizeMake(10, 10);
        self.lineLabel.hidden = YES;
    }
    else //allcorner
    {
        corners = UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerTopLeft | UIRectCornerTopRight;
        radii = CGSizeMake(10, 10);
        self.lineLabel.hidden = YES;
    }
    
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, WIDTH(self.bgView), HEIGHT(self.bgView)) byRoundingCorners:corners cornerRadii:radii];
    self.shapeLayer.path = path.CGPath;
    [self.bgView setNeedsDisplay];
}

//add it to our view
//[self.view.layer addSublayer:shapeLayer];



#pragma mark
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
