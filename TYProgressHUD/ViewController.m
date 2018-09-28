//
//  ViewController.m
//  TYProgressHUD
//
//  Created by 吴海瑞 on 2018/9/20.
//  Copyright © 2018年 海瑞. All rights reserved.
//

#import "ViewController.h"
#import "TYProgressHUD.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSInteger index;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    if (index == 0){
//        [TYProgressHUD showSuccess:@"成功~~~成功~~~成功~~~" zoom: YES shadow:YES];
//    }else if (index == 1){
//        [TYProgressHUD showFailure:@"失败~~~" zoom:YES shadow:YES];
//    }else if (index == 2){
//        [TYProgressHUD showWarning:@"警告" zoom:YES shadow:YES];
//    }else if (index == 3){
//
//    }else if (index == 4){
//        
//    }
//    index ++;
//    [TYProgressHUD  showLoading:@""];
    
    [TYProgressHUD showText:@"已无更多博主信息" Location:TYProgressHUDViewTop zoom:true shadow:true];
//    [TYProgressHUD showText:@"已无更多博主信息" Location:TYProgressHUDViewCenter zoom:true shadow:true];
//    [TYProgressHUD showWarning:@"已无更多博主信息" zoom:YES shadow:YES];
//    [TYProgressHUD showSuccess:@"已无更多博主信息" zoom:YES shadow:YES];
    [TYProgressHUD showFailure:@"已无更多博主信息" zoom:YES shadow:YES];
//    [TYProgressHUD showLoading:@"" inView:self.view];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [TYProgressHUD hideInKeyWindow];
//    });
    
}
@end
