//
//  DCBaseController.h
//  Jeas
//
//  Created by 邸超 on 2017/3/14.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCBaseController : UIViewController

#pragma mark --- 控制器 初始化加载的方法
// 初始化数据加载
- (void)defaultDataLoading;
// 设置导航栏 appearance
- (void)setupNavigationBarAppearance;
// 设置子空间UI
- (void)setupSubviewsUI;
@end
