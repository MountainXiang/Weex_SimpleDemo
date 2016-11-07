//
//  WeexShowcaseViewController.h
//  Weex_SimpleDemo
//
//  Created by tgyp on 16/11/7.
//  Copyright © 2016年 xds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeexShowcaseViewController : UIViewController

@property(nonatomic, copy)NSString *weexUrlStr;//Url字符串


/**
 自定义初始化方法

 @param filePath JS文件的相对路径

 @return 初始化对象
 */
- (instancetype)initWithJs:(NSString *)filePath;

@end
