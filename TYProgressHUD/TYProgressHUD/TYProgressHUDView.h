//
//  TYProgressHUDView.h
//  TYProgressHUD
//
//  Created by 吴海瑞 on 2018/9/20.
//  Copyright © 2018年 海瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, TYProgressHUDViewState) {
    /**Success elements*/
    TYProgressHUDViewSuccess = 0,
    /**Failure elements*/
    TYProgressHUDViewFailure,
    /**loading elements*/
    TYProgressHUDViewLoading,
    /**Warning elements*/
    TYProgressHUDViewWarning,
    /**Text elements*/
    TYProgressHUDViewText
    
};
typedef NS_ENUM(NSUInteger, TYProgressHUDViewLocation) {
    /**Top elements*/
    TYProgressHUDViewTop = 0,
    /**Center elements*/
    TYProgressHUDViewCenter,
    /**Buttom elements*/
    TYProgressHUDViewButtom
};
@interface TYProgressHUDView : UIView

/**
 style
 */
@property (nonatomic, assign) TYProgressHUDViewState type;

/**
 location
 */
@property (nonatomic, assign) TYProgressHUDViewLocation location;
/**
 左图
 */
@property (nonatomic, assign) UIImage *leftImage;

/**
 文本
 */
@property (nonatomic, copy) NSString *text;

/**
 非 loading 展示时间
 
 @b Default: 2.
 */
@property (nonatomic, assign) NSInteger time;
/**
 动画时间
 
 @b Default: 0.3.
 */
@property (nonatomic, assign) double animationTime;

@property (nonatomic, assign) BOOL shadow;
/**
 已完成所有数据的初始化工作
 */
- (void)complete;
@end

NS_ASSUME_NONNULL_END
