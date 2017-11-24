//
//  SectionAController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/15.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SectionAController.h"
#import "VerticallyAlignedLabel.h"

#import "MessageDetailController.h"


#import "DownCenterController.h"
@interface SectionAController ()
{

    UIButton *_btn;
}
@end

@implementation SectionAController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    _btn = [[UIButton alloc] init];
    _btn.frame = CGRectMake(0, 0, 100, 100);
    _btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_btn];
    [_btn addTarget:self action:@selector(assetDownlosadcfas) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *_lab = [[UILabel alloc] init];
    _lab.text = @"siugdisadgof";
    _lab.frame = CGRectMake(0,200 ,200, 50);
    _lab.backgroundColor = DCcolorRGB(255, 0, 0);
    [self.view addSubview:_lab];
    
//    VerticallyAlignedLabel *label = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 300, 200, 50)];
//    [label setVerticalAlignment:VerticalAlignmentTop];
//    label.backgroundColor = DCcolorRGB(255, 0, 0);
//    label.text = @"siugdisadgof";
//    [self.view addSubview:label];

//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view).offset(300);
//        make.bottom.equalTo(self.view);
//    }];
 
    
    
}


// 初始化数据加载
- (void)defaultDataLoading{
    [super defaultDataLoading];
}

// 设置导航栏 appearance
- (void)setupNavigationBarAppearance{
    [super setupNavigationBarAppearance];
    self.navigationItem.title = @"第一章";
}

// 设置子控价UI
- (void)setupSubviewsUI{
    [super setupSubviewsUI];
    self.view.backgroundColor = [UIColor whiteColor];
    
}


#pragma mark --- action
- (void)assetDownlosadcfas{
    
    DownCenterController *center = [DownCenterController new];
    [self.navigationController pushViewController:center animated:YES];
    return;
    

    MessageDetailController *chatController = [[MessageDetailController alloc] initWithConversationChatter:@"8001" conversationType:EMConversationTypeChat];
    
    [self.navigationController pushViewController:chatController animated:YES];
    
}

@end
