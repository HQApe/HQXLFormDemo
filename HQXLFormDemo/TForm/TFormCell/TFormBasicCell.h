//
//  TFormBasicCell.h
//  HQXLFormDemo
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "XLFormBaseCell.h"
#import "TFormCommon.h"

@interface TFormBasicCell : XLFormBaseCell

@property (strong, nonatomic) UIColor *themColor;
@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UILabel *titleLB;
@property (strong, nonatomic) UILabel *subTitleLB;
@property (strong, nonatomic) UIView *bottomLine;

@end
