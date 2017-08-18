//
//  RuntimeKit.m
//  RuntimeDemo
//
//  Created by 李礼光 on 2017/8/16.
//  Copyright © 2017年 LG. All rights reserved.
//

#import "RuntimeKit.h"

@implementation RuntimeKit

//1.获取类名
+ (NSString *)fetchClassName : (Class)cls {
    const char *className = class_getName(cls);
    return [NSString stringWithUTF8String:className];
}

//2.获取成员变量
+ (NSArray *)fetchIVarList : (Class)cls {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(cls, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ ) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"ivarType"] = [NSString stringWithUTF8String: ivarType];
        dic[@"ivarName"] = [NSString stringWithUTF8String: ivarName];
        
        [mutableList addObject:dic];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mutableList];

}

//3.获取类的属性列表
+ (NSArray *)fetchPropertyList : (Class)cls {
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ ) {
        const char *propertyName = property_getName(propertyList[i]);
        [mutableList addObject:[NSString stringWithUTF8String: propertyName]];
    }
    free(propertyList);
    return [NSArray arrayWithArray:mutableList];
}

//4.获取对象方法列表
+ (NSArray *)fetchPropertyMethodList : (Class)cls {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(cls, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ ) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableList];

}

//5.获取协议列表
+ (NSArray *)fetchProtocolList : (Class)cls {
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(cls, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ ) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutableList addObject:[NSString stringWithUTF8String: protocolName]];
    }
    
    return [NSArray arrayWithArray:mutableList];
    return nil;
}

//6.动态执行对象方法
+ (void)runObjMethod: (Class)cls method:(SEL)method {

    if (method == nil)
        return;
    @try {
        [[cls new] performSelector:method];
    }
    @catch (NSException *exception) {
        NSLog(@"找不到方法,只能执行对象方法");
        NSLog(@"%s\n%@", __FUNCTION__, exception);
    }
    @finally {
    }
};

/**
 往类上添加新的方法与其实现
 
 @param class 相应的类
 @param methodSel 方法的名
 @param methodSelImpl 对应方法实现的方法名
 */
+ (BOOL)addObjMethod:(Class)class methodSEL:(SEL)methodSel{
    Method method = class_getInstanceMethod(class, methodSel);      //返回给定类的指定实例方法。
    IMP methodIMP = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    return class_addMethod(class, methodSel, (IMP)methodIMP, types);
}

//7.方法交换
+ (void)methodSwap:(Class)cls firstMethod:(SEL)method1 secondMethod:(SEL)method2 {
    Method firstMethod = class_getInstanceMethod(cls, method1);
    Method secondMethod = class_getInstanceMethod(cls, method2);
    method_exchangeImplementations(firstMethod, secondMethod);
}


@end
