//
//  ExamAjaxCallBack.h
//  lmsApp
//
//  Created by 邸超 on 2016/12/30.
//  Copyright © 2016年 chaodi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TAGSuccess @"获取成功"
#define TAGFial @"error:暂无数据"




@protocol OnlineStudyCallBackDelegate <NSObject>
@optional
-(void)OnlineStudyCallBack:(Boolean)isSuccess andErrorMsg:(NSString*)errorMsg andObject:(id)object;


-(void)OnlineStudyCallBack:(int)callBackNum andIsSuccessed:(Boolean)isSuccess andErrorMsg:(NSString*)errorMsg andObject:(id)object;

@end



@interface OnlineStudyCallBack : NSObject
{
 
    Boolean isAddCallBack;
   
}



@property(nonatomic,assign)id<OnlineStudyCallBackDelegate> delegate;

@property(nonatomic,strong) NSMutableArray *Arr;

@property(nonatomic,assign) int callBackNum;

-(instancetype)initWithIsAddCallBack:(Boolean)addCallBack;

-(void)loginCallback:(NSString *)requestUrl password:(NSString *)psw;//登录

@end
