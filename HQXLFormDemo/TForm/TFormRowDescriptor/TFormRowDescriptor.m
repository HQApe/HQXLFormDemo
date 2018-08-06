//
//  TFormRowDescriptor.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormRowDescriptor.h"

@interface TFormRowDescriptorConfig ()

@end

@implementation TFormRowDescriptorConfig

+ (instancetype)configWithIcon:(NSString *)iconName
                         title:(NSString *)title
                      subTitle:(NSString *)subTitle
{
    return [self configWithIcon:iconName title:title subTitle:subTitle action:nil];
}

+ (instancetype)configWithIcon:(NSString *)iconName
                         title:(NSString *)title
                      subTitle:(NSString *)subTitle
                        action:(void(^)(NSIndexPath *indexPath))action
{
    return [self configWithIcon:iconName title:title subTitle:subTitle detail:nil action:action];
}

+ (instancetype)configWithIcon:(NSString *)iconName
                         title:(NSString *)title
                      subTitle:(NSString *)subTitle
                        detail:(NSString *)detail
                        action:(void(^)(NSIndexPath *indexPath))action
{
    TFormRowDescriptorConfig *config = [[TFormRowDescriptorConfig alloc] init];
    config->_icon = iconName;
    config->_title = title;
    config->_subTitle = subTitle;
    config->_detail = detail;
    config->_showAction = action;
    
    return config;
}

@end

@interface TFormRowDescriptor ()

@end

@implementation TFormRowDescriptor

+ (instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType rowConfig:(TFormRowDescriptorConfig *)config {
    
    
    TFormRowDescriptor *rowDescriptor = [self formRowDescriptorWithTag:tag rowType:rowType title:nil];
    rowDescriptor->_rowConfig = config;
    return rowDescriptor;
}

@end
