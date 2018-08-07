//
//  TFormSelectorCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormSelectorCell.h"
#import <SVGKit/SVGKit.h>

static XLFormRowDescriptor *selectedRow;

@interface TFormSelectorCell ()
@property (strong, nonatomic) UILabel *detailLB;
@property (strong, nonatomic) UIImageView *selectedIV;


@end

@implementation TFormSelectorCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormSelectorCell class] forKey:TFormRowDescriptorTypeSelector];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.selectedIV.tf_right = self.contentView.tf_width - 15;
    self.selectedIV.tf_centerY = self.contentView.tf_centerY;
    
    self.detailLB.tf_centerY = self.contentView.tf_centerY;
    self.detailLB.tf_width = self.contentView.tf_width - (self.titleLB.tf_right > self.subTitleLB.tf_right ? self.titleLB.tf_right:self.subTitleLB.tf_right) - 58;
    self.detailLB.tf_right = self.selectedIV.tf_left - 11;
}

#pragma mark - XLFormDescriptorCell

- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self configureSubviews];
}

- (void)dealloc {
    selectedRow = nil;
}

-(void)update
{
    [super update];
    [self updateSubviews];
}

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    self.rowDescriptor.value = @(YES);
    [self.formViewController updateFormRow:self.rowDescriptor];
    if (selectedRow && selectedRow != self.rowDescriptor) {
        [self.formViewController deselectFormRow:selectedRow];
        selectedRow.value = @(NO);
        [self.formViewController updateFormRow:selectedRow];
    }
    selectedRow = self.rowDescriptor;
}
#pragma mark - Private
- (void)configureSubviews {
    [self.contentView addSubview:self.detailLB];
    [self.contentView addSubview:self.selectedIV];
}

- (void)updateSubviews {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        self.detailLB.text = config.detail;
        NSString *imageName = [self.rowDescriptor.value boolValue] ? @"tf_selected" : @"tf_select";
        self.selectedIV.image = [UIImage tf_svgimageWithName:imageName maskColor:self.themColor];;
    }
}

#pragma mark - property

- (UILabel *)detailLB {
    if (_detailLB == nil) {
        _detailLB = [[UILabel alloc] initWithFrame:CGRectMake(KTFScreenW - 180, 15, KTFScreenW * 0.3, 20)];
        _detailLB.font = [UIFont systemFontOfSize:17];
        _detailLB.textColor = [UIColor tf_colorWithHexString:@"999999"];
        _detailLB.textAlignment = NSTextAlignmentRight;
    }
    return _detailLB;
}

- (UIImageView *)selectedIV {
    if (_selectedIV == nil) {
        _selectedIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    }
    return _selectedIV;
}

@end
