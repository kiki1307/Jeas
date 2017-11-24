//
//  SectionCController.m
//  Jeas
//
//  Created by 邸超 on 2017/3/15.
//  Copyright © 2017年 ANGEL. All rights reserved.
//

#import "SectionCController.h"

@interface SectionCController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray *maData;
@property(nonatomic,strong) UITableView *mvTableView;
@end

@implementation SectionCController


- (NSMutableArray *)maData {
    if (_maData == nil) {
        _maData = [[NSMutableArray alloc] initWithCapacity:0];
        
//        DownModel *model = [DownModel modelWithTitle:@"语文资料"
//                                                date:@"2017-11" url:@"jjjj"];
//        DownModel *mode2 = [DownModel modelWithTitle:@"数学资料"
//                                                date:@"2016-1" url:@"jjjj"];
//        DownModel *mode3 = [DownModel modelWithTitle:@"英语资料"
//                                                date:@"2015-6" url:@"jjjj"];
//        
//        [_maData addObject:model];
//        [_maData addObject:mode2];
//        [_maData addObject:mode3];
        
    }
    return _maData;
}

- (UITableView *)mvTableView {
    if (_mvTableView == nil) {
        
        _mvTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _mvTableView.backgroundColor=[UIColor whiteColor];
        
        _mvTableView.delegate = self;
        _mvTableView.dataSource = self;
        _mvTableView.estimatedRowHeight = 50.0f;
        _mvTableView.rowHeight = UITableViewAutomaticDimension;
        
        
//        _mvTableView.separatorColor = [UIColor redColor];
        _mvTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_mvTableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 10)];
        
        _mvTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _mvTableView.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        //[_mvTableView setLayoutMargins:UIEdgeInsetsZero];
        
        _mvTableView.tableFooterView = [UIView new];
        
    }
    return _mvTableView;
}

- (void)dealloc {
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)defaultDataLoading{
    [super defaultDataLoading];
}

- (void)setupNavigationBarAppearance{
    [super setupNavigationBarAppearance];
    self.navigationItem.title = @"第三章";
}

- (void)setupSubviewsUI{
    [super setupSubviewsUI];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.mvTableView];
    [_mvTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view);
    }];
}


#pragma mark --- TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *sign = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sign];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:sign];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = @"小明";
    cell.detailTextLabel.text = @"中国人民大学";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
