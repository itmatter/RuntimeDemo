//
//  RuntimeCalss+MethodSwap.m
//  RuntimeDemo
//
//  Created by 李礼光 on 2017/8/16.
//  Copyright © 2017年 LG. All rights reserved.
//

#import "RuntimeClass+MethodSwap.h"
#import "RuntimeKit.h"

@implementation RuntimeClass (MethodSwap)
+ (void)swap_Method {

    NSLog(@"---------------交换前---------------");
    [RuntimeKit runObjMethod:[RuntimeClass class] method:@selector(swapMethod_1)];
    [RuntimeKit runObjMethod:[RuntimeClass class] method:@selector(swapMethod_2)];
    
    
    [RuntimeKit methodSwap:[RuntimeClass class]
               firstMethod:@selector(swapMethod_1)
              secondMethod:@selector(swapMethod_2)];
    
    NSLog(@"---------------交换后---------------");
    [RuntimeKit runObjMethod:[RuntimeClass class] method:@selector(swapMethod_1)];
    [RuntimeKit runObjMethod:[RuntimeClass class] method:@selector(swapMethod_2)];

    
    
    //项目中怎么体现 :
    //1.如果当前项目已经开发了一段时间以上了,整体的项目都偏大.
    //2.现在我想要做的是对每次用户点击ViewController的时候,进行统计某些信息(自己按需求定).
    //3.这个时候可以选择,一个一个的ViewController去找,然后去改
    //4.这个时候可以选择,用Runtime去交换方法,做到覆盖全部的ViewController
    //5.一般来说都是会用Runtime去做,简单,方便
    //6.怎么做?
    //7.创建一个方法A,然后在当前方法中调用[super viewDidLoad]或者其他系统方法
    //8.把需要实现的方法内容写在当前方法A中.
    //9.交换方法A和viewDidLoad的方法
    
    //    涉及到的知识
    //    》》使用category，通过Runtime实现用自己的函数调换掉原生函数
    //    》》oc的message forwarding
    //    》》使用Runtime为类添加原来没有的方法
    //    》》为什么category里不重写方法
}


+ (void)add_Method {
    [RuntimeKit addObjMethod:[RuntimeClass class] methodSEL:@selector(Category_Class_Method)];
    [RuntimeKit addObjMethod:[RuntimeClass class] methodSEL:@selector(Category_Obj_Method)];
//
    [RuntimeKit runObjMethod:[RuntimeClass class] method:@selector(Category_Obj_Method)];
    
    
    //    NSLog(@"开始有点迷糊整个设计逻辑.");
    //    NSLog(@"1.首先你得现在当前类中设下一个埋点.也就是创建一个新的函数.");
    //    NSLog(@"2.然后在用runtime去调用这个方法");
    //    NSLog(@"3.那么跟performSelector的用法就是一模一样.");
    //    NSLog(@"4.这样的设计体现在哪里??不晓得.有点吃饱了撑着的感觉");
    //    NSLog(@"5.我以为: 我在ViewController中调用runtime的动态添加方法,是不需要操作RuntimeClass的");
    //    NSLog(@"6.但是这样的话就不叫做动态添加方法,应该还是叫执行对象方法");
    //    NSLog(@"7.如果是考虑到在Category中去调换原生函数,那么考虑点我们缩小为,只针对于原生函数");
    //    NSLog(@"8.很多时候我们可以自定义自己的功能,为什么一定要去更换原生的功能呢?又或者在写一个功能在原生功能上扩展有什么区别呢");
    
    //    涉及到的知识
    //    》》使用category，通过Runtime实现用自己的函数调换掉原生函数
    //    》》oc的message forwarding
    //    》》使用Runtime为类添加原来没有的方法
    //    》》为什么category里不重写方法

}



+ (void)Category_Class_Method {
    NSLog(@"Category_Class_Method");
}
- (void)Category_Obj_Method {
    NSLog(@"Category_Obj_Method");
}



@end
