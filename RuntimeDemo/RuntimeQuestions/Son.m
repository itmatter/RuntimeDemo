
//
//  Son.m
//  RuntimeDemo
//
//  Created by 李礼光 on 2017/8/21.
//  Copyright © 2017年 LG. All rights reserved.
//

#import "Son.h"

@implementation Son

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%@",NSStringFromClass([self class]));
        NSLog(@"%@",NSStringFromClass([super class]));
        //上面的代码输出什么?
        //两个打印都为son
        //为什么?
    }
    return self;
}

- (void)question2 {
    
    
    //isKindOfClass : 返回一个布尔值，它指示接收方是给定类的实例还是从该类继承的任何类的实例。
    //isMemberOfClass : 返回一个布尔值，指示接收者是否为给定类的实例。
    
    
    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    
    BOOL res3 = [(id)[Son class] isKindOfClass:[Son class]];
    BOOL res4 = [(id)[Son class] isMemberOfClass:[Son class]];

    NSLog(@"res1 : %d",res1);       //1
    NSLog(@"res2 : %d",res2);       //0
    NSLog(@"res3 : %d",res3);       //0
    NSLog(@"res4 : %d",res4);       //0


    NSLog(@"NSObject : %@",[NSObject class]);
    NSLog(@"Son : %@",[Son class]);
    NSLog(@"self : %@",self);
    


}
@end

