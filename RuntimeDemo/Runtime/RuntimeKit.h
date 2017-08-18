//
//  RuntimeKit.h
//  RuntimeDemo
//
//  Created by 李礼光 on 2017/8/16.
//  Copyright © 2017年 LG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface RuntimeKit : NSObject
/**
 获取类名

 @param cls 类
 @return 返回类名
 */
+ (NSString *)fetchClassName : (Class)cls;

/**
 获取成员变量

 @param cls 类
 @return 返回成员变量
 */
+ (NSArray *)fetchIVarList : (Class)cls;

/**
 获取类的属性列表

 @param cls 类
 @return 返回类的属性列表
 */
+ (NSArray *)fetchPropertyList : (Class)cls;

/**
 获取属性方法列表：getter, setter, 对象方法等。但不能获取类方法

 @param cls 类
 @return 获取类的对象方法列表
 */
+ (NSArray *)fetchPropertyMethodList : (Class)cls;

/**
 获取协议列表

 @param cls 类
 @return 获取类的协议列表
 */
+ (NSArray *)fetchProtocolList : (Class)cls;


/**
 动态执行一个对象方法 : 不管是内部还是外部

 @param cls 类
 @param method 对应方法
 */
+ (void)runObjMethod: (Class)cls method:(SEL)method ;




/**
 动态添加一个对象方法

 @param class 类
 @param methodSel 方法选择器
 @return 成功返回1,失败返回0
 */
+ (BOOL)addObjMethod:(Class)class methodSEL:(SEL)methodSel;


/**
 交换方法

 @param cls 类
 @param method1 方法1
 @param method2 方法2
 */
+ (void)methodSwap:(Class)cls firstMethod:(SEL)method1 secondMethod:(SEL)method2;




@end
