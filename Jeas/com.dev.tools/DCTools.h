//
//  DCTools.h
//  BaseFoundation
//
//  Created by 邸超 on 16/10/18.
//  Copyright © 2016年 chaodi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCTools : NSObject



+ (instancetype)sharedInstance;

- (void)doSomeThings;

// ---将带符号的字符串 拆分下
- (void)transferStringStyle:(NSString *)string;

// ---获取当前时间
- (NSString *)acquireCurrentDate;

// 开启动画方法
-(void)startAnimationWithNavController:(UINavigationController *)nav;
@end
