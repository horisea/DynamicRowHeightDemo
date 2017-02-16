//
//  NSArray+Safe.m
//  最简单的动态行高
//
//  Created by 9188 on 16/7/26.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)
- (id)h_safeObjectAtIndex:(NSUInteger)index{
    if(self.count == 0) {
        NSLog(@"--- mutableArray have no objects ---");
        return (nil);
    }
    if(index > MAX(self.count - 1, 0)) {
        NSLog(@"--- index:%li out of mutableArray range ---", (long)index);
        return (nil);
    }
    return ([self objectAtIndex:index]);
}

@end
