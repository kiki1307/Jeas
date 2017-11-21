//
//  AccountManager.m
//  lmsApp
//
//  Created by 邸超 on 2016/12/19.
//  Copyright © 2016年 chaodi. All rights reserved.
//

#import "AccountManager.h"



@implementation AccountManager

+ (id)sharedInstance{
    
    static AccountManager *accountManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        accountManager = [[AccountManager alloc] init];
    });
    
    [accountManager obtainDataFromSandBox];
    return accountManager;
}

- (void)obtainDataFromSandBox{

    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    self.userId =[NSString stringWithFormat:@"%@",[df objectForKey:@"USERID"]];
    self.userCode =[NSString stringWithFormat:@"%@",[df objectForKey:@"USERCODE"]];
    self.userName = [df objectForKey:@"USERNAME"];
    self.userAlias = [df objectForKey:@"USERTRALIST"];
    self.status =[NSString stringWithFormat:@"%@",[df objectForKey:@"STATUS"]];
    self.sex = [df objectForKey:@"SEX"];
    self.picture = [df objectForKey:@"PICTURE"];
    self.phone =[NSString stringWithFormat:@"%@",[df objectForKey:@"PHONE"]];
    self.organId =[NSString stringWithFormat:@"%@",[df objectForKey:@"ORGANID"]];
    self.national = [df objectForKey:@"NATIONAL"];
    self.mobile = [df objectForKey:@"MOBILE"];
    self.jobName = [df objectForKey:@"JOBNAME"];
    self.fileServer = [df objectForKey:@"FILESERVER"];
    self.experience = [df objectForKey:@"EXPERIENCE"];
    self.email = [df objectForKey:@"EMAIL"];
    self.department = [df objectForKey:@"DEPARTMENT"];
    self.cardId =[NSString stringWithFormat:@"%@",[df objectForKey:@"CARDID"]];
    self.born = [df objectForKey:@"BORN"];
    self.age =[NSString stringWithFormat:@"%@",[df objectForKey:@"AGE"]];
    
}

//退出登录删除缓存信息
- (void)outLoading{

 
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic =[df dictionaryRepresentation];
    for (NSString *keys in dic) {
        [df removeObjectForKey:keys];
    }
    [df synchronize];

}



@end
