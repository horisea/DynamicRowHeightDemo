//
//  NSArray+Safe.h
//  最简单的动态行高
//
//  Created by 9188 on 16/7/26.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Safe)
- (id)h_safeObjectAtIndex:(NSUInteger)index;
@end
