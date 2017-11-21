//
//  ViewController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/13.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<RTLabelDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    RTLabel *rtl = [[RTLabel alloc] init];
    rtl.delegate = self;
    //rtl.frame = CGRectMake(100, 100, 200, 500);
    rtl.backgroundColor = [UIColor redColor];
    rtl.layer.cornerRadius = 20;
    rtl.layer.masksToBounds = YES;
    rtl.layer.borderWidth = 10;
    rtl.font = [UIFont systemFontOfSize:20];
    rtl.paragraphReplacement = @"564646464";
    [rtl setLineBreakMode:RTTextLineBreakModeCharWrapping];
    [rtl setTextAlignment:RTTextAlignmentCenter];
    [rtl setText:@"skdoasb"];
    [rtl setLineSpacing:10];

    
    CGSize size = [rtl optimumSize];
    [self.view addSubview:rtl];
    
    [rtl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(100, 20, 100, 20));
    }];

    
}

- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSURL*)url {

    NSLog(@"++++++++++++");
}



@end
