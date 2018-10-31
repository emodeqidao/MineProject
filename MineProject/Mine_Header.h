//
//  Mine_Header.h
//  MineProject
//
//  Created by xixi on 2018/10/31.
//  Copyright © 2018年 xixi. All rights reserved.
//

#ifndef Mine_Header_h
#define Mine_Header_h

#define kScreen_Width ([[UIScreen mainScreen] bounds].size.width)   //全屏宽度
#define kScreen_Height ([[UIScreen mainScreen] bounds].size.height) //全屏高度

#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]

#endif /* Mine_Header_h */
