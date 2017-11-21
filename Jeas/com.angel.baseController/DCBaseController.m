//
//  DCBaseController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/14.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "DCBaseController.h"
@interface DCBaseController ()

@end

@implementation DCBaseController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self defaultDataLoading];
    [self setupNavigationBarAppearance];
    [self setupSubviewsUI];
}

// 检测网络状况
-(void)checkNetConnectStatus{
    
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
// 初始化数据加载
- (void)defaultDataLoading{

}
// 设置导航栏 appearance
- (void)setupNavigationBarAppearance{
    
    
    // 隐藏'返回'文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    [navigationBar setTintColor:[UIColor redColor]];
    UIImage *image = [UIImage imageNamed:@"nav_back.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationBar.backIndicatorImage = image;
    navigationBar.backIndicatorTransitionMaskImage = image;
    
    // 设置导航文字颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //    [[UINavigationBar appearance] setTranslucent:YES];
    
    // 设置导航背景
    UIImage* img=[UIImage imageNamed:@"nav_bg"];//原图
    UIEdgeInsets edge=UIEdgeInsetsMake(0, 0, 0,0);
    img= [img resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeTile];
    [[UINavigationBar appearance] setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    
    // 设置导航字体   shadow, NSShadowAttributeName,
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:16], NSFontAttributeName, nil]];
    
    
}
// 设置子空间UI
- (void)setupSubviewsUI{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
