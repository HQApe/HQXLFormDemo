//
//  TFormRowDescriptor.h
//  HQXLFormDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "XLFormRowDescriptor.h"

@interface TFormRowDescriptorConfig : NSObject

@property (nonatomic, copy, readonly) NSString *icon;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *subTitle;
@property (nonatomic, copy, readonly) NSString *detail;
@property (nonatomic, copy, readonly) void(^showAction)(NSIndexPath *);

+ (instancetype)configWithIcon:(NSString *)iconName
                         title:(NSString *)title
                      subTitle:(NSString *)subTitle;

+ (instancetype)configWithIcon:(NSString *)iconName
                         title:(NSString *)title
                      subTitle:(NSString *)subTitle
                        action:(void(^)(NSIndexPath *indexPath))action;

+ (instancetype)configWithIcon:(NSString *)iconName
                         title:(NSString *)title
                      subTitle:(NSString *)subTitle
                        detail:(NSString *)detail
                    action:(void(^)(NSIndexPath *indexPath))action;

@end

@interface TFormRowDescriptor : XLFormRowDescriptor

@property (strong, nonatomic, readonly) TFormRowDescriptorConfig *rowConfig;

+ (instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType rowConfig:(TFormRowDescriptorConfig *)config;

@end
