//
//  LoginController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/14.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "LoginController.h"
#import "MainController.h"

@interface LoginController ()
{

    UIButton *_loginBtn;// 登录 按钮
}
@end

@implementation LoginController

- (void)dealloc {

    //NSLog(@"------被 废弃了 ------");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    MainController *main = [[MainController alloc] init];
    [self.navigationController pushViewController:main animated:NO];
    [self removeFromParentViewController];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}
// 初始化数据加载
- (void)defaultDataLoading{
    [super defaultDataLoading];
}
// 设置导航栏 appearance
- (void)setupNavigationBarAppearance{
    [super setupNavigationBarAppearance];
    self.navigationItem.title = @"登录";
}
// 设置子控价UI
- (void)setupSubviewsUI{
    [super setupSubviewsUI];
    self.view.backgroundColor = [UIColor blueColor];
    
    _loginBtn = [[UIButton alloc] init];
    _loginBtn.frame = CGRectMake(100, 100, 100, 100);
    [_loginBtn setBackgroundColor:[UIColor grayColor]];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
}

#pragma mark --- action
// 登录
- (void)login {
    
    MainController *main = [[MainController alloc] init];
    [self.navigationController pushViewController:main animated:NO];
    [self removeFromParentViewController];
    
//    CASpringAnimation * ani = [CASpringAnimation animationWithKeyPath:@"bounds"];
//    ani.mass = 10.0; //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
//    ani.stiffness = 5000; //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
//    ani.damping = 100.0;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
//    ani.initialVelocity = 5.f;//初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
//    ani.duration = ani.settlingDuration;
//    ani.toValue = [NSValue valueWithCGRect:CGRectMake(0, 64, 300, 300)];
//    ani.removedOnCompletion = NO;
//    ani.fillMode = kCAFillModeForwards;
//    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    //[_loginBtn.layer addAnimation:ani forKey:@"boundsAni"];
//
//    
//    
//    UIWindow *window = [AppDelegate shareInstance].window;
//    UIView *_loginV = [[UIView alloc] init];
//    _loginV.frame = CGRectMake(0, 0, 300, -300);
//    _loginV.backgroundColor =[UIColor redColor];
//    [window addSubview:_loginV];
//    
//    CATransition * transition = [CATransition animation];
//    transition.type = kCATransitionFromBottom;
//    transition.subtype = kCATransitionFromBottom;
//    transition.duration = 1.5;
//    _loginV.frame = CGRectMake(0, 0, 300, 300);
//    [_loginV.layer addAnimation:transition forKey:@"transitionAni"];
}

@end
