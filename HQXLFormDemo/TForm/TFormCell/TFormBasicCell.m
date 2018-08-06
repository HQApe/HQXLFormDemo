//
//  TFormBasicCell.m
//  HQXLFormDemo
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TFormBasicCell.h"

@interface TFormBasicCell()

@end

@implementation TFormBasicCell

#pragma mark - XLFormDescriptorCell

- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLB];
    [self.contentView addSubview:self.subTitleLB];
}

-(void)update
{
    [super update];
    [self configData];
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor {
    if ([rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)rowDescriptor).rowConfig;
        if (config.subTitle.length) {
            return 64;
        }
    }
    
    return 50;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        CGFloat centerY = self.contentView.tf_centerY;
        if (config.subTitle.length) {
            if (config.icon.length) {
                self.iconView.tf_left = 15;
                self.iconView.tf_size = CGSizeMake(44, 44);
                self.iconView.tf_centerY = centerY;
                
                self.titleLB.tf_top = 9;
                [self.titleLB tf_autoFitWidth:KTFScreenW - 190];
                self.titleLB.tf_left = self.iconView.tf_right + 15;
            }else {
                self.iconView.hidden = YES;
                
                self.titleLB.tf_top = 9;
                [self.titleLB tf_autoFitWidth:KTFScreenW - 130];
                self.titleLB.tf_left = 15;
            }
            self.subTitleLB.tf_left = self.titleLB.tf_left;
            self.subTitleLB.tf_top = self.titleLB.tf_bottom;
            
        }else {
            self.subTitleLB.hidden = YES;
            
            if (config.icon.length) {
                self.iconView.tf_left = 15;
                self.iconView.tf_size = CGSizeMake(30, 30);
                self.iconView.tf_centerY = centerY;
                
                self.titleLB.tf_left = self.iconView.tf_right + 15;
                [self.titleLB tf_autoFitWidth:KTFScreenW - 190];
                self.titleLB.tf_centerY = centerY;
            }else {
                self.iconView.hidden = YES;
                [self.titleLB tf_autoFitWidth:KTFScreenW - 130];
                self.titleLB.tf_left = 15;
                self.titleLB.tf_centerY = centerY;
            }
        }
    }
    
}

#pragma mark - Private
- (void)configData {
    if ([self.rowDescriptor isKindOfClass:[TFormRowDescriptor class]]) {
        TFormRowDescriptorConfig *config = ((TFormRowDescriptor *)self.rowDescriptor).rowConfig;
        self.iconView.image = config.icon.length ? [UIImage imageNamed:config.icon] : nil;
        self.titleLB.text = config.title;
        self.subTitleLB.text = config.subTitle;
    }
}

#pragma mark - property
- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 44, 44)];
    }
    return _iconView;
}

- (UILabel *)titleLB {
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc] initWithFrame:CGRectMake(74, 10, 100, 24)];
        _titleLB.font = [UIFont systemFontOfSize:17];
        _titleLB.textColor = [UIColor tf_colorWithHexString:@"333333"];
    }
    return _titleLB;
}

- (UILabel *)subTitleLB {
    if (_subTitleLB == nil) {
        _subTitleLB = [[UILabel alloc] initWithFrame:CGRectMake(74, 34, 100, 21)];
        _subTitleLB.font = [UIFont systemFontOfSize:15];
        _subTitleLB.textColor = [UIColor tf_colorWithHexString:@"999999"];
    }
    return _subTitleLB;
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
