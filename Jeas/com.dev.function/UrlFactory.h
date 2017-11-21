//
//  UrlFactory.h
//  OnLineStudy
//
//  Created by 徐文涛 on 15/4/22.
//  Copyright (c) 2015年 李源友. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlFactory : NSObject

+ (UrlFactory *)shareInstance;

- (NSString*)AppendJsonUrlMethod:(NSString*)action parameters:(NSDictionary*)parameters;

- (NSString*)getWithRootUrlAction:(NSString*)action andArgs:(NSArray*)args;

@end
