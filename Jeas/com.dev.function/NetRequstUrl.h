//
//  NetRequstUrl.h
//  lmsApp
//
//  Created by 邸超 on 2016/12/31.
//  Copyright © 2016年 chaodi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnlineStudyCallBack.h"
#import "AccountManager.h"

#define TAG @"NetRequstUrl"

@interface NetRequstUrl : NSObject

@property(nonatomic,strong) AccountManager *acc;

+(NetRequstUrl *)shareInstance;



#pragma mark --- 在线学习
//登录请求
-(NSString *)loginWithUserName:(NSString *)username password:(NSString *)psw addCallback:(OnlineStudyCallBack*)callBack;



@end
