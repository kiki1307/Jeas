//
//  DownModel.h
//  Jeas
//
//  Created by 邸超 on 2017/11/24.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownModel : NSObject

@property(nonatomic,copy) NSString *msTitle;
@property(nonatomic,copy) NSString *msDate;
@property(nonatomic,copy) NSString *msUrl;

+ (instancetype)modelWithTitle:(NSString *)title
                          date:(NSString *)date
                           url:(NSString *)url;
@end
