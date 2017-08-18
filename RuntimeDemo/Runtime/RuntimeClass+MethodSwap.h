//
//  RuntimeCalss+MethodSwap.h
//  RuntimeDemo
//
//  Created by 李礼光 on 2017/8/16.
//  Copyright © 2017年 LG. All rights reserved.
//

#import "RuntimeClass.h"

@interface RuntimeClass (MethodSwap)

+ (void)swap_Method;
+ (void)add_Method;

+ (void)Category_Class_Method;
- (void)Category_Obj_Method;

@end
