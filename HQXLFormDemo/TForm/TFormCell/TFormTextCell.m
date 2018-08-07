//
//  TFormTextCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/1.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormTextCell.h"
#import "TFormCommon.h"

@interface TFormTextCell()

@property (strong, nonatomic) UILabel *detailLB;

@end

@implementation TFormTextCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[TFormTextCell class] forKey:TFormRowDescriptorTypeDisplayOnly];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.detailLB.tf_width = self.contentView.tf_width - (self.titleLB.tf_right > self.subTitleLB.tf_right ? self.titleLB.tf_right:self.subTitleLB.tf_right) - 25;
    self.detailLB.tf_right = self.contentView.tf_width - 15;
    self.detailLB.tf_centerY = self.contentView.tf_centerY;
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

- (void)configureSubviews {

    [self.contentView addSubview:self.detailLB];
}

- (void)updateSubviews {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        self.detailLB.text = config.detail;
    }
}

#pragma mark - property

- (UILabel *)detailLB {
    if (_detailLB == nil) {
        _detailLB = [[UILabel alloc] initWithFrame:CGRectMake(375 - 180, 15, 90, 20)];
        _detailLB.font = [UIFont systemFontOfSize:17];
        _detailLB.textColor = [UIColor tf_colorWithHexString:@"999999"];
        _detailLB.textAlignment = NSTextAlignmentRight;
    }
    return _detailLB;
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
