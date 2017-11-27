//
//  SectionCModel.m
//  Jeas
//
//  Created by 邸超 on 2017/11/24.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SectionCModel.h"

@implementation SectionCModel


- (instancetype)initTitleWith:(NSString*)msTitle msIconName:(NSString*)msIconName {
    
    if (self == [super init]) {
        
        _msTitle = msTitle;
        _msIconName = msIconName;
    }
    
    return self;
}
+ (instancetype)modelWith:(NSString*)msTitle msIconName:(NSString*)msIconName {
    
    
    return [[SectionCModel alloc] initTitleWith:msTitle msIconName:msIconName];
}

@end
