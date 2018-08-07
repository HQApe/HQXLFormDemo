//
//  TFormStepperCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormStepperCountCell.h"

@interface TFormStepperCountCell ()

@property (strong, nonatomic) UILabel *detailLB;
@property (nonatomic) UIStepper *stepControl;

@end

@implementation TFormStepperCountCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormStepperCountCell class] forKey:TFormRowDescriptorTypeStepCounter];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.stepControl.tf_right = self.contentView.tf_width - 15;
    self.stepControl.tf_centerY = self.contentView.tf_centerY;
    
    self.detailLB.tf_centerY = self.contentView.tf_centerY;
    self.detailLB.tf_width = self.contentView.tf_width - (self.titleLB.tf_right > self.subTitleLB.tf_right ? self.titleLB.tf_right:self.subTitleLB.tf_right) - self.stepControl.tf_width - 36;
    self.detailLB.tf_right = self.stepControl.tf_left - 11;
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
    [self.contentView addSubview:self.stepControl];
}

- (void)updateSubviews {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        
        self.stepControl.value = [self.rowDescriptor.value doubleValue];
        self.detailLB.text = self.rowDescriptor.value ? [NSString stringWithFormat:@"%@", self.rowDescriptor.value] : nil;
        self.stepControl.enabled = !self.rowDescriptor.isDisabled;
    }
    if (self.themColor) {
        self.stepControl.tintColor = self.themColor;
    }
}

#pragma mark - Events

- (void)valueChanged:(id)sender
{
    UIStepper *stepper = self.stepControl;
    
    self.rowDescriptor.value = @(stepper.value);
    self.detailLB.text = [NSString stringWithFormat:@"%.f", stepper.value];
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

- (UIStepper *)stepControl
{
    if (!_stepControl) {
        _stepControl = [[UIStepper alloc] init];
        _stepControl.tintColor = [UIColor tf_colorWithHexString:@"24C77E"];
        [_stepControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _stepControl;
}

@end
