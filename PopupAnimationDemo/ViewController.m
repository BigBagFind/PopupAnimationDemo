//
//  ViewController.m
//  PopupAnimationDemo
//
//  Created by 吴玉铁 on 16/1/26.
//  Copyright © 2016年 铁哥. All rights reserved.
//

#import "ViewController.h"
#import "AddressPickerView.h"


@interface ViewController (){
    UIView *_bgView;
    UIView *_testView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
      
}



- (IBAction)popUpAction:(UIButton *)sender {
    AddressPickerView *pickerView = [[AddressPickerView alloc]initWithFrame:CGRectMake(0, 568, 320, 568)];
    [[UIApplication sharedApplication].keyWindow addSubview:pickerView];
    pickerView.frame = CGRectMake(0, 0, 320, 568);

 

}


@end
