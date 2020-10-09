//
//  UIColor+Common.h
//  SPSpecialPlatform
//
//  Created by CQF cqf on 2018/11/7.
//  Copyright © 2018年 CQF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Common)

/// 主题颜色
+ (UIColor *)themeColor;

/// 背景颜色
+ (UIColor *)backgroundColor;

/// 字体颜色 - 黑(33)
+ (UIColor *)textBlackColor;

/// 字体颜色 - 淡黑(66)
+ (UIColor *)textLightBlackColor;

/// 字体颜色 - 灰(99)
+ (UIColor *)textGrayColor;

/// 字体颜色 - 淡灰(cc)
+ (UIColor *)textLightGrayColor;

/// 线条颜色
+ (UIColor *)lineColor;

/// 阴影颜色
+ (UIColor *)shadowColor;

///随机色 用来调试
+ (UIColor *)randomColor;


@end

/// FIXME: - color with hex string
@interface UIColor (HexString)

+ (UIColor*) colorWithCSS: (NSString*) css;
+ (UIColor*) colorWithHex: (NSUInteger) hex;

@end
