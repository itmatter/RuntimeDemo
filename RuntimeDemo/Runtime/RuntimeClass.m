//
//  RuntimeCalss.m
//  RuntimeDemo
//
//  Created by 李礼光 on 2017/8/16.
//  Copyright © 2017年 LG. All rights reserved.
//

#import "RuntimeClass.h"
#import <objc/message.h>
#import "RuntimeKit.h"

//添加一个新方法 :
void addNewMethod (id self, SEL _cmd){
    NSLog(@"add New Method");
}

@implementation RuntimeClass {
    NSString *imp_str1;
    NSString *imp_str2;
}

+ (void)classMethod {
    NSLog(@"classMethod");
}

- (void)objMethod{
    NSLog(@"objMethod");
}


- (void)swapMethod_1{
    NSLog(@"swapMethod_1");
}
- (void)swapMethod_2{
    NSLog(@"swapMethod_2");
}









@end
