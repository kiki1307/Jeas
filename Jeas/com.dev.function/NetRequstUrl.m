//
//  NetRequstUrl.m
//  lmsApp
//
//  Created by 邸超 on 2016/12/31.
//  Copyright © 2016年 chaodi. All rights reserved.
//

#import "NetRequstUrl.h"

#import "UrlFactory.h"

@implementation NetRequstUrl

+(NetRequstUrl *)shareInstance{
    
    static NetRequstUrl *netRequestUrl =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netRequestUrl = [[NetRequstUrl alloc] init];
    });


    return netRequestUrl;
}


- (AccountManager *)acc{

    if (_acc == nil) {
        _acc = [AccountManager sharedInstance];
    }
    
    return _acc;
}

#pragma mark ---  登录
- (NSString *)loginWithUserName:(NSString *)username password:(NSString *)psw addCallback:(OnlineStudyCallBack*)callBack{

    NSString *action = @"LoginAuth.action";
    NSArray *args=[[NSArray alloc]initWithObjects:@"&username",username,@"&userpwd", psw,@"&receiver_value",@"ss",@"&operatesys",@"移动端",@"&browser",@"IOS",nil];

    NSString *requestUrl = [[UrlFactory shareInstance] getWithRootUrlAction:action andArgs:args];
   
    [callBack loginCallback:requestUrl password:psw];
    
    NSLog(@"--%@---%@-----%@",TAG,action,requestUrl);
    return requestUrl;



}





@end
