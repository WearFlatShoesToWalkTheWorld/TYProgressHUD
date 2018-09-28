//
//  TYProgressHUDView.m
//  TYProgressHUD
//
//  Created by 吴海瑞 on 2018/9/20.
//  Copyright © 2018年 海瑞. All rights reserved.
//

#import "TYProgressHUDView.h"
#define TYPScreenHeight             [UIScreen mainScreen].bounds.size.height
#define TYPScreenWidth              [UIScreen mainScreen].bounds.size.width

#define redColor [UIColor colorWithRed:255/255.0 green:144/255.0 blue:140/255.0 alpha:1]
#define darkColor [UIColor colorWithRed:60/255.0 green:61/255.0 blue:61/255.0 alpha:1]

#define Is_Iphone_X ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && (TYPScreenHeight == 812.0))
#define StatusBarHeight (Is_Iphone_X == true) ? 44 : 20
#define topHeight 28
#define topLabelFontSize 13
//#import "TYProgressHUD.h"
@interface TYProgressHUDView()

@end

@implementation TYProgressHUDView
{
    NSInteger viewWidth;
    UIImageView *leftImgv;
    UILabel *rightLabel;
    NSInteger textWidth;
    BOOL isStateBarHidden;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _time = 2;
        _type = TYProgressHUDViewText;
        _animationTime = 0.3;
        _text = @"";
        _location = TYProgressHUDViewCenter;
        _shadow = true;
        isStateBarHidden = YES;
    }
    return self;
}
- (void)complete{
    [self createBaseView];
}
- (void)createBaseView{
    
    if([_text isEqualToString:@""]){
        if(_type == TYProgressHUDViewText){
            viewWidth = 0;
        }else if(_type == TYProgressHUDViewLoading){
            
            viewWidth = 80;
        }else{
            if (_type == TYProgressHUDViewWarning){
                viewWidth = 80;
            }else{
                viewWidth = 78;
            }
        }
        
    }else{
        
        textWidth = [self measureSinglelineStringSize:_text andFont:[UIFont systemFontOfSize:16 weight:UIFontWeightMedium]].width;
        
        if(_type == TYProgressHUDViewText){
            
            viewWidth = textWidth + 48;
        }else if(_type == TYProgressHUDViewLoading){
            
            viewWidth = 80;
        }else{
            if (_type == TYProgressHUDViewWarning){
                viewWidth = 80 + textWidth;
            }else{
                viewWidth = 78 + textWidth;
            }
        }
    }
    
    if(_location == TYProgressHUDViewCenter){
        
        NSInteger viewHeight = 48;
        if(_type == TYProgressHUDViewLoading){
            viewHeight = 80;
        }
        
        self.frame = CGRectMake((TYPScreenWidth - viewWidth) / 2, (TYPScreenHeight - viewHeight) / 2, viewWidth, viewHeight);
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 8;
        self.alpha = 0;
        
    }else{
        
        self.frame = CGRectMake(6, -topHeight, TYPScreenWidth - 12, topHeight);
        self.backgroundColor = redColor;
        self.layer.cornerRadius = 4;
    }
    
    if (_shadow == true){
        if (_location == TYProgressHUDViewCenter){
            self.layer.shadowColor = [UIColor blackColor].CGColor;
            self.layer.shadowOffset = CGSizeMake(0, 8);
            self.layer.shadowOpacity = 0.08f;
            self.layer.shadowRadius = 30.0f;
        }else if (_location == TYProgressHUDViewTop){
            self.layer.shadowColor = redColor.CGColor;
            self.layer.shadowOffset = CGSizeMake(0, 2);
            self.layer.shadowOpacity = 0.3f;
            self.layer.shadowRadius = 6.0f;
        }
        
        
    }
    [self createSubView];
    
}

- (void)createSubView{
    
    switch (_type) {
        case TYProgressHUDViewSuccess:
            if (_location == TYProgressHUDViewTop){
                leftImgv = [[UIImageView alloc] initWithFrame:CGRectMake(24, (self.frame.size.height - 24) / 2, 24, 24)];
                
                leftImgv.image = [self getImageWithImageName:@"yesToast"];
                [self addSubview:leftImgv];
                
                rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(54, 0, self.frame.size.width - 54, self.frame.size.height)];
                rightLabel.text = _text;
                rightLabel.font = [UIFont systemFontOfSize:topLabelFontSize weight:UIFontWeightMedium];
                rightLabel.textColor = [UIColor whiteColor];
                [self addSubview:rightLabel];
            }else if (_location == TYProgressHUDViewCenter){
                leftImgv = [[UIImageView alloc] initWithFrame:CGRectMake(24, (self.frame.size.height - 24) / 2, 24, 24)];
                
                leftImgv.image = [self getImageWithImageName:@"yesToast"];
                [self addSubview:leftImgv];
                
                rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(54, 0, self.frame.size.width - 54, self.frame.size.height)];
                rightLabel.text = _text;
                rightLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
                rightLabel.textColor = darkColor;
                [self addSubview:rightLabel];
            }
            
            break;
        case TYProgressHUDViewFailure:
            if (_location == TYProgressHUDViewTop){
                leftImgv = [[UIImageView alloc] initWithFrame:CGRectMake(24, (self.frame.size.height - 24) / 2, 24, 24)];
                
                leftImgv.image = [self getImageWithImageName:@"noToast"];
                [self addSubview:leftImgv];
                rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(56, 0, self.frame.size.width - 56, self.frame.size.height)];
                rightLabel.text = _text;
                rightLabel.font = [UIFont systemFontOfSize:topLabelFontSize weight:UIFontWeightMedium];
                rightLabel.textColor = [UIColor whiteColor];
                [self addSubview:rightLabel];
            }else if (_location == TYProgressHUDViewCenter){
                leftImgv = [[UIImageView alloc] initWithFrame:CGRectMake(24, (self.frame.size.height - 24) / 2, 24, 24)];
                
                leftImgv.image = [self getImageWithImageName:@"noToast"];
                [self addSubview:leftImgv];
                rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(56, 0, self.frame.size.width - 56, self.frame.size.height)];
                rightLabel.text = _text;
                rightLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
                rightLabel.textColor = darkColor;
                [self addSubview:rightLabel];
            }
            
            break;
        case TYProgressHUDViewWarning:
            if (_location == TYProgressHUDViewTop){
                leftImgv = [[UIImageView alloc] initWithFrame:CGRectMake(24, (self.frame.size.height - 24) / 2, 26, 24)];
                
                leftImgv.image = [self getImageWithImageName:@"warningToast"];
                [self addSubview:leftImgv];
                rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(54, 0, self.frame.size.width - 54, self.frame.size.height)];
                rightLabel.text = _text;
                rightLabel.font = [UIFont systemFontOfSize:topLabelFontSize weight:UIFontWeightMedium];
                rightLabel.textColor = [UIColor whiteColor];
                [self addSubview:rightLabel];
            }else if (_location == TYProgressHUDViewCenter){
                leftImgv = [[UIImageView alloc] initWithFrame:CGRectMake(24, (self.frame.size.height - 24) / 2, 26, 24)];
                
                leftImgv.image = [self getImageWithImageName:@"warningToast"];
                [self addSubview:leftImgv];
                rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(54, 0, self.frame.size.width - 54, self.frame.size.height)];
                rightLabel.text = _text;
                rightLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
                rightLabel.textColor = darkColor;
                [self addSubview:rightLabel];
            }
            
            break;
        case TYProgressHUDViewLoading:
        {
            UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 35, 10, 10)];
            centerLabel.backgroundColor = [UIColor blackColor];
            centerLabel.layer.cornerRadius = 5;
            centerLabel.clipsToBounds = YES;
            [self addSubview:centerLabel];
            
            UILabel *lLabel = [[UILabel alloc] initWithFrame:CGRectMake(19, 35, 10, 10)];
            lLabel.backgroundColor = [UIColor blackColor];
            lLabel.layer.cornerRadius = 5;
            lLabel.clipsToBounds = YES;
            [self addSubview:lLabel];
            
            UILabel *rLabel = [[UILabel alloc] initWithFrame:CGRectMake(51, 35, 10, 10)];
            rLabel.backgroundColor = [UIColor blackColor];
            rLabel.layer.cornerRadius = 5;
            rLabel.clipsToBounds = YES;
            [self addSubview:rLabel];
            
            [self loadingAnimatiomLabel:lLabel];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self loadingAnimatiomLabel:centerLabel];
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self loadingAnimatiomLabel:rLabel];
            });
        }
            break;
        case TYProgressHUDViewText:
            if (_location == TYProgressHUDViewTop){
                rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
                rightLabel.text = _text;
                rightLabel.font = [UIFont systemFontOfSize:topLabelFontSize weight:UIFontWeightMedium];
                rightLabel.textColor = [UIColor whiteColor];
                rightLabel.textAlignment = NSTextAlignmentCenter;
                [self addSubview:rightLabel];
            }else if (_location == TYProgressHUDViewCenter){
                rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
                rightLabel.text = _text;
                rightLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
                rightLabel.textAlignment = NSTextAlignmentCenter;
                rightLabel.textColor = darkColor;
                [self addSubview:rightLabel];
            }
            
            break;
    }
    
    
    
    [self show];
}

- (void)loadingAnimatiomLabel:(UILabel *)label{
    CGFloat lalpha = label.alpha;
    [UIView animateWithDuration:1.5 animations:^{
        label.alpha = 1 - lalpha;
    } completion:^(BOOL finished) {
        [self loadingAnimatiomLabel:label];
    }];
    
    
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    //    animation.fromValue = [NSNumber numberWithFloat:1.0];
    //    animation.toValue = [NSNumber numberWithFloat:0.1];
    //    animation.repeatCount = HUGE_VALF;
    //    animation.duration = 1.5;
    ////    animation.beginTime = CACurrentMediaTime();
    //    [label.layer addAnimation:animation forKey:nil];
    
}
- (void)show{
    switch (_location) {
        case TYProgressHUDViewCenter:
        {
            [UIView animateWithDuration:_animationTime animations:^{
                self.alpha = 1;
            } completion:^(BOOL finished) {
                if (self->_type != TYProgressHUDViewLoading){
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self->_time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [self hidden];
                    });
                }
            }];
        }
            
            break;
        case TYProgressHUDViewTop:
        {
            isStateBarHidden = [UIApplication sharedApplication].statusBarHidden;
            [UIApplication sharedApplication].statusBarHidden = YES;
            [UIView animateWithDuration:_animationTime delay:0 usingSpringWithDamping:10 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.frame = CGRectMake(6, StatusBarHeight - 14, TYPScreenWidth - 12, topHeight);
            } completion:^(BOOL finished) {
                if (self->_type != TYProgressHUDViewLoading){
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self->_time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [self hidden];
                    });
                }
            }];
        }
            
            break;
            case TYProgressHUDViewButtom: {
                
                break;
            }
    }
}
- (void)hidden{
    switch (_location) {
        case TYProgressHUDViewCenter:
        {
            
            [UIView animateWithDuration:_animationTime animations:^{
                self.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            
            break;
        case TYProgressHUDViewTop:
        {
            
            [UIView animateWithDuration:_animationTime delay:0 usingSpringWithDamping:10 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.frame = CGRectMake(6, -24, TYPScreenWidth - 12, 24);
            } completion:^(BOOL finished) {
                [UIApplication sharedApplication].statusBarHidden = self->isStateBarHidden;
                [self removeFromSuperview];
            }];
        }
            break;
            case TYProgressHUDViewButtom: {
                
                break;
            }
    }
}



-(CGSize)measureSinglelineStringSize:(NSString*)str andFont:(UIFont*)wordFont

{
    
    if (str == nil) return CGSizeZero;
    
    CGSize measureSize;
    
    if([[UIDevice currentDevice].systemVersion floatValue] < 7.0){
        
        
        measureSize = [str sizeWithFont:wordFont constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        
    }else{
        
        measureSize = [str boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:wordFont, NSFontAttributeName, nil] context:nil].size;
        
    }
    
    return measureSize;
    
}
- (UIImage *)getImageWithImageName:(NSString *)imageName{
    
    NSBundle *resourceBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[TYProgressHUDView class]] pathForResource:@"TYProgressHUD" ofType:@"bundle"]];
    
    NSString *imgPath = [resourceBundle pathForResource:imageName ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imgPath];
    return image;
}
@end
