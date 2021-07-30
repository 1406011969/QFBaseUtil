
//
//  UIColor+Common.m
//  SPSpecialPlatform
//
//  Created by CQF cqf on 2018/11/7.
//  Copyright © 2018年 CQF. All rights reserved.
//

#import "UIColor+Common.h"

@implementation UIColor (Common)

/// 测试修改

/// 主题颜色
+ (UIColor *)themeColor {
    return [self colorWithCSS:@"#394DCF"];
}

/// 背景颜色 - (f5)
+ (UIColor *)backgroundColor {
    return [self colorWithCSS:@"#F5F6FA"];
}

/// 字体颜色 - 黑(33)
+ (UIColor *)textBlackColor {
    return [self colorWithCSS:@"#333333"];
}

/// 字体颜色 - 淡黑(66)
+ (UIColor *)textLightBlackColor {
    return [self colorWithCSS:@"#666666"];
}

/// 字体颜色 - 灰(99)
+ (UIColor *)textGrayColor {
    return [self colorWithCSS:@"#999999"];
}

/// 字体颜色 - 淡灰(cc)
+ (UIColor *)textLightGrayColor {
    return [self colorWithCSS:@"#cccccc"];
}

/// 线条颜色 - e2
+ (UIColor *)lineColor {
    return [self colorWithCSS:@"#e2e2e2"];
}

/// 阴影颜色
+ (UIColor *)shadowColor {
    return [self colorWithCSS:@"#E2E9FD"];
}

/// 随机色 用来调试
+ (UIColor *)randomColor {
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}


@end

/// FIXME: - color with hex string
@implementation UIColor (HexString)

+ (UIColor*)colorWithCSS:(NSString*)css {
    if (css.length == 0)
        return [UIColor blackColor];
    
    if ([css characterAtIndex:0] == '#')
        css = [css substringFromIndex:1];
    
    NSString *a, *r, *g, *b;
    
    NSUInteger len = css.length;
    if (len == 6) {
    six:
        a = @"FF";
        r = [css substringWithRange:NSMakeRange(0, 2)];
        g = [css substringWithRange:NSMakeRange(2, 2)];
        b = [css substringWithRange:NSMakeRange(4, 2)];
    }
    else if (len == 8) {
    eight:
        a = [css substringWithRange:NSMakeRange(0, 2)];
        r = [css substringWithRange:NSMakeRange(2, 2)];
        g = [css substringWithRange:NSMakeRange(4, 2)];
        b = [css substringWithRange:NSMakeRange(6, 2)];
    }
    else if (len == 3) {
    three:
        a = @"FF";
        r = [css substringWithRange:NSMakeRange(0, 1)];
        r = [r stringByAppendingString:a];
        g = [css substringWithRange:NSMakeRange(1, 1)];
        g = [g stringByAppendingString:a];
        b = [css substringWithRange:NSMakeRange(2, 1)];
        b = [b stringByAppendingString:a];
    }
    else if (len == 4) {
        a = [css substringWithRange:NSMakeRange(0, 1)];
        a = [a stringByAppendingString:a];
        r = [css substringWithRange:NSMakeRange(1, 1)];
        r = [r stringByAppendingString:a];
        g = [css substringWithRange:NSMakeRange(2, 1)];
        g = [g stringByAppendingString:a];
        b = [css substringWithRange:NSMakeRange(3, 1)];
        b = [b stringByAppendingString:a];
    }
    else if (len == 5 || len == 7) {
        css = [@"0" stringByAppendingString:css];
        if (len == 5) goto six;
        goto eight;
    }
    else if (len < 3) {
        css = [self stringByPaddingTheLeftToLength:3 withString:@"0" startingAtIndex:0 css:css];
        goto three;
    }
    else if (len > 8) {
        css = [css substringFromIndex:len-8];
        goto eight;
    }
    else {
        a = @"FF";
        r = @"00";
        g = @"00";
        b = @"00";
    }
    
    // parse each component separately. This gives more accurate results than
    // throwing it all together in one string and use scanf on the global string.
    a = [@"0x" stringByAppendingString:a];
    r = [@"0x" stringByAppendingString:r];
    g = [@"0x" stringByAppendingString:g];
    b = [@"0x" stringByAppendingString:b];
    
    uint av, rv, gv, bv;
    sscanf([a cStringUsingEncoding:NSASCIIStringEncoding], "%x", &av);
    sscanf([r cStringUsingEncoding:NSASCIIStringEncoding], "%x", &rv);
    sscanf([g cStringUsingEncoding:NSASCIIStringEncoding], "%x", &gv);
    sscanf([b cStringUsingEncoding:NSASCIIStringEncoding], "%x", &bv);
    
    return [UIColor colorWithRed: rv / 255.f
                           green: gv / 255.f
                            blue: bv / 255.f
                           alpha: av / 255.f];
}

+ (UIColor*) colorWithHex: (NSUInteger)hex {
    CGFloat red, green, blue, alpha;
    
    red = ((CGFloat)((hex >> 16) & 0xFF)) / ((CGFloat)0xFF);
    green = ((CGFloat)((hex >> 8) & 0xFF)) / ((CGFloat)0xFF);
    blue = ((CGFloat)((hex >> 0) & 0xFF)) / ((CGFloat)0xFF);
    alpha = hex > 0xFFFFFF ? ((CGFloat)((hex >> 24) & 0xFF)) / ((CGFloat)0xFF) : 1;
    
    return [UIColor colorWithRed: red green:green blue:blue alpha:alpha];
}

+ (NSString *)stringByPaddingTheLeftToLength:(NSUInteger)newLength withString:(NSString *)padString startingAtIndex:(NSUInteger)padIndex css:(NSString *)css {
    if ([css length] <= newLength) {
        return [[@"" stringByPaddingToLength:newLength - [css length] withString:padString startingAtIndex:padIndex] stringByAppendingString:css];
    } else {
        return [css copy];
    }
}

@end

