//
//  NSString+StringSize.h
//  最简单的动态行高
//
//  Created by 9188 on 16/7/22.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringSize)
/**
 *  简单计算textsize
 *
 *  @param width 传入特定的宽度
 *  @param font  字体
 */
- (CGSize)sizeWithLabelWidth:(CGFloat)width font:(UIFont *)font;
@end
