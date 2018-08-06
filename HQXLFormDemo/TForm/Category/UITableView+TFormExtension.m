//
//  UITableView+TFormExtension.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UITableView+TFormExtension.h"

@implementation UITableView (TFormExtension)

+ (void)load {
    
    if (@available(ios 11.0, *)) {
        UITableView.appearance.estimatedRowHeight = CGFLOAT_MIN;
        UITableView.appearance.estimatedSectionFooterHeight = CGFLOAT_MIN;
        UITableView.appearance.estimatedSectionHeaderHeight = CGFLOAT_MIN;
    }
}

@end
