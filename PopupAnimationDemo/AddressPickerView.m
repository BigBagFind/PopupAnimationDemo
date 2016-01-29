//
//  AddressPickerView.m
//  白海带
//
//  Created by 吴玉铁 on 15/12/25.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "AddressPickerView.h"

@implementation AddressPickerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createViews];
        //[self _addGestureRecognizer];
    }
    return self;
}

- (void)_createViews{
    
    CGFloat verson = 9.0;
    if (verson >= 8.0) {
        // blur效果
        UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        //visualEfView.frame = [UIScreen mainScreen].bounds;
        visualEfView.frame = [UIScreen mainScreen].bounds;
        visualEfView.alpha = 1.0;
        [self addSubview:visualEfView];
    }else {
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
    }
    //主视图
    _mainView = [[UIView alloc]initWithFrame:CGRectMake(16, 230, 320 * 0.95, 320 * 0.3)];
    _mainView.center = CGPointMake(160, 284);
    [self addSubview:_mainView];
    _mainView.backgroundColor = [UIColor whiteColor];
    _mainView.alpha = 0.1;
    //_mainView.userInteractionEnabled = NO;
    //关闭按钮
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.frame = CGRectMake(0, 0, 50, 50);
    _cancelButton.center = CGPointMake(160 * 0.9, 320 * 0.90 - 30);
    [_mainView addSubview:_cancelButton];
    
    [_cancelButton setImage:[UIImage imageNamed:@"ic_close"] forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(restoreSelf) forControlEvents:UIControlEventTouchUpInside];
    //抖动动画
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
     __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf->_mainView.alpha = 0.1;
        strongSelf->_mainView.alpha = 0.1;
        strongSelf->_mainView.frame = CGRectMake(16, 100, 320 * 0.95, 320 * 0.95);
        strongSelf->_mainView.center = CGPointMake(160, 284);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            strongSelf->_mainView.alpha = 1.0;
            strongSelf->_mainView.frame = CGRectMake(32, 100, 320 * 0.90, 320 * 0.90);
            strongSelf->_mainView.center = CGPointMake(160, 284);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                __strong __typeof(weakSelf)strongSelf = weakSelf;
                strongSelf->_mainView.alpha = 1.0;
                strongSelf->_mainView.frame = CGRectMake(32, 100, 320 * 0.92, 320 * 0.92);
                strongSelf->_mainView.center = CGPointMake(160, 284);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1  animations:^{
                    __strong __typeof(weakSelf)strongSelf = weakSelf;
                    strongSelf->_mainView.alpha = 1.0;
                    strongSelf->_mainView.frame = CGRectMake(32, 100, 320 * 0.90, 320 * 0.90);
                    strongSelf->_mainView.center = CGPointMake(160, 284);
                }];
            }];
        }];
        
    }];
}

//添加手势
- (void)_addGestureRecognizer{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(restoreSelf)];
    [self addGestureRecognizer:tap];
}


//消失还原
- (void)restoreSelf{
    //先写个x旋转，然后消失
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf->_cancelButton.transform = CGAffineTransformMakeRotation(M_PI_4);
    } completion:^(BOOL finished) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf->_cancelButton.alpha = 0.0;
        [UIView animateWithDuration:0.3 animations:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            strongSelf->_mainView.alpha = 0.0;
            strongSelf->_mainView.frame = CGRectMake(32, 100, 0, 0);
            strongSelf->_mainView.center = CGPointMake(160, 284);
            
        } completion:^(BOOL finished) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf removeFromSuperview];
        }];

    }];
}


@end
