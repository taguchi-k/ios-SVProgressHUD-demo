//
//  ObjCViewController.m
//  ios-SVProgressHUD-demo
//
//  Created by Kentaro on 2017/03/11.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

#import "ObjCViewController.h"
#import "SVProgressHUD.h"

@interface ObjCViewController ()

@end

@implementation ObjCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addObservers];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - アクション

/*
 インジケータ
 */
- (IBAction)didTapShowIndicator:(UIButton *)sender
{
    // インジケータのみのHUDを表示する
    [SVProgressHUD show];

//    // 文字付きのHUDを表示する
//    [SVProgressHUD showWithStatus:@"表示する文字列"];
//
//    // HUDを消去する（すぐ消す
//    [SVProgressHUD dismiss];
//
//    // 即時消去後に何かする
//    [SVProgressHUD dismissWithCompletion:^{
//        NSLog(@"HUDを消しました");
//    }];
//
//    // 3秒後に消す
//    [SVProgressHUD dismissWithDelay:3.0];

    // 3秒後に消した後に何かする
    [SVProgressHUD dismissWithDelay:3.0
                         completion:^{
                             NSLog(@"HUDを消しました");
                         }];
}

/*
 ポップアップ
 */
- (IBAction)didTapShowPopup:(UIButton *)sender
{
    /*
     スタイル（SVProgressHUDStyle）
     */
    // （デフォルト）light
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];

    // dark
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];

    // カスタム
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
//    [SVProgressHUD setForegroundColor:[UIColor yellowColor]];
//    [SVProgressHUD setBackgroundColor:[UIColor blueColor]];

    /*
     マスク
     */
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];

    /*
     表示するポップアップ
     */
    // Info
//    [SVProgressHUD showInfoWithStatus:@"表示する文字列"];

    // Success
//    [SVProgressHUD showSuccessWithStatus:@"表示する文字列"];

    // Error
//    [SVProgressHUD showErrorWithStatus:@"表示する文字列"];
}

- (IBAction)didTapTransition:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 通知

- (void)addObservers
{
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(willDisappearNotification)
                                                 name:SVProgressHUDWillDisappearNotification
                                               object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(didDisappearNotification)
                                                 name:SVProgressHUDDidDisappearNotification
                                               object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(willAppearNotification)
                                                 name:SVProgressHUDWillAppearNotification
                                               object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(didAppearNotification)
                                                 name:SVProgressHUDDidAppearNotification
                                               object: nil];
}

- (void)willAppearNotification
{
    NSLog(@"willAppearNotification");
}

- (void)didAppearNotification
{
    NSLog(@"didAppearNotification");
}

- (void)willDisappearNotification
{
    NSLog(@"willDisappearNotification");
}

- (void)didDisappearNotification
{
    NSLog(@"didDisappearNotification");
}

@end
