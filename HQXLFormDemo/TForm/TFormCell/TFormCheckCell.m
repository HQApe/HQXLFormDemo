//
//  TFormCheckCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormCheckCell.h"
@interface TFormCheckCell ()

@property (strong, nonatomic) UILabel *detailLB;
@property (strong, nonatomic) UIImageView *checkIV;
@end

@implementation TFormCheckCell


+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormCheckCell class] forKey:TFormRowDescriptorTypeBooleanCheck];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.checkIV.tf_right = self.contentView.tf_width - 15;
    self.checkIV.tf_centerY = self.contentView.tf_centerY;
    
    self.detailLB.tf_centerY = self.contentView.tf_centerY;
    self.detailLB.tf_width = self.contentView.tf_width - (self.titleLB.tf_right > self.subTitleLB.tf_right ? self.titleLB.tf_right:self.subTitleLB.tf_right) - 49;
    self.detailLB.tf_right = self.checkIV.tf_left - 11;
}

#pragma mark - XLFormDescriptorCell

- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self configureSubviews];
}

-(void)update
{
    [super update];
    [self updateSubviews];
}

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller
{
    self.rowDescriptor.value = [NSNumber numberWithBool:![self.rowDescriptor.value boolValue]];
    [self.formViewController updateFormRow:self.rowDescriptor];
}
#pragma mark - Private
- (void)configureSubviews {
    [self.contentView addSubview:self.detailLB];
    [self.contentView addSubview:self.checkIV];
}

- (void)updateSubviews {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        self.detailLB.text = config.detail;
        
        self.checkIV.image = [self.rowDescriptor.value boolValue] ? [UIImage tf_svgimageWithName:@"\U0000e602" maskColor:self.themColor] : nil;
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

- (UIImageView *)checkIV {
    if (_checkIV == nil) {
        _checkIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 10)];
    }
    return _checkIV;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
