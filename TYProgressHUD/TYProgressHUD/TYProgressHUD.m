//
//  TYProgressHUD.m
//  TYProgressHUD
//
//  Created by 吴海瑞 on 2018/9/20.
//  Copyright © 2018年 海瑞. All rights reserved.
//

#import "TYProgressHUD.h"

@interface TYProgressHUD()
@property (nonatomic, strong) TYProgressHUDView *hud;
@end
@implementation TYProgressHUD

+ (instancetype)sharedInstance{
    
    static TYProgressHUD *typHUD = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        typHUD = [[TYProgressHUD alloc] init];
    });
    return typHUD;
}
- (BOOL)checkHud{
    if ([TYProgressHUD sharedInstance].hud.superview != nil){
        return false;
    }
    return true;
}
+ (void)showSuccess:(NSString *)text zoom:(BOOL)zoom shadow:(BOOL)shadow{
    [TYProgressHUD hideInKeyWindow];
    TYProgressHUDView *hud = [[TYProgressHUDView alloc] init];
    hud.type = TYProgressHUDViewSuccess;
    hud.location = TYProgressHUDViewCenter;
    hud.text = text;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:hud];
    [hud complete];
}


+ (void)showFailure:(NSString *)text zoom:(BOOL)zoom shadow:(BOOL)shadow{
    [TYProgressHUD hideInKeyWindow];
    TYProgressHUDView *hud = [[TYProgressHUDView alloc] init];
    hud.type = TYProgressHUDViewFailure;
    hud.location = TYProgressHUDViewCenter;
    hud.text = text;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:hud];
    [hud complete];
}
+ (void)showWarning:(NSString *)text zoom:(BOOL)zoom shadow:(BOOL)shadow{
    [TYProgressHUD hideInKeyWindow];
    TYProgressHUDView *hud = [[TYProgressHUDView alloc] init];
    hud.type = TYProgressHUDViewWarning;
    hud.location = TYProgressHUDViewCenter;
    hud.text = text;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:hud];
    [hud complete];
}

+ (void)showText:(NSString *)text Location:(TYProgressHUDViewLocation)location zoom:(BOOL)zoom shadow:(BOOL)shadow{
    [TYProgressHUD hideInKeyWindow];
    TYProgressHUDView *hud = [[TYProgressHUDView alloc] init];
    hud.type = TYProgressHUDViewText;
    hud.location = location;
    hud.text = text;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:hud];
    [hud complete];
}
+ (void)showLoading:(NSString *)text{
    [TYProgressHUD hideInKeyWindow];
    [TYProgressHUD sharedInstance].hud = [[TYProgressHUDView alloc] init];
    [TYProgressHUD sharedInstance].hud.type = TYProgressHUDViewLoading;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:[TYProgressHUD sharedInstance].hud];
    [[TYProgressHUD sharedInstance].hud complete];
}

+ (void)hideInKeyWindow{
    TYProgressHUDView *hud = [TYProgressHUD sharedInstance].hud;
    if ([hud superview] != nil){
        [[TYProgressHUD sharedInstance].hud removeFromSuperview];
    }
}

#pragma mark - HUD 添加到 View


+ (void)showSuccess:(NSString *)text inView:(UIView *)view zoom:(BOOL)zoom shadow:(BOOL)shadow{
    [TYProgressHUD hideInView:view];
    TYProgressHUDView *hud = [[TYProgressHUDView alloc] init];
    hud.type = TYProgressHUDViewSuccess;
    hud.location = TYProgressHUDViewCenter;
    hud.text = text;
    [view addSubview:hud];
    [hud complete];
}


+ (void)showFailure:(NSString *)text inView:(UIView *)view zoom:(BOOL)zoom shadow:(BOOL)shadow{
    [TYProgressHUD hideInView:view];
    TYProgressHUDView *hud = [[TYProgressHUDView alloc] init];
    hud.type = TYProgressHUDViewFailure;
    hud.location = TYProgressHUDViewTop;
    hud.text = text;
    [view addSubview:hud];
    [hud complete];
}
+ (void)showWarning:(NSString *)text inView:(UIView *)view zoom:(BOOL)zoom shadow:(BOOL)shadow{
    [TYProgressHUD hideInView:view];
    TYProgressHUDView *hud = [[TYProgressHUDView alloc] init];
    hud.type = TYProgressHUDViewWarning;
    hud.location = TYProgressHUDViewTop;
    hud.text = text;
    [view addSubview:hud];
    [hud complete];
}
+ (void)showText:(NSString *)text Location:(TYProgressHUDViewLocation)location  inView:(UIView *)view zoom:(BOOL)zoom shadow:(BOOL)shadow{
    [TYProgressHUD hideInView:view];
    TYProgressHUDView *hud = [[TYProgressHUDView alloc] init];
    hud.type = TYProgressHUDViewText;
    hud.location = location;
    hud.text = text;
    [view addSubview:hud];
    [hud complete];
}
+ (void)showLoading:(NSString *)text inView:(UIView *)view{
    
    [TYProgressHUD hideInView:view];
    [TYProgressHUD sharedInstance].hud = [[TYProgressHUDView alloc] init];
    [TYProgressHUD sharedInstance].hud.type = TYProgressHUDViewLoading;
    [view addSubview:[TYProgressHUD sharedInstance].hud];
    [[TYProgressHUD sharedInstance].hud complete];
    
}

+ (void)hideInView:(UIView *)view{
    TYProgressHUDView *hud = [TYProgressHUD sharedInstance].hud;
    if ([hud superview] != nil){
        [[TYProgressHUD sharedInstance].hud removeFromSuperview];
    }
}


@end
