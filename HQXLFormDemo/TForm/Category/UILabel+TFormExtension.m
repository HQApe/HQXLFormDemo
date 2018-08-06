//
//  UILabel+TFormExtension.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UILabel+TFormExtension.h"
#import "TFormCommon.h"
@implementation UILabel (TFormExtension)
- (void)tf_autoFitWidth:(CGFloat)width {
    
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    CGRect frame = self.frame;
    frame.size.width = size.width;
    self.frame = frame;
}
@end
