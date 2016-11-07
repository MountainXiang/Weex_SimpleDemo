//
//  WeexShowcaseViewController.m
//  Weex_SimpleDemo
//
//  Created by tgyp on 16/11/7.
//  Copyright © 2016年 xds. All rights reserved.
//

#import "WeexShowcaseViewController.h"
#import <ATSDK/ATManager.h>
#import <WeexSDK/WeexSDK.h>
#import "SRWebSocket.h"

@interface WeexShowcaseViewController ()

@property(nonatomic, strong)WXSDKInstance *weexSDK;

@end

@implementation WeexShowcaseViewController

#pragma mark - dealloc
- (void)dealloc {
    [_weexSDK destroyInstance];
}

#pragma mark - Lazy Load
- (WXSDKInstance *)weexSDK {
    if (_weexSDK == nil) {
        _weexSDK = [WXSDKInstance new];
    }
    return _weexSDK;
}

#pragma mark - Init Method
- (instancetype)initWithJs:(NSString *)filePath {
    self = [super init];
    if (self) {
        //拼接成文件的绝对路径
        NSString *weexFilePath = [NSString stringWithFormat:@"file://%@/%@", [NSBundle mainBundle].bundlePath, filePath];
        //Use Your Log
        NSLog(@"----weexFilePath:%@", weexFilePath);
        self.weexUrlStr = weexFilePath;
    }
    return self;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.weexSDK.viewController = self;
    self.weexSDK.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    NSURL *weexUrl = [NSURL URLWithString:self.weexUrlStr];
    NSLog(@"----weexUrl:%@", weexUrl);
    [self.weexSDK renderWithURL:weexUrl];
    
    __weak typeof(self) weakSelf = self;
    self.weexSDK.onCreate = ^(UIView *view) {
        NSLog(@"The instance finishes creating the body.");
        [weakSelf.view addSubview:view];
    };
    self.weexSDK.renderFinish = ^(UIView *view) {
        NSLog(@"The instance finishes rendering.");
    };
    self.weexSDK.onFailed = ^(NSError *error) {
        NSLog(@"The instance fails to render:%@\n", error);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
