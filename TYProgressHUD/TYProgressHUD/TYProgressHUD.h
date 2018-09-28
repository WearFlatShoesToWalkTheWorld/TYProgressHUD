//
//  TYProgressHUD.h
//  TYProgressHUD
//
//  Created by 吴海瑞 on 2018/9/20.
//  Copyright © 2018年 海瑞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TYProgressHUDView.h"
NS_ASSUME_NONNULL_BEGIN

@interface TYProgressHUD : NSObject

+ (instancetype)sharedInstance;

#pragma mark - HUD 添加到 KeyWindow

/**
 *  显示 成功 HUD 到 KeyWindow 上
 *
 *  @param text   文本
 *  @param zoom   缩放动画效果 默认淡入淡出效果 暂未实现
 *  @param shadow 阴影 默认有阴影
 */
+ (void)showSuccess:(NSString *)text zoom:(BOOL)zoom shadow:(BOOL)shadow;

/**
 *  显示 失败 HUD 到 KeyWindow 上
 */
+ (void)showFailure:(NSString *)text zoom:(BOOL)zoom shadow:(BOOL)shadow;
/**
 *  显示 警告 HUD 到 KeyWindow 上
 */
+ (void)showWarning:(NSString *)text zoom:(BOOL)zoom shadow:(BOOL)shadow;

/**
 *  显示 文本 HUD 到 KeyWindow 上
 *  location 显示位置
 */
+ (void)showText:(NSString *)text Location:(TYProgressHUDViewLocation)location zoom:(BOOL)zoom shadow:(BOOL)shadow;

/**
 *  显示 Loading HUD 到 KeyWindow 上
 *  暂时不提供 text 展示,只有 loading
 */
+ (void)showLoading:(NSString *)text;


/**
 *  隐藏添加到 KeyWindow 上的 Loading HUD
 */
+ (void)hideInKeyWindow;

#pragma mark - HUD 添加到 View

/**
 *  显示 成功 HUD 到 View 上
 */
+ (void)showSuccess:(NSString *)text inView:(UIView *)view zoom:(BOOL)zoom shadow:(BOOL)shadow;

/**
 *  显示 失败 HUD 到 View 上
 */
+ (void)showFailure:(NSString *)text inView:(UIView *)view zoom:(BOOL)zoom shadow:(BOOL)shadow;

/**
 *  显示 警告 HUD 到 View 上
 */
+ (void)showWarning:(NSString *)text inView:(UIView *)view zoom:(BOOL)zoom shadow:(BOOL)shadow;

/**
 *  显示 文本 HUD 到 View 上
 *  location 显示位置
 */

+ (void)showText:(NSString *)text Location:(TYProgressHUDViewLocation)location  inView:(UIView *)view zoom:(BOOL)zoom shadow:(BOOL)shadow;
/**
 *  显示 Loading HUD 到 View 上
 *  暂时不提供 text 展示,只有 loading
 */
+ (void)showLoading:(NSString *)text inView:(UIView *)view;

/**
 *  隐藏添加到 View 上的 Loading HUD
 */
+ (void)hideInView:(UIView *)view;



#pragma mark - 通用

@end

NS_ASSUME_NONNULL_END
