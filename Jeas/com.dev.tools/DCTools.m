//
//  DCTools.m
//  BaseFoundation
//
//  Created by 邸超 on 16/10/18.
//  Copyright © 2016年 chaodi. All rights reserved.
//

#import "DCTools.h"

DCTools *tools;

@interface DCTools()
@end

@implementation DCTools

+ (instancetype)sharedInstance{
    if (tools == nil) {
        tools = [[DCTools alloc] init];
    }
    return tools;
}

- (void)doSomeThings{

    NSLog(@"------------------------------------------------------");
}

//---将带符号的字符串 拆分下
- (void)transferStringStyle:(NSString *)string{

    NSString *newString = [[NSString alloc] init];
    
    NSArray *allArr = [string componentsSeparatedByString:@">"];
    
    for (NSString *singleSting in allArr) {
        
        NSArray *singleArr = [singleSting componentsSeparatedByString:@"<"];
        
        if([singleArr[0] isEqualToString:@""]){
        
        }else{
        
            NSLog(@"===%@",singleArr[0]);
            newString = [newString stringByAppendingString:singleArr[0]];
        }
    }
    
    NSLog(@"----=%@",newString);
}

// ---获取当前时间
- (NSString *)acquireCurrentDate{

    NSDate *myDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: myDate];
    
    NSDate *localeDate = [myDate  dateByAddingTimeInterval: interval];
    NSString *currentTimeStr = [NSString stringWithFormat:@"%@",localeDate];
    NSString *str1 = [currentTimeStr substringFromIndex:0];
    NSString *currentTime = [str1 substringToIndex:19];
    
    return currentTime;
}



// --- 实现文件下载
- (void)downLoad{

    //- (void)syncDownload{
    //
    //    NSString *path = @"http://lx.cdn.baidupcs.com/file/test.mp4"; //下载文件地址
    //    NSURL *url = [NSURL URLWithString:path];
    //    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    //    NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    //    [self save:data];
    //}
    //
    //- (void)save:(NSData *)data{
    //
    //    NSString *temp = NSTemporaryDirectory();
    //
    //    NSFileManager *fm = [NSFileManager defaultManager];
    //
    //    _path = [temp stringByAppendingPathComponent:@"test.mp4"];
    //
    //    BOOL b = [fm createFileAtPath:_path contents:_data attributes:nil];
    //}
    //
    ////异步下载
    //
    //- (void)asyncDownload{
    //
    //    NSString *path = @"http://lx.cdn.baidupcs.com/file/test.mp4"; //下载文件地址
    //
    //    NSURL *url = [NSURL URLWithString:path];
    //    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    //
    //    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
    //}
    //
    ////实现异步下载代理
    //- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    //    NSLog(@"error");
    //}
    //- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //    NSLog(@"response");
    //    recLenth = 0;//初始化接收到的长度
    //    _data = [[NSMutableData alloc] initWithCapacity:0];
    //    lenth = [response expectedContentLength];//获取下载内容总长度
    //}
    //- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //    [_data appendData:data];//接收到数据
    //    recLenth += [data length];
    //    float pro = (float)recLenth/(float)lenth;//计算下载进度0-1
    //}
    //- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //    NSLog(@"finish");
    //    [self save:_data];
    //    
    //}
    

}

// ---关于FMDB的操作
- (void)aboutFMDBOperations{
    
    //---fmdb 数据库管理类
    //---FMDataBase
    //---FMResultSet
    //---FMDataBaseQueue 用于多线程安全
    
    //---FMDB 的使用 除了 '查询',全部是 '更新'
    
    //---更新的方法-----
    
    //    使用executeUpdate:方法执行更新
    //    - (BOOL)executeUpdate:(NSString*)sql, ...
    //    - (BOOL)executeUpdateWithFormat:(NSString*)format, ...
    //    - (BOOL)executeUpdate:(NSString*)sql withArgumentsInArray:(NSArray *)arguments
    
    
    //---查询的方法-----
    
    //    - (FMResultSet *)executeQuery:(NSString*)sql, ...
    //    - (FMResultSet *)executeQueryWithFormat:(NSString*)format, ...
    //    - (FMResultSet *)executeQuery:(NSString *)sql withArgumentsInArray:(NSArray *)arguments
    
    
}

// 开启动画方法
-(void)startAnimationWithNavController:(UINavigationController *)nav{
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    transition.duration = 0.2f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    transition.delegate = self;
    
    
    [nav.view.layer addAnimation:transition forKey:nil];
}


@end
