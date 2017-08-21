//
//  ViewController.m
//  RuntimeDemo
//
//  Created by 李礼光 on 2017/8/16.
//  Copyright © 2017年 LG. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeKit.h"
#import "RuntimeClass.h"
#import "RuntimeClass+MethodSwap.h"
#import "Son.h"

//关于runtime比较好博客
static NSString *runtimeBlog = @"http://www.jianshu.com/p/9d649ce6d0b8";

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *infoTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)className:(id)sender {
    self.infoTF.text = @"";
    self.infoTF.text = [RuntimeKit fetchClassName:[RuntimeClass class]];
}

- (IBAction)iVarList:(id)sender {
    self.infoTF.text = @"";
    NSArray *iVarArr = [RuntimeKit fetchIVarList:[RuntimeClass class]];
    for (NSDictionary *dict in iVarArr) {
        self.infoTF.text = [self.infoTF.text stringByAppendingString:[NSString stringWithFormat:@"%@ : %@\n",dict[@"ivarType"],dict[@"ivarName"]]];
    }
}

- (IBAction)propertyList:(id)sender {
    self.infoTF.text = @"";
    NSArray *propertyArr = [RuntimeKit fetchPropertyList:[RuntimeClass class]];
    for (NSString *propertyName in propertyArr) {
        self.infoTF.text = [self.infoTF.text stringByAppendingString: [NSString stringWithFormat:@"%@\n",propertyName]];
    }
}

- (IBAction)methodList:(id)sender {
    self.infoTF.text = @"";
    NSArray *methodArr = [RuntimeKit fetchPropertyMethodList:[RuntimeClass class]];
    for (NSString *propertyMethod in methodArr) {
        self.infoTF.text = [self.infoTF.text stringByAppendingString: [NSString stringWithFormat:@"%@\n",propertyMethod]];
    }
}




- (IBAction)protocolList:(id)sender {
    self.infoTF.text = @"";
    NSArray *protocolArr = [RuntimeKit fetchProtocolList:[RuntimeClass class]];
    for (NSString *protocolName in protocolArr) {
        self.infoTF.text = [self.infoTF.text stringByAppendingString: [NSString stringWithFormat:@"%@\n",protocolName]];
    }
}

- (IBAction)runObjMethod:(id)sender {
    //这里面调用一个没有在外部声明,但是在内部实现的方法
    //这里的用法有点想KVC,强制性调用隐藏的方法.
    [RuntimeKit runObjMethod:[RuntimeClass class] method:@selector(objMethod)];
    
    
}

- (IBAction)methodSwap:(id)sender {
    [RuntimeClass swap_Method];
}


- (IBAction)addMethod:(id)sender {
    [RuntimeClass add_Method];
    [[RuntimeClass new] Category_Obj_Method];
}


- (IBAction)addProperty:(id)sender {
    
    Son *son = [[Son alloc]init];
    [son question2];
    
}

- (void)addNewMethod_A {
    NSLog(@"addNewMethod_A");
    
}



@end





