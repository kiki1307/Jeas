//
//  Tools.m
//  Jeas
//
//  Created by 邸超 on 2017/3/13.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "Tools.h"

@implementation Tools



+ (Tools *)shareInstance{
    
    static Tools *tool = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        tool = [[Tools alloc] init];
    });
    return tool;
}

#pragma mark --- 编辑字符串
- (void)stringEditMethod {

    //NSString常用方法
    NSString *string = @"wangJiao";
    //首字母大写
    NSLog(@"string: %@",[string capitalizedString]);
    //全部小写
    NSLog(@"string: %@",[string lowercaseString]);
    //全部大写
    NSLog(@"string: %@",[string uppercaseString]);
    
    
    NSString *baseStr = @"Someday U will know this";
    
    //判断是否包含前后缀
    BOOL isHasS = [baseStr hasPrefix:@"Someday"];
    BOOL isHasT = [baseStr hasSuffix:@"this"];
    
    //分割字符串
    NSArray *array = [baseStr componentsSeparatedByString:@"a"];
    NSString *string1 = [array objectAtIndex:0];
    NSString *string2 = [array objectAtIndex:1];
    NSLog(@"string1:%@  string2:%@",string1,string2);
    
    //去除字符串首尾的空格和换行符
    NSString *text = [baseStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"text:%@",text);
    
    //NSString替换字符串
    NSString *replaceString = [baseStr stringByReplacingOccurrencesOfString:@"U" withString:@"I"];
    NSLog(@"replaceString:  %@",replaceString);
    
    //NSMutableString常用方法
    NSMutableString *baseMulStr = [[NSMutableString alloc] initWithString:baseStr];
    
    //NSMutableString替换字符串
    //按位置替换
    [baseMulStr replaceCharactersInRange:NSMakeRange(0, 1) withString:@"a"];
    //按字符替换
    [baseMulStr stringByReplacingOccurrencesOfString:@"i" withString:@"u"];
    
    //拼接字符串
    [baseMulStr appendString:@"thing"];
    NSLog(@"string:%@",baseMulStr);
    
    //插入字符串
    [baseMulStr insertString:@"perhaps " atIndex:7];
    NSLog(@"string: %@",baseMulStr);
    
    //删除字符串
    [baseMulStr deleteCharactersInRange:NSMakeRange(8, 1)];
    NSLog(@"String1: %@",baseMulStr);
    
    //判断是否包含某个字符
    BOOL IsContain = [baseMulStr containsString:@"+"];
    
    //注意判断是否包含这个方法只支持iOS8以上的系统, 要适配iOS7可以换下面这种方式实现
    NSRange range0 = [baseMulStr rangeOfString:@"+"];
    if (range0.location == NSNotFound) {//不包含, 否则包含"+"
    
    }
    
    
    // 富文本
    NSString * text1 = @"今天天气好晴朗,嘿!处处百花香,嘿嘿嘿!!!明天星期二,后天就是星期三,再有两天就又放假咯!吼吼吼~~~";
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text1];
    NSDictionary *attributeDict = @{NSFontAttributeName:[UIFont systemFontOfSize:18],
                         NSForegroundColorAttributeName:[UIColor redColor]};
    
    NSDictionary *attributeDict1 = @{NSFontAttributeName: [UIFont systemFontOfSize:23.0],
                                     NSForegroundColorAttributeName: [UIColor colorWithRed:0.130 green:0.854 blue:0.345 alpha:1.000]};
    [attrStr setAttributes:attributeDict1 range:NSMakeRange(0, 7)];
    [attrStr setAttributes:attributeDict range:NSMakeRange(7, attrStr.length -7)];

    
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:23.0] range:NSMakeRange(16, 3)];
    
    [attrStr removeAttribute:NSFontAttributeName range:NSMakeRange(23, 3)];
    
    [attrStr replaceCharactersInRange:NSMakeRange(1, 2) withString:@""];
    
    NSMutableString *mutStr = attrStr.mutableString;
    NSMutableAttributedString *tempStr1 = [[NSMutableAttributedString alloc] initWithString:@"插入的文字" attributes:attributeDict1];
    NSMutableAttributedString *tempStr2 = [[NSMutableAttributedString alloc] initWithString:@"插入的文字"];
    [attrStr insertAttributedString:tempStr1 atIndex:7];
    [attrStr insertAttributedString:tempStr2 atIndex:7];
    
    NSString *text3 = nil;
    
    // NString 动态获取文本size, 这个方法默认是一行, 所以如果文本很多的话, 宽度会无限增大
    //CGSize size = [text3 sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:f@"",NSFontAttributeName, nil]];
    
    // NString 宽度一定动态获取文本高度
   // CGRect strRect = [text3 boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName : fontTemp} context:nil];
    
    // NSAttributedString 宽度一定动态获取文本高度
    //CGRect strRect = [attrStr boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) context:nil];
}

// 判断是否为空
+ (BOOL)IsEmpty:(NSString*)objString{
    objString =[NSString stringWithFormat:@"%@",objString];
    
    if ((objString == nil) || (objString.length <= 0) ||[objString isEqualToString:@""] ||[objString isEqualToString:@"(null)"]) {
        return true;
    }
    return false;
}

// 将对象转成字符串
+ (NSString *)transformToString:(id)object {
    
    NSString *str = nil;
    str = [NSString stringWithFormat:@"%@",object];
    return str;
}

// 拼接字符串
+ (NSString *)mergeStringWithArr:(NSArray *)arr {
    
    
    NSString *str = @"";
    for (NSString *tem in arr) {
        
        str  =[str stringByAppendingString:tem];
    }
    return str;
}


#pragma mark --- 判断网络连接是否可用
+ (BOOL) isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    
    Reachability *reach =[Reachability reachabilityForInternetConnection];
    switch ([reach currentReachabilityStatus]) {
            
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    return isExistenceNetwork;
}

+ (void)checkNetConnectStatus{
    
    //1.创建网络状态监测管理者
    AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];
    //开启监听，记得开启，不然不走block
    [manger startMonitoring];
    
    //2.监听改变
    [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /*
         AFNetworkReachabilityStatusUnknown = -1,
         AFNetworkReachabilityStatusNotReachable = 0,
         AFNetworkReachabilityStatusReachableViaWWAN = 1,
         AFNetworkReachabilityStatusReachableViaWiFi = 2,
         */
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                [[NSNotificationCenter defaultCenter] postNotificationName:@"checkNetConnectionStatus" object:@"-1"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                [[NSNotificationCenter defaultCenter] postNotificationName:@"checkNetConnectionStatus" object:@"0"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G|4G");
                [[NSNotificationCenter defaultCenter] postNotificationName:@"checkNetConnectionStatus" object:@"1"];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                [[NSNotificationCenter defaultCenter] postNotificationName:@"checkNetConnectionStatus" object:@"2"];
                break;
                
            default:
                break;
        }
    }];
}

#pragma mark --- 判断消息提示
+ (void)showToast :(UIView*)view :(NSString*)title : (long)delayTime{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide =YES;
    hud.mode = MBProgressHUDModeText;
    //hud.label.text = title;
    hud.minSize = CGSizeMake(132.f, 45.0f);
    //[hud hideAnimated:YES afterDelay:delayTime];
    
}

#pragma mark --- 关于 计时器
- (void)aboutTimer{

    NSTimer *timer = nil;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/2 target:self selector:@selector(syncUIStatus) userInfo:nil repeats:YES];
    [timer setFireDate:[NSDate distantFuture]];//---关闭
    [timer setFireDate:[NSDate distantPast]];//---开启
}
@end
