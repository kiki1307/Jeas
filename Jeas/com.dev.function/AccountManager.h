//
//  AccountManager.h
//  lmsApp
//
//  Created by 邸超 on 2016/12/19.
//  Copyright © 2016年 chaodi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountManager : NSObject

@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *userCode;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *userAlias;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *sex;
@property(nonatomic,copy)NSString *picture;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *organId;
@property(nonatomic,copy)NSString *national;
@property(nonatomic,copy)NSString *mobile;
@property(nonatomic,copy)NSString *jobName;
@property(nonatomic,copy)NSString *fileServer;
@property(nonatomic,copy)NSString *experience;
@property(nonatomic,copy)NSString *email;
@property(nonatomic,copy)NSString *department;
@property(nonatomic,copy)NSString *cardId;
@property(nonatomic,copy)NSString *born;
@property(nonatomic,copy)NSString *age;




+ (id)sharedInstance;

- (void)outLoading;
@end
