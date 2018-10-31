//
//  XFindListModel.h
//  ThinkSNS（探索版）
//
//  Created by xixi on 2017/6/2.
//  Copyright © 2017年 STBL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBaseModel : NSObject

@property (nonatomic, strong) NSString *key;  //唯一标示，方便判断，而不是用title 来做判断
@property (nonatomic, strong) NSString *leftIconStr;  //icon 名字
@property (nonatomic, strong) NSString *leftTitleStr; //title
@property (nonatomic, strong) NSString *arrowIconStr; //arrow 名字
@property (nonatomic, strong) NSString *rightTitleStr; //右边的文字内容
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) BOOL defaultType;
@end
