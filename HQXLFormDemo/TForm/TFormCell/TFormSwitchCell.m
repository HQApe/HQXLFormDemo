//
//  TFormSwitchCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormSwitchCell.h"

@interface TFormSwitchCell ()

@property (strong, nonatomic) UILabel *detailLB;
@property (strong, nonatomic) UISwitch *switchControl;

@end

@implementation TFormSwitchCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormSwitchCell class] forKey:TFormRowDescriptorTypeBooleanSwitch];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.switchControl.tf_right = self.contentView.tf_width - 15;
    self.switchControl.tf_centerY = self.contentView.tf_centerY;
    
    self.detailLB.tf_centerY = self.contentView.tf_centerY;
    self.detailLB.tf_width = self.contentView.tf_width - self.titleLB.tf_right - self.switchControl.tf_width - 36;
    self.detailLB.tf_right = self.switchControl.tf_left - 11;
}

#pragma mark - XLFormDescriptorCell

- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self configureSubviews];
    
}

- (void)update
{
    [super update];
    self.textLabel.text = self.rowDescriptor.title;
    
    [self updateSubviews];
}

#pragma mark - Private
- (void)configureSubviews {
    [self.contentView addSubview:self.detailLB];
    [self.contentView addSubview:self.switchControl];
}

- (void)updateSubviews {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        self.detailLB.text = config.detail;
        self.switchControl.on = [self.rowDescriptor.value boolValue];
        self.switchControl.enabled = !self.rowDescriptor.isDisabled;
    }
    
    if (self.themColor) {
        self.switchControl.onTintColor = self.themColor;
    }
}

- (void)valueChanged
{
    self.rowDescriptor.value = @(self.switchControl.on);
}

#pragma mark - Property

- (UILabel *)detailLB {
    if (_detailLB == nil) {
        _detailLB = [[UILabel alloc] initWithFrame:CGRectMake(KTFScreenW - 180, 15, KTFScreenW * 0.3, 20)];
        _detailLB.font = [UIFont systemFontOfSize:17];
        _detailLB.textColor = [UIColor tf_colorWithHexString:@"999999"];
        _detailLB.textAlignment = NSTextAlignmentRight;
    }
    return _detailLB;
}

- (UISwitch *)switchControl {
    if (_switchControl == nil) {
        _switchControl = [[UISwitch alloc] init];
        _switchControl.onTintColor = [UIColor tf_colorWithHexString:@"24C77E"];
        [_switchControl addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    }
    return _switchControl;
}


@end
