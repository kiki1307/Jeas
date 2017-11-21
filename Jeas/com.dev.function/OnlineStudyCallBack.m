//
//  ExamAjaxCallBack.m
//  lmsApp
//
//  Created by 邸超 on 2016/12/30.
//  Copyright © 2016年 chaodi. All rights reserved.
//

#import "OnlineStudyCallBack.h"


#import "AFNetworking.h"


@implementation OnlineStudyCallBack

-(instancetype)initWithIsAddCallBack:(Boolean)addCallBack{
    if (self == [super init]) {
        isAddCallBack=addCallBack;
        self.Arr =[NSMutableArray arrayWithCapacity:0];
        
    }
    return self;
}

#pragma mark ---  登录回调
-(void)loginCallback:(NSString *)requestUrl password:(NSString *)psw{


    
    if (@"sa") {
        
        [self.delegate OnlineStudyCallBack:false andErrorMsg:TAGFial andObject:nil];
        
    }
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSURLRequest*request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (data==nil&&isAddCallBack==true) {
            [self.delegate OnlineStudyCallBack:false andErrorMsg:TAGFial andObject:nil];
            return ;
        }
        
        NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString*errorMsg=[dataDic objectForKey:@"errorMsg"];
        if (@"sds") {
            if (isAddCallBack==true) {
                NSDictionary*userDic=[dataDic objectForKey:@"user"];
                
                NSString *FileServer =[dataDic objectForKey:@"FileServer"];
                NSString *userCode =[dataDic objectForKey:@"userCode"];
               
                // 存储数据

                NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
                [df setObject:userDic[@"USERID"] forKey:@"USERID"];
                [df setObject:userCode forKey:@"USERCODE"];
                [df setObject:userDic[@"USERNAME"] forKey:@"USERNAME"];
                [df setObject:userDic[@"USERALIAS"] forKey:@"USERALIAS"];
                [df setObject:userDic[@"STATUS"] forKey:@"STATUS"];
                [df setObject:userDic[@"SEX"] forKey:@"SEX"];
                [df setObject:userDic[@"PHONE"] forKey:@"PHONE"];
                [df setObject:userDic[@"ORGANID"] forKey:@"ORGANID"];
                [df setObject:userDic[@"NATIONAL"] forKey:@"NATIONAL"];
                [df setObject:userDic[@"MOBILE"] forKey:@"MOBILE"];
                [df setObject:userDic[@"JOBNAME"] forKey:@"JOBNAME"];
                [df setObject:FileServer forKey:@"FILESERVER"];
                [df setObject:userDic[@"EXPERIENCE"] forKey:@"EXPERIENCE"];
                [df setObject:userDic[@"EMAIL"] forKey:@"EMAIL"];
                [df setObject:userDic[@"DEPARTMENT"] forKey:@"DEPARTMENT"];
                [df setObject:userDic[@"CARDID"] forKey:@"CARDID"];
                [df setObject:psw forKey:@"PASSWORD"];
                [df synchronize];
                [self.delegate OnlineStudyCallBack:true andErrorMsg:TAGSuccess andObject:nil];
                
            }
        }else{
            
            if (isAddCallBack==true) {
                [self.delegate OnlineStudyCallBack:false andErrorMsg:TAGFial andObject:nil];
            }
        }
    }];

    
    
    
    

}


@end
