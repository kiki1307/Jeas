//
//  Tools.h
//  Jeas
//
//  Created by 邸超 on 2017/3/13.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface Tools : NSObject

+ (Tools *)shareInstance;

#pragma mark --- 编辑字符串
// 其他一些方法
- (void)stringEditMethod;

//字符串是否为空
+ (BOOL)IsEmpty:(NSString*)objString;

// 转成字符串
+ (NSString *)transformToString:(id)object;

// 拼接字符串
+ (NSString *)mergeStringWithArr:(NSArray *)arr;

#pragma mark --- 判断消息提示
+ (void)showToast :(UIView*)view :(NSString*)title : (long)delayTime;

#pragma mark --- 判断网络连接是否可用
+ (BOOL) isConnectionAvailable;

+ (void)checkNetConnectStatus;

@end
