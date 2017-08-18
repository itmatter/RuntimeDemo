//
//  RuntimeCalss.h
//  RuntimeDemo
//
//  Created by 李礼光 on 2017/8/16.
//  Copyright © 2017年 LG. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RuntimeClassDelegate <NSObject>

@required
- (void)protocol_Required_Method;
@optional
- (void)protocol_Optional_Method;
@end


@interface RuntimeClass : NSObject<NSCopying,NSCoding>

@property (nonatomic, strong) NSString *str_Strong;
@property (nonatomic, weak)  NSString *str_weak;
@property (nonatomic, assign) NSInteger integer;

+ (void)classMethod;
- (void)objMethod;

- (void)swapMethod_1;
- (void)swapMethod_2;


@end
