//
//  DownModel.m
//  Jeas
//
//  Created by 邸超 on 2017/11/24.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "DownModel.h"

@implementation DownModel

+ (instancetype)modelWithTitle:(NSString *)title
                          date:(NSString *)date
                           url:(NSString *)url {
    
    DownModel *model = [[DownModel alloc] init];
    model.msTitle = title;
    model.msDate = date;
    model.msUrl = url;
    return model;

}
@end
