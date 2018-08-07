//
//  TFormSliderCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormSliderCell.h"


@interface TFormSliderCell ()

@property (strong, nonatomic) UISlider *slider;
@property (strong, nonatomic) UIImageView *leftIV;
@property (strong, nonatomic) UIImageView *rightIV;

@end

@implementation TFormSliderCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormSliderCell class] forKey:TFormRowDescriptorTypeSlider];
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormSliderCell class] forKey:TFormRowDescriptorTypeSliderVoice];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([self.rowDescriptor.rowType isEqualToString:TFormRowDescriptorTypeSlider]){
        self.leftIV.hidden = YES;
        self.rightIV.hidden = YES;
        self.slider.tf_left = 15;
        self.slider.tf_width = self.contentView.tf_width - 30;
        self.slider.tf_centerY = self.contentView.tf_centerY;
    }
    else {
        self.leftIV.hidden = NO;
        self.rightIV.hidden = NO;
        self.leftIV.tf_left = 15;
        self.leftIV.tf_centerY = self.contentView.tf_centerY;
        self.rightIV.tf_right = self.contentView.tf_width - 15;
        self.rightIV.tf_centerY = self.contentView.tf_centerY;
        
        self.slider.tf_left = self.leftIV.tf_right + 15;
        self.slider.tf_width = self.rightIV.tf_left - self.slider.tf_left - 8;
        self.slider.tf_centerY = self.contentView.tf_centerY;
    }
}

#pragma mark - XLFormDescriptorCell

- (void)configure
{
    [super configure];
    
    [self.contentView addSubview:self.slider];
    [self.contentView addSubview:self.leftIV];
    [self.contentView addSubview:self.rightIV];
    
    [self valueChanged:nil];
}

-(void)update {
    
    [super update];
    self.textLabel.text = self.rowDescriptor.title;
    self.slider.value = [self.rowDescriptor.value floatValue];
    self.slider.enabled = !self.rowDescriptor.isDisabled;
    if (self.themColor) {
        self.slider.minimumTrackTintColor = self.themColor;
    }
    [self valueChanged:nil];
    
    self.leftIV.image = [UIImage tf_svgimageWithName:@"\U0000e604" maskColor:self.themColor];
    self.rightIV.image = [UIImage tf_svgimageWithName:@"\U0000e607" maskColor:self.themColor];
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor {
    return 50;
}

#pragma mark - Private
-(void)valueChanged:(UISlider*)_slider {
    self.rowDescriptor.value = @(self.slider.value);
    if (self.slider.value <= 0) {
        //声音图标的变化
    }
}

#pragma mark - Property
- (UISlider *)slider {
    if (_slider == nil) {
        _slider = [[UISlider alloc] init];
        _slider.minimumTrackTintColor = [UIColor tf_colorWithHexString:@"24C77E"];
        _slider.maximumTrackTintColor = [UIColor tf_colorWithHexString:@"C7C7CC"];
        [_slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

- (UIImageView *)leftIV {
    if (_leftIV == nil) {
        _leftIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
    }
    return _leftIV;
}

- (UIImageView *)rightIV {
    if (_rightIV == nil) {
        _rightIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 22)];
    }
    return _rightIV;
}

@end
