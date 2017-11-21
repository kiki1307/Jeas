//
//  UrlFactory.m
//  OnLineStudy
//
//  Created by 徐文涛 on 15/4/22.
//  Copyright (c) 2015年 李源友. All rights reserved.
//

#import "UrlFactory.h"
//#import "DES3Util.h"


@implementation UrlFactory

+ (UrlFactory *)shareInstance{
    
    static UrlFactory *factory = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        factory = [[UrlFactory alloc] init];
    });
    return factory;
}


// 字典
-(NSString*)AppendJsonUrlMethod:(NSString*)action parameters:(NSDictionary*)parameters{
    
    NSMutableString *urlString =[NSMutableString string];
    [urlString appendString:[ROOTURL stringByAppendingString:@"/"]];
    [urlString appendString:[action stringByAppendingString:@"?"]];
    
    
    NSString*argvalue=@"";
    NSMutableString*dic=[[NSMutableString alloc] initWithCapacity:0];
    
    for(NSString*obj in parameters){
        NSString*values=obj;
        NSString*key=[parameters valueForKey:values ];
        [argvalue stringByAppendingString:key];
        [dic appendString:[[key stringByAppendingString:@"="] stringByAppendingString:values]];
    }
    
    [urlString appendString:dic];
    [urlString appendString:[self getMessageFormat]];
    return urlString;
}



-(NSString*)getMessageFormat{
    
    NSString *result = @"";
    result=[result stringByAppendingString:[NSString stringWithFormat:@"&messageFormat=json&v=1.0"]];
    return result;
}


// 数组
-(NSString*)getWithRootUrlAction:(NSString*)action andArgs:(NSArray*)args{

    
    NSString *urlString = ROOTURL;
    urlString = [urlString stringByAppendingFormat:@"/%@%@",action,@"?"];
    
    if (args == nil || args.count <= 0) {
        return urlString;
    }
    
    NSString *code = @"code=";
    NSString *result2 = @"";
    int tempcount = (int)args.count>>1;
    
    for (int i=0; i<tempcount; i++) {// 成对遍历数组
        
        NSString*argvalue = @"";
        if (i < tempcount - 1) {
            
            argvalue=[NSString stringWithCString:[[self isStringWith:args[i * 2 + 1]] UTF8String] encoding:NSUTF8StringEncoding];
            
            result2= [result2 stringByAppendingFormat:@"%@%@%@%@",@"&",[self isStringWith:args[i * 2]],@"=",argvalue];
        }else{
            
            
            result2=[result2 stringByAppendingFormat:@"%@",[self getMessageFormat]];
            argvalue=[NSString stringWithCString:[[self isStringWith:args[i * 2 + 1]] UTF8String] encoding:NSUTF8StringEncoding];
            result2= [result2 stringByAppendingFormat:@"%@%@%@%@",@"&",[self isStringWith:args[i * 2]],@"=",argvalue];
        }
    }
    
    //result2=(NSMutableString *)[DES3Util encrypt:result2] ;
    code = [code stringByAppendingFormat:@"%@",result2];
    urlString= [urlString stringByAppendingFormat:@"%@",code];
    
    
    return urlString;
}
-(NSString *)isStringWith:(NSString*)str{
    
    if([str isKindOfClass:[NSNumber class]]){
        str = [NSString stringWithFormat:@"%@",str];
    }
    return str;
}




@end







