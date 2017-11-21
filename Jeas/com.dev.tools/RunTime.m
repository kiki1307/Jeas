//
//  RunTime.m
//  Jeas
//
//  Created by 邸超 on 2017/3/16.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "RunTime.h"

@interface RunTime()

@end

@implementation RunTime

- (void)checkInstanceProperty{

    unsigned int numIvars; //成员变量个数
    Ivar *vars = class_copyIvarList(NSClassFromString(@"UIView"), &numIvars);
    
    NSString *key=nil;
    for(int i = 0; i < numIvars; i++) {
        
        Ivar thisIvar = vars[i];
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];  //获取成员变量的名字
        NSLog(@"variable name :%@", key);
        key = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)]; //获取成员变量的数据类型
        NSLog(@"variable type :%@", key);
    }
    free(vars);
}

@end
