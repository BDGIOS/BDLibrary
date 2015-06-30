//
//  BaseViewViewController.m
//  BaiduLibrary
//
//  Created by zhuayi on 14/10/20.
//  Copyright (c) 2014年 zhuayi inc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        /**
         *  设置 YES, 不监听网络状态
         */
        if (!self.isNotMontorNetWork)
        {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netWorkUnavailable) name:@"netWorkUnavailable" object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netWorkAvailable) name:@"netWorkAvailable" object:nil];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //IOS7 UI适配
    if (IOS7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    
    
    if (_isShowNavigationView)
    {
        _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topView_height)];
        _navigationView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.85];
        
        [self.view addSubview:_navigationView];
    }
    
    //添加返回按钮
    if (_isShowBackButton)
    {
        self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, topView_origin_y, 44, 44)];
        self.backButton.accessibilityLabel = @"backButton";
        [self.backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        [self.backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        if (_isShowNavigationView)
        {
            [self.navigationView addSubview:self.backButton];
        }
        else
        {
            UIBarButtonItem * sharItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
            self.navigationItem.leftBarButtonItem = sharItem;
        }
        
    }
    else
    {
        self.navigationItem.leftBarButtonItem = nil;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%s", __func__);
    // Dispose of any resources that can be recreated.
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) netWorkUnavailable
{
    //NSLog(@"网络不可用");
}

- (void) netWorkAvailable
{
//    NSLog(@"netWorkAvailable");
}

- (void)dealloc
{
    //NSLog(@"dealloc :%@",[self class]);
}
@end
